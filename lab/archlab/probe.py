from __future__ import annotations

import json
import os
import platform
import shutil
import subprocess
from pathlib import Path
from typing import Any

from . import __version__
from .common import utc_iso


def _run(args: list[str]) -> str | None:
    try:
        cp = subprocess.run(args, capture_output=True, text=True, timeout=5, check=False)
        if cp.returncode == 0:
            return cp.stdout.strip()
    except (OSError, subprocess.SubprocessError):
        pass
    return None


def _linux_os_release() -> dict[str, str]:
    out: dict[str, str] = {}
    p = Path("/etc/os-release")
    if not p.exists():
        return out
    for line in p.read_text(encoding="utf-8", errors="replace").splitlines():
        if "=" not in line:
            continue
        k, v = line.split("=", 1)
        out[k] = v.strip().strip('"')
    return out


def _environment_scope() -> dict[str, Any]:
    system = platform.system().lower()
    scope = "host-visible"
    notes: list[str] = []
    if system == "linux":
        version_text = ""
        try:
            version_text = Path("/proc/version").read_text(errors="replace").lower()
        except OSError:
            pass
        if "microsoft" in version_text or "wsl" in version_text:
            scope = "wsl-visible"
            notes.append("WSL virtualizes some host resources; values describe the WSL-visible machine unless independently verified.")
        if Path("/.dockerenv").exists():
            scope = "container-visible"
            notes.append("Running inside a container; CPU/memory/storage visibility may differ from the physical host.")
        try:
            cgroup = Path("/proc/1/cgroup").read_text(errors="replace").lower()
            if any(x in cgroup for x in ("docker", "kubepods", "containerd", "podman")):
                scope = "container-visible"
                if not notes:
                    notes.append("Container control groups detected; values may differ from the physical host.")
        except OSError:
            pass
    return {"scope": scope, "notes": notes}


def _linux_cpu() -> dict[str, Any]:
    data: dict[str, Any] = {}
    raw = _run(["lscpu", "-J"])
    if raw:
        try:
            obj = json.loads(raw)
            fields = {item.get("field", "").rstrip(":"): item.get("data") for item in obj.get("lscpu", [])}
            mapping = {
                "Architecture": "architecture",
                "CPU(s)": "logical_processors",
                "Core(s) per socket": "cores_per_socket",
                "Socket(s)": "sockets",
                "Model name": "model",
                "Vendor ID": "vendor",
                "Thread(s) per core": "threads_per_core",
                "Byte Order": "byte_order",
            }
            for source, dest in mapping.items():
                if fields.get(source) not in (None, ""):
                    data[dest] = fields[source]
        except json.JSONDecodeError:
            pass
    if "architecture" not in data:
        data["architecture"] = platform.machine() or "unknown"
    return data


def _linux_caches() -> list[dict[str, Any]]:
    base = Path("/sys/devices/system/cpu/cpu0/cache")
    caches: list[dict[str, Any]] = []
    if not base.exists():
        return caches
    for idx in sorted(base.glob("index*")):
        item: dict[str, Any] = {}
        for name in ("level", "type", "size", "coherency_line_size", "ways_of_associativity", "number_of_sets", "shared_cpu_list"):
            p = idx / name
            try:
                item[name] = p.read_text().strip()
            except OSError:
                pass
        if item:
            caches.append(item)
    return caches


def _visible_memory() -> dict[str, Any]:
    if platform.system() == "Linux":
        try:
            for line in Path("/proc/meminfo").read_text().splitlines():
                if line.startswith("MemTotal:"):
                    kib = int(line.split()[1])
                    return {"bytes": kib * 1024, "source": "/proc/meminfo"}
        except (OSError, ValueError, IndexError):
            pass
    try:
        pages = os.sysconf("SC_PHYS_PAGES")
        page_size = os.sysconf("SC_PAGE_SIZE")
        return {"bytes": int(pages) * int(page_size), "source": "sysconf"}
    except (ValueError, OSError, AttributeError):
        return {"bytes": None, "source": "not exposed"}


def _storage() -> dict[str, Any]:
    try:
        usage = shutil.disk_usage(Path.cwd().anchor or "/")
        return {
            "visible_filesystem_total_bytes": usage.total,
            "visible_filesystem_free_bytes": usage.free,
            "scope": "current-root-filesystem",
            "note": "This is filesystem capacity visible to the process, not a physical-drive inventory.",
        }
    except OSError:
        return {"scope": "unknown", "note": "filesystem capacity unavailable"}


def _gpu_presence() -> dict[str, Any]:
    nvidia = shutil.which("nvidia-smi")
    if nvidia:
        out = _run([nvidia, "--query-gpu=name,memory.total", "--format=csv,noheader,nounits"])
        if out:
            devices = []
            for line in out.splitlines():
                parts = [x.strip() for x in line.split(",", 1)]
                devices.append({"name": parts[0], "memory_mib": parts[1] if len(parts) > 1 else None})
            return {"detected": True, "vendor": "nvidia", "devices": devices, "scope": "visible-to-current-environment"}
    return {"detected": False, "scope": "not detected; absence is not proof the physical host has no accelerator"}


def snapshot() -> dict[str, Any]:
    env = _environment_scope()
    system = platform.system()
    os_info: dict[str, Any] = {
        "system": system,
        "release": platform.release(),
        "machine": platform.machine(),
    }
    if system == "Linux":
        rel = _linux_os_release()
        if rel:
            os_info["distribution"] = rel.get("PRETTY_NAME", rel.get("NAME"))
    cpu = _linux_cpu() if system == "Linux" else {
        "architecture": platform.machine() or "unknown",
        "model": platform.processor() or "not exposed",
    }
    caches = _linux_caches() if system == "Linux" else []
    return {
        "schema": "swosu.archprobe.snapshot/v1",
        "timestamp_utc": utc_iso(),
        "probe_version": __version__,
        "scope": env,
        "os": os_info,
        "cpu": cpu,
        "caches": caches,
        "memory": _visible_memory(),
        "storage": _storage(),
        "accelerator": _gpu_presence(),
        "privacy": {
            "intentionally_omitted": ["username", "home_path", "serial_numbers", "mac_addresses", "public_ip", "device_ids"]
        },
    }


def human_summary(data: dict[str, Any]) -> str:
    cpu = data.get("cpu", {})
    mem = data.get("memory", {}).get("bytes")
    gib = f"{mem / (1024**3):.1f} GiB" if isinstance(mem, int) else "unknown"
    lines = [
        "SWOSU Architecture Observatory",
        f"Scope: {data.get('scope', {}).get('scope', 'unknown')}",
        f"OS: {data.get('os', {}).get('distribution') or data.get('os', {}).get('system', 'unknown')}",
        f"Architecture: {cpu.get('architecture', 'unknown')}",
        f"CPU: {cpu.get('model', 'not exposed')}",
        f"Logical processors: {cpu.get('logical_processors', 'not exposed')}",
        f"Visible memory: {gib}",
        f"Cache records: {len(data.get('caches', []))}",
        f"Accelerator visible: {data.get('accelerator', {}).get('detected', False)}",
    ]
    for note in data.get("scope", {}).get("notes", []):
        lines.append(f"NOTE: {note}")
    return "\n".join(lines) + "\n"
