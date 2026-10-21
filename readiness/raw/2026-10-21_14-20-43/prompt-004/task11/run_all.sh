#!/usr/bin/env bash
cd /home/jevert/git/computer_architecture/weeks/week-10/storage-experiments
for spec in "$HOME/disk-scratch home" "/mnt/c/Users/evertj/disk-scratch mnt_c" "/mnt/d/disk-scratch mnt_d"; do
  set -- $spec
  echo "=== START $2 scratch=$1 $(date +%FT%T)"
  s=$(date +%s)
  SCRATCH_DIR=$1 RECEIPT_TAG=$2 bash run_receipts.sh > /home/jevert/git/computer_architecture/readiness/raw/2026-10-21_14-20-43/prompt-004/task11/$2.stdout 2> /home/jevert/git/computer_architecture/readiness/raw/2026-10-21_14-20-43/prompt-004/task11/$2.stderr
  rc=$?
  echo "=== END $2 exit=$rc elapsed_s=$(($(date +%s)-s)) $(date +%FT%T)"
done
echo ALL_DONE
