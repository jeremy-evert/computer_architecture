# Week 8 Wednesday - Dependency and Overlap

## Professional Minds

*The Pragmatic Programmer*. Keep the connection around craftsmanship and measurement, not a second assignment.

## Commands

```bash
./lab/bin/archlab run dependency --updates 12000000 --out-dir dossier/evidence/week08-dependency
./lab/bin/archlab plot dependency dossier/evidence/week08-dependency/dependency.csv --out dossier/evidence/week08-dependency/dependency.png
```

## Procedure

1. Predict dependent versus independent behavior.
2. Run 12,000,000 total updates.
3. Generate the plot.
4. Compare `ns/update`, not only total runtime.
5. Relate the difference to dependency and available overlap.
6. Separately trace one small teaching-pipeline hazard and identify forwarding/stall behavior.
7. Write: `This experiment does not prove ______.` Name at least one microarchitecture claim outside scope.
8. Revise the performance rule you carried from Week 5.

## Expected evidence

- `dependency.csv`
- dependency JSON receipt
- `dependency.png`

## Fallback

Use the validated course reference dataset if the local measurement is unavailable or too noisy. Same prediction, plot interpretation, limitation, and grading ceiling.