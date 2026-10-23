# Observed results — Maise, six runs

These are actual outputs of the existing course command on host `maise`, not sample values or fallback data. Each cell reports the median across six independent invocations and the observed minimum–maximum range. Values are copied from the linked run CSVs; run receipts each report 12 rows and `PASS`.

The table is reproducible from the raw CSVs with [[04 Experiment]]'s standard-library summary script; its generated receipt is [summary.json](evidence/2026-10-22/summary.json).

**Host recorded:** Ubuntu 26.04.1 LTS, Linux 7.0.0-38-generic, x86_64; AMD Ryzen 9 3950X, 16 cores / 32 logical processors; GCC 15.2.0; 60.5 GiB visible memory. The Observatory marked scope **host-visible**. See [machine summary](evidence/2026-10-22/maise-machine/machine.txt) and [machine JSON receipt](evidence/2026-10-22/maise-machine/machine.json).

| Working set | Pointer chase, ns/access (median; min–max) | Stream read, decimal GB/s (median; min–max) |
|---:|---:|---:|
| 4 KiB | 1.243232 (1.205110–1.506460) | 63.015385 (50.305891–63.015385) |
| 32 KiB | 1.221135 (1.206760–1.530265) | 65.948176 (52.745272–65.968921) |
| 256 KiB | 3.159565 (3.080771–3.271670) | 65.502538 (51.862847–66.302100) |
| 2 MiB | 9.705651 (9.565574–9.815440) | 64.637400 (62.212377–65.585445) |
| 8 MiB | 11.621718 (11.232872–12.353522) | 60.402643 (52.083341–61.779288) |
| 32 MiB | 56.403880 (54.937204–56.539880) | 36.661975 (36.191274–37.068467) |

## Raw evidence

- Run 01: [CSV](evidence/2026-10-22/maise-run-01/memory.csv) · [receipt](evidence/2026-10-22/maise-run-01/memory-receipt.json)
- Run 02: [CSV](evidence/2026-10-22/maise-run-02/memory.csv) · [receipt](evidence/2026-10-22/maise-run-02/memory-receipt.json)
- Run 03: [CSV](evidence/2026-10-22/maise-run-03/memory.csv) · [receipt](evidence/2026-10-22/maise-run-03/memory-receipt.json)
- Run 04: [CSV](evidence/2026-10-22/maise-run-04/memory.csv) · [receipt](evidence/2026-10-22/maise-run-04/memory-receipt.json) · [command output](evidence/2026-10-22/maise-run-04/command-output.log)
- Run 05: [CSV](evidence/2026-10-22/maise-run-05/memory.csv) · [receipt](evidence/2026-10-22/maise-run-05/memory-receipt.json) · [command output](evidence/2026-10-22/maise-run-05/command-output.log)
- Run 06: [CSV](evidence/2026-10-22/maise-run-06/memory.csv) · [receipt](evidence/2026-10-22/maise-run-06/memory-receipt.json) · [command output](evidence/2026-10-22/maise-run-06/command-output.log)

## What the measurements say—and do not say

The pointer chase is about 1.2 ns/access at 4–32 KiB, around 3.2 ns at 256 KiB, around 9.7 ns at 2 MiB, and about 56.4 ns at 32 MiB. Stream throughput stays near 60–66 GB/s through 8 MiB in these runs and falls to about 36.7 GB/s at 32 MiB. This supports the qualitative prediction that dependent latency and streaming bandwidth respond differently to working-set size.

The 4 KiB and 32 KiB stream values vary notably across runs, so their medians/ranges are shown rather than a single clean-looking number. The sharp pointer-chase increase between 8 and 32 MiB is consistent with a change in where accesses are served, but this sweep does not measure cache misses or isolate cache capacity. It cannot establish an exact cache boundary or prove a unique cause. CPU frequency, scheduling, prefetch/TLB behavior, cache placement, and other machine activity were not controlled. The result is this host/process/run set only.
