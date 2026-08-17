# Computer Architecture Week 16 Farkle validation receipt

- UTC: 20260817T003425Z
- status: **GREEN**
- Python: 3.9.21
- Platform: Linux-5.14.0-570.58.1.el9_6.x86_64-x86_64-with-glibc2.34
- host: `brandy`
- CPU: `Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz`
- logical CPUs: 96
- execution mode: `native-python-cpu`
- accelerator used: `False`
- shared repository: `jeremy-evert/Farkle_and_Machine_Learning`
- shared source commit: `d3a1ed379a652731b0b6237c33b4fe42c518ac9e`
- JSON evidence: `weeks/week-16/artifacts/20260817T003425Z/architecture_farkle_receipt.json`
- CSV evidence: `weeks/week-16/artifacts/20260817T003425Z/architecture_farkle_trials.csv`

## Contract checks

- GREEN — generated canonical package matches provenance hashes
- GREEN — required path is explicitly native Python CPU
- GREEN — no accelerator use is claimed
- GREEN — fixed five-strategy suite executed
- GREEN — raw win/tie/start denominators are internally consistent
- GREEN — deterministic outcomes match across timing repeats
- GREEN — median/min/max throughput evidence is positive and ordered

## Fixed CPU suite

| strategy | win rate vs bank_at_425 | median games/s | min | max |
|---|---:|---:|---:|---:|
| bank_at_300 | 0.600 | 3039.38 | 2999.05 | 3079.72 |
| learner:2000 | 0.650 | 3065.15 | 3065.01 | 3065.29 |
| learner:500 | 0.525 | 2987.56 | 2981.92 | 2993.19 |
| rollout:10 | 0.650 | 824.86 | 824.67 | 825.06 |
| rollout:25 | 0.600 | 427.08 | 426.78 | 427.38 |

## Interpretation boundary

This is a Brandy native-Python CPU receipt. It is not a Tesla T4 result.
A future accelerator lane must prove that the workload actually dispatches
to the accelerator and preserves the benchmark contract before its numbers
may be compared as accelerator evidence.

## Command

```text
python scripts/validate_week16_farkle.py
```
