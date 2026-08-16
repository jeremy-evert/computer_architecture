from __future__ import annotations

import csv
import shutil
import socket
import subprocess
import threading
import time
from pathlib import Path
from typing import Any

from .common import ensure_dir, lab_root, utc_iso, write_json


def _compile(source: Path, exe: Path, extra: list[str] | None = None) -> None:
    gcc = shutil.which("gcc")
    if not gcc:
        raise RuntimeError("gcc is required in the Experimental Chamber")
    cmd = [gcc, "-O2", "-std=c11", "-Wall", "-Wextra", str(source), "-o", str(exe)] + (extra or [])
    cp = subprocess.run(cmd, capture_output=True, text=True)
    if cp.returncode != 0:
        raise RuntimeError(f"compile failed: {' '.join(cmd)}\n{cp.stderr}")


def _run_to_csv(exe: Path, csv_path: Path, args: list[str] | None = None) -> None:
    cp = subprocess.run([str(exe)] + (args or []), capture_output=True, text=True, timeout=120)
    if cp.returncode != 0:
        raise RuntimeError(cp.stderr)
    csv_path.write_text(cp.stdout, encoding="utf-8")


def run_memory(out_dir: Path) -> dict[str, Any]:
    out_dir = ensure_dir(out_dir)
    exe = out_dir / "memory-sensory"
    csv_path = out_dir / "memory.csv"
    _compile(lab_root() / "experiments" / "memory.c", exe)
    _run_to_csv(exe, csv_path)
    rows = list(csv.DictReader(csv_path.open()))
    payload = {
        "schema": "swosu.archlab.experiment/v1",
        "experiment": "memory",
        "timestamp_utc": utc_iso(),
        "data": csv_path.name,
        "rows": len(rows),
        "interpretation_scope": "Measures this process on this run. Scheduler, prefetch, cache/TLB behavior and virtualization can affect shape; compare trends, not laptop rankings.",
        "status": "PASS" if len(rows) >= 8 else "FAIL",
    }
    write_json(out_dir / "memory-receipt.json", payload)
    return payload


def run_scaling(out_dir: Path, work: int = 12_000_000) -> dict[str, Any]:
    out_dir = ensure_dir(out_dir)
    exe = out_dir / "scaling-sensory"
    csv_path = out_dir / "scaling.csv"
    _compile(lab_root() / "experiments" / "scaling.c", exe, ["-fopenmp"])
    _run_to_csv(exe, csv_path, [str(work)])
    rows = list(csv.DictReader(csv_path.open()))
    payload = {
        "schema": "swosu.archlab.experiment/v1",
        "experiment": "scaling",
        "timestamp_utc": utc_iso(),
        "data": csv_path.name,
        "rows": len(rows),
        "work_items": work,
        "interpretation_scope": "Shared-memory scaling experiment. Thread placement, CPU quotas, frequency scaling and other work on the machine may affect results.",
        "status": "PASS" if len(rows) >= 1 else "FAIL",
    }
    write_json(out_dir / "scaling-receipt.json", payload)
    return payload



def run_dependency(out_dir: Path, updates: int = 40_000_000) -> dict[str, Any]:
    out_dir = ensure_dir(out_dir)
    exe = out_dir / "dependency-sensory"
    csv_path = out_dir / "dependency.csv"
    _compile(lab_root() / "experiments" / "dependency.c", exe)
    _run_to_csv(exe, csv_path, [str(updates)])
    rows = list(csv.DictReader(csv_path.open()))
    payload = {
        "schema": "swosu.archlab.experiment/v1",
        "experiment": "dependency",
        "timestamp_utc": utc_iso(),
        "data": csv_path.name,
        "rows": len(rows),
        "updates": updates,
        "interpretation_scope": "Contrasts one dependency chain with four independent chains on the same CPU. It is evidence about dependency/available overlap in this generated loop, not a direct measurement of pipeline stage count.",
        "status": "PASS" if {r["mode"] for r in rows} == {"dependent", "independent4"} else "FAIL",
    }
    write_json(out_dir / "dependency-receipt.json", payload)
    return payload


