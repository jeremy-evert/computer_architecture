#!/usr/bin/env bash
# Builds every experiment and saves 3 full runs of each under receipts/<host>/.
# Pins to CPU 0 (a performance core on hybrid Intel chips) so cache sizes from
# 00_inventory describe the core that ran the test. Network is not pinned.
set -u
cd "$(dirname "$0")"
host=$(hostname -s)
out=receipts/$host
mkdir -p "$out"
for d in [0-9][0-9]_*; do
  [ -d "$d" ] || continue
  make -s -C "$d" clean all || { echo "BUILD FAILED: $d" >&2; continue; }
  exe=$(find "$d" -maxdepth 1 -type f -executable -name "${d}" | head -n 1)
  [ -n "$exe" ] || { echo "no exe for $d (script-only?)" >&2; continue; }
  pin="taskset -c 0"; [ "$d" = "07_network" ] && pin=""
  for run in 1 2 3; do
    $pin "$exe" > "$out/${d}_run${run}.txt" 2>&1 || echo "RUN FAILED: $d run $run" >&2
  done
  make -s -C "$d" clean
done
