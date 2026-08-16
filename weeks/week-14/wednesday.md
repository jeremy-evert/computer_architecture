# Week 14 Wednesday - Architecture review and redesign

## Professional Minds

*Docs for Developers*. Use the strand to improve the clarity and navigability of the technical defense.

## Procedure

1. Reopen the original Week 5 workload, $1,500 constraint, baseline machine, dated market evidence, and `Claim waiting to be attacked`.
2. Refresh current prices/specifications with the **same evidence schema**. Preserve the original snapshot.
3. Select at least **four consequential design choices** to defend.
4. At least **three choices** must cite course-produced technical evidence from different parts of Weeks 6-13.
5. For each choice record:
   - original choice;
   - current choice;
   - changed or deliberately unchanged;
   - workload requirement;
   - chosen metric/evidence;
   - tradeoff accepted;
   - uncertainty/limitation.
6. Write a concise executive architecture defense.
7. Build the final Dossier PDF.
8. Run a consistency check: important adjectives in the executive defense should point to a measurement, trace, source, or clearly labeled assumption.
9. Freeze the technical dossier.

## Dossier build

```bash
./lab/bin/archlab dossier build --work-dir dossier/final \
  --figure dossier/evidence/week08-dependency/dependency.png \
  --figure dossier/evidence/week10-memory/memory.png \
  --figure dossier/evidence/week12-scaling/scaling.png \
  --figure dossier/evidence/week12-communication/communication.png \
  --figure dossier/evidence/week13-vector/vector.png
```

If a figure is unavailable because you used validated fallback evidence, use the corresponding fallback-generated figure. Same reasoning ceiling.

## Market drift warning

A component may change because price/availability changed. Label that separately from a choice changed because the course taught you something.