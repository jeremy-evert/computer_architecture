from __future__ import annotations

import importlib
import platform
import shutil
import subprocess
import tempfile
from pathlib import Path
from typing import Any

from .common import utc_iso


def _which(name: str) -> str | None:
    return shutil.which(name)


def _version(cmd: list[str]) -> str | None:
    try:
        cp = subprocess.run(cmd, capture_output=True, text=True, timeout=5, check=False)
        text = (cp.stdout or cp.stderr).strip().splitlines()
        return text[0] if cp.returncode == 0 and text else None
    except (OSError, subprocess.SubprocessError):
        return None


def _openmp_probe() -> tuple[bool, str]:
    gcc = _which("gcc")
    if not gcc:
        return False, "gcc missing"
    source = '#include <omp.h>\n#include <stdio.h>\nint main(void){printf("%d\\n", omp_get_max_threads());return 0;}\n'
    try:
        with tempfile.TemporaryDirectory() as td:
            src = Path(td) / "omp.c"
            exe = Path(td) / "omp"
            src.write_text(source)
            cp = subprocess.run([gcc, "-O2", "-fopenmp", str(src), "-o", str(exe)], capture_output=True, text=True, timeout=15)
            if cp.returncode != 0:
                return False, cp.stderr.strip()[-400:]
            run = subprocess.run([str(exe)], capture_output=True, text=True, timeout=10)
            return run.returncode == 0, (run.stdout.strip() or run.stderr.strip())
    except (OSError, subprocess.SubprocessError) as exc:
        return False, str(exc)


def check() -> dict[str, Any]:
    tools = {
        "gcc": _which("gcc"),
        "make": _which("make"),
        "objdump": _which("objdump"),
        "readelf": _which("readelf"),
        "file": _which("file"),
        "gdb": _which("gdb"),
        "lldb": _which("lldb"),
        "clang": _which("clang"),
        "llvm-objdump": _which("llvm-objdump"),
        "latexmk": _which("latexmk"),
        "pdflatex": _which("pdflatex"),
        "tectonic": _which("tectonic"),
        "docker": _which("docker"),
        "podman": _which("podman"),
        "mpicc": _which("mpicc"),
        "qemu-riscv32": _which("qemu-riscv32"),
        "qemu-riscv64": _which("qemu-riscv64"),
    }
    try:
        mpl = importlib.import_module("matplotlib")
        mpl_version = getattr(mpl, "__version__", "present")
    except Exception as exc:  # noqa: BLE001 - receipt should report import failure
        mpl_version = None
        mpl_error = str(exc)
    else:
        mpl_error = None
    omp_ok, omp_note = _openmp_probe()
    required = {
        "python_3_10_plus": tuple(map(int, platform.python_version_tuple()[:2])) >= (3, 10),
        "native_c_compiler": bool(tools["gcc"]),
        "binary_inspection": bool(tools["objdump"] and tools["readelf"] and tools["file"]),
        "debugger_state_inspection": bool(tools["gdb"] or tools["lldb"]),
        "plotting": bool(mpl_version),
        "riscv_cross_compile": bool(tools["clang"] and tools["llvm-objdump"]),
        "pdf_build": bool(tools["latexmk"] and tools["pdflatex"]) or bool(tools["tectonic"]),
        "openmp": omp_ok,
    }
    missing = [name for name, ok in required.items() if not ok]
    return {
        "schema": "swosu.archlab.doctor/v1",
        "timestamp_utc": utc_iso(),
        "platform": platform.platform(),
        "python": platform.python_version(),
        "tools": tools,
        "versions": {
            "gcc": _version([tools["gcc"], "--version"]) if tools["gcc"] else None,
            "clang": _version([tools["clang"], "--version"]) if tools["clang"] else None,
            "matplotlib": mpl_version,
        },
        "matplotlib_error": mpl_error,
        "openmp_probe": {"pass": omp_ok, "note": omp_note},
        "required_checks": required,
        "status": "PASS" if all(required.values()) else "FAIL",
        "missing_required": missing,
        "next_step": "Laboratory ready." if not missing else "Use the supported course Experimental Chamber or fallback evidence path. Do not improvise administrator/root changes unless explicit course instructions authorize them.",
        "optional": {
            "gdb": bool(tools["gdb"]),
            "lldb": bool(tools["lldb"]),
            "container_runtime": bool(tools["docker"] or tools["podman"]),
            "mpi": bool(tools["mpicc"]),
            "qemu_riscv": bool(tools["qemu-riscv32"] or tools["qemu-riscv64"]),
            "tectonic": bool(tools["tectonic"]),
        },
    }