def run_vector(out_dir: Path, items: int = 8_000_000) -> dict[str, Any]:
    out_dir = ensure_dir(out_dir)
    source = lab_root() / "experiments" / "vector.c"
    scalar = out_dir / "vector-scalar"
    auto = out_dir / "vector-auto"
    _compile(source, scalar, ["-O3", "-fno-tree-vectorize"])
    gcc = shutil.which("gcc")
    if not gcc:
        raise RuntimeError("gcc is required")
    report = out_dir / "vectorization-report.txt"
    cp = subprocess.run([gcc, "-O3", "-march=native", "-fopt-info-vec-optimized", str(source), "-o", str(auto)], capture_output=True, text=True)
    if cp.returncode != 0:
        raise RuntimeError(cp.stderr)
    report.write_text(cp.stderr or cp.stdout or "No compiler vectorization remarks emitted.\n", encoding="utf-8")
    rows = []
    for mode, exe in (("scalar_no_vectorize", scalar), ("compiler_native", auto)):
        cp = subprocess.run([str(exe), str(items)], capture_output=True, text=True, timeout=120)
        if cp.returncode != 0:
            raise RuntimeError(cp.stderr)
        n, seconds, checksum = cp.stdout.strip().split(",")
        rows.append({"mode": mode, "items": n, "seconds": seconds, "checksum": checksum})
    csv_path = out_dir / "vector.csv"
    with csv_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys())); writer.writeheader(); writer.writerows(rows)
    payload = {
        "schema": "swosu.archlab.experiment/v1",
        "experiment": "vector",
        "timestamp_utc": utc_iso(),
        "data": csv_path.name,
        "rows": len(rows),
        "items": items,
        "vectorization_report": report.name,
        "interpretation_scope": "CPU-only comparison of the same vectorizable loop compiled with vectorization disabled vs native optimization enabled. Compiler reports/disassembly should be consulted before claiming SIMD caused any observed difference.",
        "status": "PASS" if len(rows) == 2 else "FAIL",
    }
    write_json(out_dir / "vector-receipt.json", payload)
    return payload

def _serve(sock: socket.socket, messages: int, delay_s: float, reply_bytes: int) -> None:
    try:
        for _ in range(messages):
            header = b""
            while len(header) < 4:
                chunk = sock.recv(4 - len(header))
                if not chunk: return
                header += chunk
            n = int.from_bytes(header, "big")
            remaining = n
            while remaining:
                chunk = sock.recv(min(65536, remaining))
                if not chunk: return
                remaining -= len(chunk)
            if delay_s:
                time.sleep(delay_s)
            sock.sendall(reply_bytes.to_bytes(4, "big") + b"A" * reply_bytes)
    finally:
        sock.close()


def _channel_trial(messages: int, bytes_per_message: int, delay_ms: float) -> float:
    client, server = socket.socketpair()
    thread = threading.Thread(target=_serve, args=(server, messages, delay_ms / 1000.0, 1), daemon=True)
    thread.start()
    payload = b"X" * bytes_per_message
    t0 = time.perf_counter()
    for _ in range(messages):
        client.sendall(len(payload).to_bytes(4, "big") + payload)
        header = client.recv(4)
        n = int.from_bytes(header, "big")
        got = 0
        while got < n:
            got += len(client.recv(n - got))
    elapsed = time.perf_counter() - t0
    client.close()
    thread.join(timeout=2)
    return elapsed


def run_communication(out_dir: Path) -> dict[str, Any]:
    out_dir = ensure_dir(out_dir)
    csv_path = out_dir / "communication.csv"
    total = 128 * 1024
    rows: list[dict[str, Any]] = []
    for delay_ms in (0.0, 1.0, 5.0, 20.0):
        for mode, messages in (("chatterbox", 64), ("freight_train", 1)):
            per = total // messages
            elapsed = _channel_trial(messages, per, delay_ms)
            rows.append({
                "mode": mode,
                "delay_ms_per_reply": delay_ms,
                "messages": messages,
                "total_payload_bytes": per * messages,
                "seconds": f"{elapsed:.9f}",
            })
    with csv_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader(); writer.writerows(rows)
    payload = {
        "schema": "swosu.archlab.experiment/v1",
        "experiment": "communication",
        "timestamp_utc": utc_iso(),
        "data": csv_path.name,
        "rows": len(rows),
        "controlled_perturbation": "User-space reply delay inserted into a local socket channel. This models per-message waiting cost; it is not a claim about Internet/network hardware latency.",
        "status": "PASS" if len(rows) == 8 else "FAIL",
    }
    write_json(out_dir / "communication-receipt.json", payload)
    return payload
