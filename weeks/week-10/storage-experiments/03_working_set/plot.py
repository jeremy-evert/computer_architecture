#!/usr/bin/env python3
"""Small standard-library text plot for 03_working_set CSV output."""
import csv
import math
import sys


def main():
    stream = open(sys.argv[1], newline="") if len(sys.argv) > 1 else sys.stdin
    lines = list(stream)
    if stream is not sys.stdin:
        stream.close()
    rows = []
    for row in csv.DictReader(line for line in lines if not line.startswith("#")):
        if row.get("trial") == "median":
            rows.append((int(row["size_bytes"]), float(row["ns_per_access"])))
    if not rows:
        raise SystemExit("no median data rows found")
    low = min(v for _, v in rows)
    high = max(v for _, v in rows)
    width = 42
    caches = [(1, "L1"), (2, "L2"), (3, "L3")]
    cache_sizes = {}
    # Cache sizes are carried in the program's metadata comments.
    for line in lines:
        for level, label in caches:
            prefix = f"# cpu0_l{level}_bytes="
            if line.startswith(prefix):
                try:
                    cache_sizes[label] = int(line[len(prefix):])
                except ValueError:
                    pass
    log_min = math.log2(rows[0][0]); log_max = math.log2(rows[-1][0])
    print("ns/access (bar length is scaled linearly; x axis is log2 bytes)")
    for size, value in rows:
        bar = "#" * (1 if high == low else max(1, round((value-low)/(high-low)*width)))
        print(f"{size:>10} B  {value:>10.3f}  {bar}")
    if cache_sizes:
        marks = [" "] * (width + 1)
        for label, size in cache_sizes.items():
            if size and log_min <= math.log2(size) <= log_max:
                pos = round((math.log2(size)-log_min)/(log_max-log_min)*width)
                marks[pos] = label[-1]
        print("cache markers across log2 size span: " + "".join(marks))
        print("markers: " + ", ".join(f"{k}={v} B" for k, v in cache_sizes.items()))


if __name__ == "__main__":
    main()
