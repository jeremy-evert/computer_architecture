# Week 13 Wednesday - Specialization evidence

## Professional Minds

*97 Things Every Programmer Should Know*. Keep the connection around professional judgment and evidence.

## Commands

```bash
./lab/bin/archlab run vector --items 4000000 --out-dir dossier/evidence/week13-vector
./lab/bin/archlab plot vector dossier/evidence/week13-vector/vector.csv --out dossier/evidence/week13-vector/vector.png
```

## Procedure

1. Predict scalar-disabled versus native/vectorized runtime.
2. Run the 4,000,000-item specimen.
3. Inspect the compiler's vectorization report. Did vectorization actually occur?
4. Inspect enough disassembly/evidence to distinguish the two builds.
5. Compare repeated timing evidence.
6. **Do not delete or explain away a slower vectorized result.**
7. Decide whether specialization was justified for this exact workload/problem size/visible machine.
8. Use Week 12 vocabulary: regularity, dependency, grain, memory/data movement, setup overhead.
9. Optional GPU enrichment must include setup/transfer rather than only steady-state utilization.

## Fallback

Use the validated course vector receipt/reference if the live compiler/platform cannot expose a clean comparison. Same reasoning ceiling.