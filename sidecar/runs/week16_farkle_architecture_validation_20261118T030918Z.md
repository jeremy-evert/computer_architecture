# Computer Architecture Week 16 Farkle validation receipt

- UTC: 20261118T030918Z
- status: **GREEN**
- Python: 3.12.3
- Platform: Linux-7.0.0-38-generic-x86_64-with-glibc2.39
- host: `april`
- CPU: `Intel(R) Core(TM) Ultra 7 265`
- logical CPUs: 20
- execution mode: `native-python-cpu`
- accelerator used: `False`
- shared repository: `jeremy-evert/Farkle_and_Machine_Learning`
- shared source commit: `d3a1ed379a652731b0b6237c33b4fe42c518ac9e`
- JSON evidence: `weeks/week-16/artifacts/20261118T030918Z/architecture_farkle_receipt.json`
- CSV evidence: `weeks/week-16/artifacts/20261118T030918Z/architecture_farkle_trials.csv`

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
| bank_at_300 | 0.600 | 15157.69 | 12956.91 | 17358.47 |
| learner:2000 | 0.650 | 16653.91 | 16572.60 | 16735.21 |
| learner:500 | 0.525 | 14287.40 | 12212.04 | 16362.77 |
| rollout:10 | 0.650 | 4619.93 | 4589.27 | 4650.59 |
| rollout:25 | 0.600 | 2424.62 | 2416.46 | 2432.78 |

## Interpretation boundary

This is a native-Python CPU receipt from host `april` (lane `april-validation-cpu`). It is not an accelerator result.
A future accelerator lane must prove that the workload actually dispatches
to the accelerator and preserves the benchmark contract before its numbers
may be compared as accelerator evidence.

## Command

```text
python scripts/validate_week16_farkle.py
```
