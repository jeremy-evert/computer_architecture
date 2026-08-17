"""Command-line entry point for the Architecture Week 16 Farkle evidence lane."""

import argparse
import json
from pathlib import Path

from .host import collect_host_evidence
from .runner import run_fixed_suite, run_pair, save_receipt, summary_text


def cmd_host(_args):
    print(json.dumps(collect_host_evidence().to_dict(), indent=2, sort_keys=True))


def _finish(receipt, out_dir):
    json_path, csv_path = save_receipt(receipt, out_dir)
    print(summary_text(receipt))
    print(f"json={json_path}")
    print(f"csv={csv_path}")


def cmd_suite(args):
    receipt = run_fixed_suite(
        games=args.games,
        seed=args.seed,
        repeats=args.repeats,
        lane_label=args.lane_label,
    )
    _finish(receipt, Path(args.out_dir))


def cmd_compare(args):
    receipt = run_pair(
        strategy_a=args.strategy_a,
        strategy_b=args.strategy_b,
        games=args.games,
        seed=args.seed,
        repeats=args.repeats,
        lane_label=args.lane_label,
    )
    _finish(receipt, Path(args.out_dir))


def build_parser():
    parser = argparse.ArgumentParser(
        description="Computer Architecture Farkle cost/effectiveness evidence runner"
    )
    commands = parser.add_subparsers(dest="command", required=True)

    host = commands.add_parser("host", help="Print execution-host evidence.")
    host.set_defaults(func=cmd_host)

    suite = commands.add_parser("suite", help="Run the fixed canonical CPU suite.")
    suite.add_argument("--games", type=int, default=100)
    suite.add_argument("--seed", type=int, default=6262)
    suite.add_argument("--repeats", type=int, default=3)
    suite.add_argument("--lane-label", default="local-cpu")
    suite.add_argument("--out-dir", default="artifacts/week16-farkle/suite")
    suite.set_defaults(func=cmd_suite)

    compare = commands.add_parser("compare", help="Repeat one declared comparison.")
    compare.add_argument("--strategy-a", required=True)
    compare.add_argument("--strategy-b", default="bank_at_425")
    compare.add_argument("--games", type=int, default=500)
    compare.add_argument("--seed", type=int, default=6262)
    compare.add_argument("--repeats", type=int, default=3)
    compare.add_argument("--lane-label", default="local-cpu")
    compare.add_argument("--out-dir", default="artifacts/week16-farkle/compare")
    compare.set_defaults(func=cmd_compare)

    return parser


def main(argv=None):
    args = build_parser().parse_args(argv)
    args.func(args)


if __name__ == "__main__":
    main()
