from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from .common import default_runs_root, ensure_dir, utc_stamp, write_json
from .doctor import check as doctor_check
from .dossier import build as dossier_build
from .experiments import run_communication, run_dependency, run_memory, run_scaling, run_vector
from .plotting import plot
from .probe import human_summary, snapshot
from .riscv import build_and_run as riscv_build_and_run


def _run_dir(root: Path, name: str) -> Path:
    return ensure_dir(root / f"{utc_stamp()}_{name}")


def _print_json(obj: object) -> None:
    print(json.dumps(obj, indent=2, sort_keys=True))


def cmd_doctor(args: argparse.Namespace) -> int:
    payload = doctor_check()
    if args.out:
        write_json(Path(args.out), payload)
    _print_json(payload)
    return 0 if payload["status"] == "PASS" else 1


def cmd_probe(args: argparse.Namespace) -> int:
    data = snapshot()
    out_dir = ensure_dir(Path(args.out_dir)) if args.out_dir else _run_dir(Path(args.runs_root), "probe")
    write_json(out_dir / "machine.json", data)
    (out_dir / "machine.txt").write_text(human_summary(data), encoding="utf-8")
    print(human_summary(data), end="")
    print(f"Receipt: {out_dir / 'machine.json'}")
    return 0


def cmd_run(args: argparse.Namespace) -> int:
    out_dir = ensure_dir(Path(args.out_dir)) if args.out_dir else _run_dir(Path(args.runs_root), args.experiment)
    if args.experiment == "memory": payload = run_memory(out_dir)
    elif args.experiment == "scaling": payload = run_scaling(out_dir, args.work)
    elif args.experiment == "communication": payload = run_communication(out_dir)
    elif args.experiment == "dependency": payload = run_dependency(out_dir, args.updates)
    elif args.experiment == "vector": payload = run_vector(out_dir, args.items)
    elif args.experiment == "riscv": payload = riscv_build_and_run(out_dir)
    else: raise ValueError(args.experiment)
    _print_json(payload); print(f"Run directory: {out_dir}")
    return 0 if payload["status"] == "PASS" else 1


def cmd_plot(args: argparse.Namespace) -> int:
    out = plot(args.kind, Path(args.csv), Path(args.out))
    print(out); return 0


def cmd_dossier(args: argparse.Namespace) -> int:
    payload = dossier_build(Path(args.work_dir), [Path(x) for x in args.figure])
    _print_json(payload); return 0


def cmd_smoke(args: argparse.Namespace) -> int:
    root = ensure_dir(Path(args.out_dir) if args.out_dir else _run_dir(Path(args.runs_root), "smoke"))
    results: dict[str, object] = {}
    try:
        doctor = doctor_check(); results["doctor"] = doctor
        if doctor["status"] != "PASS": raise RuntimeError("doctor failed")
        machine = snapshot(); write_json(root / "machine.json", machine); results["probe"] = "PASS"
        results["riscv"] = riscv_build_and_run(root / "riscv")["status"]
        results["dependency"] = run_dependency(root / "dependency", 12_000_000)["status"]
        plot("dependency", root / "dependency" / "dependency.csv", root / "plots" / "dependency.png")
        results["memory"] = run_memory(root / "memory")["status"]
        memory_plot = plot("memory", root / "memory" / "memory.csv", root / "plots" / "memory.png")
        results["scaling"] = run_scaling(root / "scaling", args.work)["status"]
        plot("scaling", root / "scaling" / "scaling.csv", root / "plots" / "scaling.png")
        results["communication"] = run_communication(root / "communication")["status"]
        plot("communication", root / "communication" / "communication.csv", root / "plots" / "communication.png")
        results["vector"] = run_vector(root / "vector", 4_000_000)["status"]
        plot("vector", root / "vector" / "vector.csv", root / "plots" / "vector.png")
        figures = sorted((root / "plots").glob("*.png"))
        results["dossier"] = dossier_build(root / "dossier", figures)["status"]
        status = "PASS" if all(v == "PASS" for k, v in results.items() if k != "doctor") else "FAIL"
    except Exception as exc:  # noqa: BLE001 - smoke receipt should preserve failure
        results["error"] = str(exc); status = "FAIL"
    receipt = {"schema": "swosu.archlab.smoke/v1", "status": status, "results": results}
    write_json(root / "smoke-receipt.json", receipt)
    _print_json(receipt); print(f"Smoke directory: {root}")
    return 0 if status == "PASS" else 1


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="archlab", description="SWOSU Computer Architecture laboratory")
    p.add_argument("--runs-root", default=str(default_runs_root()))
    sp = p.add_subparsers(dest="command", required=True)
    d = sp.add_parser("doctor", help="check the laboratory and emit a health receipt"); d.add_argument("--out"); d.set_defaults(func=cmd_doctor)
    pr = sp.add_parser("probe", help="observe the current machine/environment"); pr.add_argument("action", choices=["snapshot"]); pr.add_argument("--out-dir"); pr.set_defaults(func=cmd_probe)
    r = sp.add_parser("run", help="run a controlled experiment"); r.add_argument("experiment", choices=["riscv", "dependency", "memory", "scaling", "communication", "vector"]); r.add_argument("--out-dir"); r.add_argument("--work", type=int, default=12_000_000); r.add_argument("--updates", type=int, default=40_000_000); r.add_argument("--items", type=int, default=8_000_000); r.set_defaults(func=cmd_run)
    pl = sp.add_parser("plot", help="plot a machine-readable experiment receipt"); pl.add_argument("kind", choices=["dependency", "memory", "scaling", "communication", "vector"]); pl.add_argument("csv"); pl.add_argument("--out", required=True); pl.set_defaults(func=cmd_plot)
    dos = sp.add_parser("dossier", help="build the scaffolded Machine Dossier PDF"); dos.add_argument("action", choices=["build"]); dos.add_argument("--work-dir", required=True); dos.add_argument("--figure", action="append", default=[]); dos.set_defaults(func=cmd_dossier)
    sm = sp.add_parser("smoke", help="prove the end-to-end laboratory contract"); sm.add_argument("--out-dir"); sm.add_argument("--work", type=int, default=4_000_000); sm.set_defaults(func=cmd_smoke)
    return p


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    return args.func(args)


def probe_main() -> int:
    return main(["probe", "snapshot", *sys.argv[1:]])


def plot_main() -> int:
    return main(["plot", *sys.argv[1:]])
