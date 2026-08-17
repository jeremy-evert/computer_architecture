#!/usr/bin/env python3
"""Validate the Computer Architecture Week 16 Farkle consumer on a real host.

The required path is standard-library Python on CPU. The validator installs
nothing and never claims accelerator use merely because a GPU exists.
"""

from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import platform
import sys

ROOT = Path(__file__).resolve().parents[1]
CODE = ROOT / "weeks" / "week-16" / "code"
if str(CODE) not in sys.path:
    sys.path.insert(0, str(CODE))

from architecture_farkle import ACCELERATOR_USED, EXECUTION_MODE  # noqa: E402
from architecture_farkle.runner import run_fixed_suite, save_receipt  # noqa: E402


def validate_shared_snapshot():
    manifest_path = CODE / "farkle_ml" / "_SHARED_PROVENANCE.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    errors = []
    if manifest.get("shared_repository") != "jeremy-evert/Farkle_and_Machine_Learning":
        errors.append("unexpected shared repository")
    if manifest.get("source_path") != "src/farkle_ml":
        errors.append("unexpected shared source path")
    if not manifest.get("shared_commit"):
        errors.append("shared source commit is missing")

    for relative_path, expected_hash in manifest.get("files", {}).items():
        path = CODE / "farkle_ml" / relative_path
        if not path.is_file():
            errors.append(f"missing shared file: {relative_path}")
            continue
        actual_hash = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual_hash != expected_hash:
            errors.append(f"shared file hash mismatch: {relative_path}")
    return manifest, errors


def validate_receipt(receipt):
    errors = []
    if receipt["execution_mode"] != "native-python-cpu":
        errors.append("required execution mode is not native-python-cpu")
    if receipt["accelerator_used"] is not False:
        errors.append("required CPU path incorrectly claims accelerator use")
    if receipt["host"]["accelerator_used"] is not False:
        errors.append("host evidence incorrectly claims accelerator use")

    expected_strategies = {
        "bank_at_300", "learner:500", "learner:2000", "rollout:10", "rollout:25"
    }
    observed = {row["strategy"] for row in receipt["summaries"]}
    if observed != expected_strategies:
        errors.append(f"fixed strategy set changed: {sorted(observed)}")

    trials_by_strategy = {}
    for row in receipt["trials"]:
        trials_by_strategy.setdefault(row["strategy_a"], []).append(row)
        if row["wins_a"] + row["wins_b"] + row["ties"] != row["games"]:
            errors.append(f"win/tie denominator mismatch for {row['strategy_a']}")
        if row["starts_a"] != row["starts_b"]:
            errors.append(f"starter imbalance for {row['strategy_a']}")
        if row["games_per_second"] <= 0:
            errors.append(f"non-positive throughput for {row['strategy_a']}")

    deterministic_fields = (
        "wins_a", "wins_b", "ties", "starts_a", "starts_b",
        "turns_a", "turns_b", "farkles_a", "farkles_b",
        "win_rate_a", "win_rate_b", "avg_score_a", "avg_score_b",
        "farkle_rate_a", "farkle_rate_b", "avg_turns_per_game",
    )
    for strategy, rows in trials_by_strategy.items():
        if len(rows) != receipt["benchmark"]["repeats"]:
            errors.append(f"repeat count mismatch for {strategy}")
            continue
        first = rows[0]
        for row in rows[1:]:
            for field in deterministic_fields:
                if row[field] != first[field]:
                    errors.append(f"deterministic drift for {strategy}: {field}")
                    break

    for summary in receipt["summaries"]:
        if summary["median_games_per_second"] <= 0:
            errors.append(f"invalid median throughput for {summary['strategy']}")
        if not (
            summary["min_games_per_second"]
            <= summary["median_games_per_second"]
            <= summary["max_games_per_second"]
        ):
            errors.append(f"invalid throughput range for {summary['strategy']}")
    return errors


def main():
    stamp = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    receipt_dir = ROOT / "sidecar" / "runs"
    artifact_dir = ROOT / "weeks" / "week-16" / "artifacts" / stamp
    receipt_dir.mkdir(parents=True, exist_ok=True)

    manifest, snapshot_errors = validate_shared_snapshot()
    receipt = run_fixed_suite(
        games=40,
        seed=6262,
        repeats=2,
        lane_label="brandy-validation-cpu",
    )
    runtime_errors = validate_receipt(receipt)
    json_path, csv_path = save_receipt(receipt, artifact_dir)

    errors = snapshot_errors + runtime_errors
    status = "GREEN" if not errors else "RED"
    md_path = receipt_dir / f"week16_farkle_architecture_validation_{stamp}.md"

    lines = [
        "# Computer Architecture Week 16 Farkle validation receipt",
        "",
        f"- UTC: {stamp}",
        f"- status: **{status}**",
        f"- Python: {platform.python_version()}",
        f"- Platform: {platform.platform()}",
        f"- host: `{receipt['host']['hostname']}`",
        f"- CPU: `{receipt['host']['cpu_model']}`",
        f"- logical CPUs: {receipt['host']['logical_cpus']}",
        f"- execution mode: `{EXECUTION_MODE}`",
        f"- accelerator used: `{ACCELERATOR_USED}`",
        f"- shared repository: `{manifest.get('shared_repository')}`",
        f"- shared source commit: `{manifest.get('shared_commit')}`",
        f"- JSON evidence: `{json_path.relative_to(ROOT)}`",
        f"- CSV evidence: `{csv_path.relative_to(ROOT)}`",
        "",
        "## Contract checks",
        "",
    ]
    if errors:
        lines.extend(f"- RED — {error}" for error in errors)
    else:
        lines.extend(
            [
                "- GREEN — generated canonical package matches provenance hashes",
                "- GREEN — required path is explicitly native Python CPU",
                "- GREEN — no accelerator use is claimed",
                "- GREEN — fixed five-strategy suite executed",
                "- GREEN — raw win/tie/start denominators are internally consistent",
                "- GREEN — deterministic outcomes match across timing repeats",
                "- GREEN — median/min/max throughput evidence is positive and ordered",
            ]
        )

    lines.extend(
        [
            "",
            "## Fixed CPU suite",
            "",
            "| strategy | win rate vs bank_at_425 | median games/s | min | max |",
            "|---|---:|---:|---:|---:|",
        ]
    )
    for row in receipt["summaries"]:
        lines.append(
            f"| {row['strategy']} | {row['win_rate']:.3f} | "
            f"{row['median_games_per_second']:.2f} | "
            f"{row['min_games_per_second']:.2f} | "
            f"{row['max_games_per_second']:.2f} |"
        )

    lines.extend(
        [
            "",
            "## Interpretation boundary",
            "",
            "This is a Brandy native-Python CPU receipt. It is not a Tesla T4 result.",
            "A future accelerator lane must prove that the workload actually dispatches",
            "to the accelerator and preserves the benchmark contract before its numbers",
            "may be compared as accelerator evidence.",
            "",
            "## Command",
            "",
            "```text",
            "python scripts/validate_week16_farkle.py",
            "```",
            "",
        ]
    )
    md_path.write_text("\n".join(lines), encoding="utf-8")
    print(md_path)
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main())
