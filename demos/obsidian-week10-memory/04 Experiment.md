# Executable experiment

This uses the course's existing Week 10 C experiment and CLI. No benchmark was invented for the demonstration.

## Run it

From the Computer Architecture repository root on Linux:

```bash
./lab/bin/archlab run memory
```

The CLI compiles `lab/experiments/memory.c` with GCC `-O2 -std=c11 -Wall -Wextra`, runs one sweep, and writes a timestamped directory under `lab/runs/` containing `memory.csv` and `memory-receipt.json`. On another checkout, first inspect that machine with `./lab/bin/archlab probe snapshot`.

## What changes and what is measured

Working-set sizes are 4 KiB, 32 KiB, 256 KiB, 2 MiB, 8 MiB, and 32 MiB. For each size, the program measures dependent pointer-chase nanoseconds per access and contiguous stream-read decimal GB/s. The deterministic cycle is constructed before the timed loop; the stream is initialized before its timed loop. A checksum sink prevents the measured work from being trivially discarded.

The experiment measures one process and does not pin it to a CPU or control frequency, temperature, background load, or kernel scheduling. It does not count cache misses or directly identify the servicing memory level. See [[05 Observed Results]] for raw CSV links and the Maise host receipt.

## Reproducing this saved demonstration

The committed observations are six separate runs captured on Maise on 2026-10-22 local time (2026-10-23 UTC). Each raw CSV and JSON receipt is linked from [[05 Observed Results]]. Recompute the median/range table with `python3 -B demos/obsidian-week10-memory/scripts/summarize_runs.py`; it writes `evidence/2026-10-22/summary.json` from those raw CSVs. The machine snapshot is `evidence/2026-10-22/maise-machine/machine.txt` and `.json`. Local Obsidian does not need Python packages or a plugin to browse the vault.
