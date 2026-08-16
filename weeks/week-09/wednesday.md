# Week 9 Wednesday - Checkpoint 2 evidence chain

## Professional Minds

*Refactoring*. The useful connection is reorganizing fragmented understanding into a coherent system without changing the underlying behavior.

## Commands

Use existing verified evidence where possible. Re-run only to repair or reproduce a missing link.

```bash
./lab/bin/archlab run riscv --out-dir dossier/evidence/week09-riscv-check
./lab/bin/archlab run dependency --updates 12000000 --out-dir dossier/evidence/week09-dependency-check
```

## Build the chain

For one bounded source operation from `transform()` provide:

1. source meaning;
2. representation/value claim;
3. generated RISC-V disassembly;
4. architectural-state evidence;
5. Week 7 datapath/control interpretation for one instruction;
6. one Week 8 dependency/performance implication where useful;
7. explicit evidence pointers between layers.

Have AI generate a candidate chain or diagram. Mark every unsupported or mismatched-scope step and repair it.

## Self-audit

Can another person reproduce each evidence item without trusting an invisible step?

## Calendar rule

This Wednesday synthesis is the checkpoint. Do not create a normal Friday deliverable.