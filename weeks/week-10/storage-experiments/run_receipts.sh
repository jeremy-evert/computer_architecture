#!/usr/bin/env bash
# Builds every experiment and saves 3 full runs of each under receipts/<host>/.
# Pins to one CPU (default 0, a performance core on hybrid Intel chips) so cache sizes
# from 00_inventory describe the core that ran the test. Network is not pinned.
# Usage: bash run_receipts.sh
# Optional environment:
#   SCRATCH_DIR=<dir>  real-disk scratch directory for 06_disk and 08_repository instead
#                      of /tmp (never removed); it must already exist.
#                      e.g. SCRATCH_DIR=$HOME/disk-scratch bash run_receipts.sh
#   PIN_CPU=<n>        CPU number for taskset (default 0). Pinning is skipped, with a
#                      note, if taskset is not installed.
#   RECEIPT_TAG=<tag>  appended to every file name: 06_disk_run1_<tag>.txt
# A build failure stops the script with a non-zero exit status.
set -u
cd "$(dirname "$0")"

if [ -n "${SCRATCH_DIR:-}" ] && { [ ! -d "$SCRATCH_DIR" ] || [ ! -w "$SCRATCH_DIR" ]; }; then
  echo "run_receipts.sh: SCRATCH_DIR='$SCRATCH_DIR' is not an existing writable directory; create it first (mkdir -p) and rerun." >&2
  exit 1
fi

pin_cpu=${PIN_CPU:-0}
if command -v taskset >/dev/null 2>&1; then
  pin="taskset -c $pin_cpu"
else
  pin=""
  echo "note: taskset not found; running unpinned (cache sizes may describe a different core than the one that ran)" >&2
fi
tag=${RECEIPT_TAG:+_$RECEIPT_TAG}

host=$(hostname -s)
out=receipts/$host
mkdir -p "$out"
failed=0
for d in [0-9][0-9]_*; do
  [ -d "$d" ] || continue
  if ! make -s -C "$d" clean all; then
    echo "BUILD FAILED: $d" >&2
    exit 1
  fi
  exe=$(find "$d" -maxdepth 1 -type f -executable -name "${d}" | head -n 1)
  if [ -z "$exe" ]; then
    echo "BUILD FAILED: no executable for $d (script-only?)" >&2
    exit 1
  fi
  dpin=$pin; [ "$d" = "07_network" ] && dpin=""
  scratch=""
  if [ -n "${SCRATCH_DIR:-}" ]; then
    case "$d" in 06_disk|08_repository) scratch="$SCRATCH_DIR" ;; esac
  fi
  for run in 1 2 3; do
    $dpin "$exe" ${scratch:+"$scratch"} > "$out/${d}_run${run}${tag}.txt" 2>&1 \
      || { echo "RUN FAILED: $d run $run" >&2; failed=1; }
  done
  make -s -C "$d" clean
done
exit $failed
