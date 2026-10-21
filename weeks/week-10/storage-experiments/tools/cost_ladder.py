#!/usr/bin/env python3
"""
cost_ladder.py - a rough map of the memory/storage layer cake:
how fast each layer is vs. how much each gigabyte costs.

Latencies are order-of-magnitude teaching values, NOT measurements.
Replace them with your own numbers from 03_working_set and 06_disk.
Prices are dated snapshots. Prices move, so always record the date.

Usage:
    ./cost_ladder.py --cpu-price 120
"""
import argparse
import csv

PRICE_SNAPSHOT_DATE = "2026-10-21"

# Cache sizes for one i7-8700K, in KiB (from lscpu: 6 cores)
L1_DATA_KIB = 6 * 32
L1_INSTRUCTION_KIB = 6 * 32
L2_KIB = 6 * 256
L3_KIB = 12 * 1024
TOTAL_CACHE_GIB = (L1_DATA_KIB + L1_INSTRUCTION_KIB + L2_KIB + L3_KIB) / (1024 * 1024)

# layer name, typical latency in ns, dollars per GB, where the price came from
PURCHASABLE_LAYERS = [
    ("RAM (DDR4)",       80,         7.81,  "DDR4 desktop median $/GB tracker"),
    ("NVMe SSD",         80_000,     0.14,  "2TB NVMe ~ $140/TB tracker"),
    ("Hard drive (HDD)", 5_000_000,  0.05,  "new 8TB HDD ~ $41-61/TB capture"),
]


def build_ladder(cpu_price_usd):
    ladder = []
    if cpu_price_usd is not None:
        cache_dollars_per_gb = cpu_price_usd / TOTAL_CACHE_GIB
        ladder.append(("CPU cache (L1+L2+L3)", 4, cache_dollars_per_gb,
                       "UPPER BOUND: whole CPU price charged to its cache"))
    ladder.extend(PURCHASABLE_LAYERS)
    return ladder


def print_ladder(ladder):
    ram_latency, ram_price = 80, 7.81
    print(f"\nLayer-cake cost ladder (prices as of {PRICE_SNAPSHOT_DATE})\n")
    print(f"{'layer':<22}{'latency':>14}{'$/GB':>14}{'speed vs RAM':>16}{'price vs RAM':>16}")
    print("-" * 82)
    for name, latency_ns, dollars_per_gb, _ in ladder:
        speed_ratio = ram_latency / latency_ns
        price_ratio = dollars_per_gb / ram_price
        print(f"{name:<22}{latency_ns:>12,} ns{dollars_per_gb:>14,.2f}"
              f"{speed_ratio:>15,.4g}x{price_ratio:>15,.4g}x")
    print("\nRead it as: going DOWN the cake, each layer is slower AND cheaper per GB.")


def save_receipt_csv(ladder, path="cost_ladder.csv"):
    with open(path, "w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["layer", "latency_ns", "dollars_per_gb", "source", "price_date"])
        for name, latency_ns, dollars_per_gb, source in ladder:
            writer.writerow([name, latency_ns, f"{dollars_per_gb:.4f}", source, PRICE_SNAPSHOT_DATE])
    print(f"Saved receipt: {path}")


def save_plot_if_possible(ladder, path="cost_ladder.png"):
    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
    except ImportError:
        print("matplotlib not installed; skipping plot (sudo apt install python3-matplotlib)")
        return
    figure, axes = plt.subplots(figsize=(8, 5))
    for name, latency_ns, dollars_per_gb, _ in ladder:
        axes.scatter(latency_ns, dollars_per_gb, s=80)
        axes.annotate(name, (latency_ns, dollars_per_gb),
                      textcoords="offset points", xytext=(8, 6))
    axes.set_xscale("log")
    axes.set_yscale("log")
    axes.set_xlabel("typical latency (ns, log scale) - slower ->")
    axes.set_ylabel("dollars per GB (log scale) - pricier ->")
    axes.set_title(f"The layer cake: speed vs. cost ({PRICE_SNAPSHOT_DATE})")
    axes.grid(True, which="both", alpha=0.3)
    figure.tight_layout()
    figure.savefig(path, dpi=150)
    print(f"Saved plot: {path}")


def main():
    parser = argparse.ArgumentParser(description="Rough speed-vs-cost map of the memory hierarchy.")
    parser.add_argument("--cpu-price", type=float, default=None,
                        help="what your CPU costs today in USD (look up eBay SOLD listings)")
    arguments = parser.parse_args()
    if arguments.cpu_price is None:
        print("No --cpu-price given, so the cache row is skipped.")
    ladder = build_ladder(arguments.cpu_price)
    print_ladder(ladder)
    save_receipt_csv(ladder)
    save_plot_if_possible(ladder)


if __name__ == "__main__":
    main()
