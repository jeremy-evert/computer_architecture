# Week 12 Wednesday - Scaling and communication

## Professional Minds

*Getting Things Done*. Keep the professional strand human and light; no forced parallel-computing metaphor.

## Part 1 - Scaling

```bash
./lab/bin/archlab run scaling --work 4000000 --out-dir dossier/evidence/week12-scaling
./lab/bin/archlab plot scaling dossier/evidence/week12-scaling/scaling.csv --out dossier/evidence/week12-scaling/scaling.png
```

1. Write an Amdahl-style idealized prediction before running.
2. Run the 4,000,000-work specimen.
3. Plot runtime/speedup across available worker counts.
4. Identify where added workers help and where returns weaken or become noisy.
5. Separate measured result from scheduling/cache/coherence explanations.

## Part 2 - Chatterbox vs Freight Train

```bash
./lab/bin/archlab run communication --out-dir dossier/evidence/week12-communication
./lab/bin/archlab plot communication dossier/evidence/week12-communication/communication.csv --out dossier/evidence/week12-communication/communication.png
```

1. Compare many dependent messages with a bulk transfer under controlled waits.
2. At the 20 ms setting, explain the difference in sensitivity.
3. State clearly: this is a user-space per-message-wait model, not an Internet latency measurement.

## Fallback

Use `scaling-reference.csv` and/or `communication-reference.csv` when local hardware is too small/noisy. Same reasoning ceiling.

## Dossier

**ADD** both Sensitivity Profile plots and a revised parallelism rule.