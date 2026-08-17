"""Repeated cost/effectiveness receipts over the canonical Farkle machine."""

from dataclasses import replace
from datetime import datetime, timezone
import csv
import json
from pathlib import Path
from statistics import median

from farkle_ml.experiment import (
    ExperimentConfig,
    default_suite,
    result_row,
    run_experiment,
)

from . import ACCELERATOR_USED, ARCHITECTURE_RECEIPT_SCHEMA, EXECUTION_MODE
from .host import collect_host_evidence


CODE_DIR = Path(__file__).resolve().parents[1]
PROVENANCE_PATH = CODE_DIR / "farkle_ml" / "_SHARED_PROVENANCE.json"
FIXED_STRATEGIES = (
    "bank_at_300",
    "learner:500",
    "learner:2000",
    "rollout:10",
    "rollout:25",
)


def shared_provenance():
    return json.loads(PROVENANCE_PATH.read_text(encoding="utf-8"))


def _execution_context(lane_label):
    return f"architecture:{lane_label}:{EXECUTION_MODE}"


def _trial_row(result, repeat, lane_label):
    row = result_row(result)
    row.update(
        {
            "repeat": repeat,
            "lane_label": lane_label,
            "execution_mode": EXECUTION_MODE,
            "accelerator_used": ACCELERATOR_USED,
        }
    )
    return row


def _summaries(trials):
    grouped = {}
    for row in trials:
        grouped.setdefault(row["strategy_a"], []).append(row)

    summaries = []
    for strategy in sorted(grouped):
        rows = grouped[strategy]
        summaries.append(
            {
                "strategy": strategy,
                "opponent": rows[0]["strategy_b"],
                "games_per_trial": rows[0]["games"],
                "repeats": len(rows),
                "win_rate": rows[0]["win_rate_a"],
                "median_games_per_second": median(
                    row["games_per_second"] for row in rows
                ),
                "min_games_per_second": min(
                    row["games_per_second"] for row in rows
                ),
                "max_games_per_second": max(
                    row["games_per_second"] for row in rows
                ),
                "median_preparation_seconds": median(
                    row["preparation_seconds_a"] for row in rows
                ),
                "training_turns": rows[0]["training_turns_a"],
                "model_size_bytes": rows[0]["model_size_bytes_a"],
            }
        )
    return summaries


def run_fixed_suite(games=100, seed=6262, repeats=3, lane_label="local-cpu"):
    """Run the canonical bounded suite repeatedly on one declared CPU lane."""
    if games <= 0:
        raise ValueError("games must be positive")
    if repeats <= 0:
        raise ValueError("repeats must be positive")

    trials = []
    for repeat_index in range(1, repeats + 1):
        for config in default_suite(games=games, seed=seed):
            config = replace(
                config,
                execution_context=_execution_context(lane_label),
            )
            result = run_experiment(config)
            trials.append(_trial_row(result, repeat_index, lane_label))

    return {
        "schema_version": ARCHITECTURE_RECEIPT_SCHEMA,
        "generated_utc": datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ"),
        "lane_label": lane_label,
        "execution_mode": EXECUTION_MODE,
        "accelerator_used": ACCELERATOR_USED,
        "host": collect_host_evidence().to_dict(),
        "shared_provenance": shared_provenance(),
        "benchmark": {
            "kind": "fixed-suite",
            "games_per_trial": games,
            "base_seed": seed,
            "repeats": repeats,
            "strategies": list(FIXED_STRATEGIES),
            "baseline": "bank_at_425",
        },
        "trials": trials,
        "summaries": _summaries(trials),
    }


def run_pair(
    strategy_a,
    strategy_b="bank_at_425",
    games=500,
    seed=6262,
    repeats=3,
    lane_label="local-cpu",
):
    """Repeat one declared strategy comparison on one execution lane."""
    if games <= 0:
        raise ValueError("games must be positive")
    if repeats <= 0:
        raise ValueError("repeats must be positive")

    trials = []
    for repeat_index in range(1, repeats + 1):
        result = run_experiment(
            ExperimentConfig(
                strategy_a=strategy_a,
                strategy_b=strategy_b,
                games=games,
                seed=seed,
                execution_context=_execution_context(lane_label),
            )
        )
        trials.append(_trial_row(result, repeat_index, lane_label))

    return {
        "schema_version": ARCHITECTURE_RECEIPT_SCHEMA,
        "generated_utc": datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ"),
        "lane_label": lane_label,
        "execution_mode": EXECUTION_MODE,
        "accelerator_used": ACCELERATOR_USED,
        "host": collect_host_evidence().to_dict(),
        "shared_provenance": shared_provenance(),
        "benchmark": {
            "kind": "pair",
            "games_per_trial": games,
            "base_seed": seed,
            "repeats": repeats,
            "strategy_a": strategy_a,
            "strategy_b": strategy_b,
        },
        "trials": trials,
        "summaries": _summaries(trials),
    }


def save_receipt(receipt, out_dir):
    """Persist the same evidence as JSON plus flat trial CSV."""
    out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    json_path = out_dir / "architecture_farkle_receipt.json"
    csv_path = out_dir / "architecture_farkle_trials.csv"

    json_path.write_text(
        json.dumps(receipt, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )

    trials = receipt["trials"]
    if trials:
        with csv_path.open("w", newline="", encoding="utf-8") as handle:
            writer = csv.DictWriter(handle, fieldnames=list(trials[0].keys()))
            writer.writeheader()
            writer.writerows(trials)

    return json_path, csv_path


def summary_text(receipt):
    lines = [
        f"lane={receipt['lane_label']} mode={receipt['execution_mode']} "
        f"accelerator_used={receipt['accelerator_used']}",
        f"host={receipt['host']['hostname']} cpu={receipt['host']['cpu_model']}",
    ]
    for row in receipt["summaries"]:
        lines.append(
            f"{row['strategy']:<14} win={row['win_rate']:.1%} "
            f"median={row['median_games_per_second']:.1f} games/s "
            f"range={row['min_games_per_second']:.1f}-{row['max_games_per_second']:.1f}"
        )
    return "\n".join(lines)
