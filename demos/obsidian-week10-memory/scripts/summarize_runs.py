#!/usr/bin/env python3
"""Recompute six-run median/range tables from the saved course CSV receipts."""
from __future__ import annotations

import argparse
import csv
import json
import statistics
from collections import defaultdict
from pathlib import Path


def summarize(evidence: Path) -> dict[str, object]:
    runs = sorted(evidence.glob("maise-run-*"))
    if len(runs) != 6:
        raise ValueError(f"expected six saved runs, found {len(runs)}")
    values: dict[tuple[str, int, str], list[float]] = defaultdict(list)
    for run in runs:
        receipt = json.loads((run / "memory-receipt.json").read_text(encoding="utf-8"))
        if receipt.get("status") != "PASS" or receipt.get("rows") != 12:
            raise ValueError(f"invalid experiment receipt: {run}")
        with (run / "memory.csv").open(newline="", encoding="utf-8") as stream:
            rows = list(csv.DictReader(stream))
        if len(rows) != 12:
            raise ValueError(f"expected 12 CSV rows in {run}, got {len(rows)}")
        for row in rows:
            values[(row["kind"], int(row["size_bytes"]), row["unit"])].append(float(row["value"]))
    summary = []
    for (kind, size, unit), samples in sorted(values.items()):
        if len(samples) != 6:
            raise ValueError(f"expected six samples for {kind}/{size}, got {len(samples)}")
        summary.append({
            "kind": kind,
            "size_bytes": size,
            "unit": unit,
            "n": len(samples),
            "median": round(statistics.median(samples), 6),
            "min": round(min(samples), 6),
            "max": round(max(samples), 6),
        })
    return {"schema": "connie-068.memory-summary/v1", "runs": len(runs), "measurements": summary}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--evidence", type=Path, default=Path(__file__).resolve().parents[1] / "evidence/2026-10-22")
    parser.add_argument("--out", type=Path, default=Path(__file__).resolve().parents[1] / "evidence/2026-10-22/summary.json")
    args = parser.parse_args()
    result = summarize(args.evidence)
    args.out.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(f"PASS: summarized {result['runs']} runs into {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
