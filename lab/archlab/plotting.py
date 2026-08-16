from __future__ import annotations

import csv
from pathlib import Path


def _mpl():
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt
    return plt


def plot_memory(csv_path: Path, out: Path) -> Path:
    rows = list(csv.DictReader(csv_path.open()))
    ptr = [(int(r["size_bytes"]) / 1024, float(r["value"])) for r in rows if r["kind"] == "pointer_chase"]
    stream = [(int(r["size_bytes"]) / 1024, float(r["value"])) for r in rows if r["kind"] == "stream_read"]
    plt = _mpl()
    fig, ax = plt.subplots()
    if ptr:
        ax.plot([x for x, _ in ptr], [y for _, y in ptr], marker="o", label="dependent pointer chase (ns/access)")
    ax.set_xscale("log", base=2)
    ax.set_xlabel("Working set (KiB)")
    ax.set_ylabel("Dependent access latency (ns/access)")
    ax.set_title("Memory sensitivity: working set vs dependent-access latency")
    ax.grid(True, alpha=0.25); ax.legend()
    fig.tight_layout(); fig.savefig(out, dpi=160); plt.close(fig)

    if stream:
        second = out.with_name(out.stem + "-bandwidth" + out.suffix)
        fig, ax = plt.subplots()
        ax.plot([x for x, _ in stream], [y for _, y in stream], marker="o", label="stream read (GB/s)")
        ax.set_xscale("log", base=2); ax.set_xlabel("Working set (KiB)"); ax.set_ylabel("Observed read rate (GB/s)")
        ax.set_title("Memory sensitivity: working set vs streaming throughput")
        ax.grid(True, alpha=0.25); ax.legend(); fig.tight_layout(); fig.savefig(second, dpi=160); plt.close(fig)
    return out


def plot_scaling(csv_path: Path, out: Path) -> Path:
    rows = list(csv.DictReader(csv_path.open()))
    x = [int(r["threads"]) for r in rows]; y = [float(r["speedup"]) for r in rows]
    plt = _mpl(); fig, ax = plt.subplots()
    ax.plot(x, y, marker="o", label="measured speedup")
    ax.plot(x, x, linestyle="--", label="ideal linear speedup")
    ax.set_xlabel("Threads"); ax.set_ylabel("Speedup vs 1 thread"); ax.set_title("Shared-memory scaling sensitivity")
    ax.grid(True, alpha=0.25); ax.legend(); fig.tight_layout(); fig.savefig(out, dpi=160); plt.close(fig)
    return out


def plot_communication(csv_path: Path, out: Path) -> Path:
    rows = list(csv.DictReader(csv_path.open()))
    delays = sorted({float(r["delay_ms_per_reply"]) for r in rows})
    plt = _mpl(); fig, ax = plt.subplots()
    for mode in ("chatterbox", "freight_train"):
        vals = []
        for d in delays:
            r = next(r for r in rows if r["mode"] == mode and float(r["delay_ms_per_reply"]) == d)
            vals.append(float(r["seconds"]))
        ax.plot(delays, vals, marker="o", label=mode.replace("_", " "))
    ax.set_xlabel("Controlled per-message reply delay (ms)"); ax.set_ylabel("Total runtime (s)")
    ax.set_title("Communication sensitivity: frequent messages vs bulk transfer")
    ax.grid(True, alpha=0.25); ax.legend(); fig.tight_layout(); fig.savefig(out, dpi=160); plt.close(fig)
    return out



def plot_dependency(csv_path: Path, out: Path) -> Path:
    rows = list(csv.DictReader(csv_path.open()))
    labels = [r["mode"].replace("_", " ") for r in rows]
    values = [float(r["ns_per_update"]) for r in rows]
    plt = _mpl(); fig, ax = plt.subplots()
    ax.bar(labels, values)
    ax.set_ylabel("Observed ns/update"); ax.set_title("Dependency sensitivity: one chain vs independent chains")
    ax.grid(True, axis="y", alpha=0.25); fig.tight_layout(); fig.savefig(out, dpi=160); plt.close(fig)
    return out


def plot_vector(csv_path: Path, out: Path) -> Path:
    rows = list(csv.DictReader(csv_path.open()))
    labels = [r["mode"].replace("_", " ") for r in rows]
    values = [float(r["seconds"]) for r in rows]
    plt = _mpl(); fig, ax = plt.subplots()
    ax.bar(labels, values)
    ax.set_ylabel("Runtime (s)"); ax.set_title("CPU specialization taste: same loop, different compiler organization")
    ax.grid(True, axis="y", alpha=0.25); fig.tight_layout(); fig.savefig(out, dpi=160); plt.close(fig)
    return out

def plot(kind: str, csv_path: Path, out: Path) -> Path:
    out.parent.mkdir(parents=True, exist_ok=True)
    if kind == "memory": return plot_memory(csv_path, out)
    if kind == "scaling": return plot_scaling(csv_path, out)
    if kind == "communication": return plot_communication(csv_path, out)
    if kind == "dependency": return plot_dependency(csv_path, out)
    if kind == "vector": return plot_vector(csv_path, out)
    raise ValueError(f"unknown plot kind: {kind}")
