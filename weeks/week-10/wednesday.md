# Week 10 Wednesday - Memory sensory lab

## Professional Minds

*Software Engineering*. Keep the strand about disciplined iteration/evidence, not a second assignment.

## Commands

```bash
./lab/bin/archlab run memory --out-dir dossier/evidence/week10-memory
./lab/bin/archlab plot memory dossier/evidence/week10-memory/memory.csv --out dossier/evidence/week10-memory/memory.png
```

## Procedure

1. Sketch expected pointer-chase and streaming shapes before running.
2. Run the validated memory sweep.
3. Plot the data.
4. Mark two or three regions where dependent-access behavior changes materially.
5. Compare those regions with streaming bandwidth.
6. Use Week 5/`archprobe` machine evidence only as corroboration; do not force measured cliffs to equal advertised cache capacities.
7. Work one small AMAT example supplied in lecture.
8. Revise one Week 5 hierarchy claim or metric.

## Expected evidence

- `memory.csv`
- memory JSON receipt
- `memory.png`

## Overclaim warning

Prefetch, TLBs, cache organization/replacement, scheduler activity, virtualization/container scope, and other machine effects can complicate the curve. Explain regions and plausible mechanisms; do not invent exact hierarchy boundaries.

## Fallback

Use `lab/fallback_data/memory-reference.csv` when the local signal is unavailable/too noisy. Same reasoning ceiling.