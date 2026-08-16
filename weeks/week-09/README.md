# Week 9 - Follow the Program Down

> **Central machine question:** Can I follow one small program through the stack without losing the evidence chain?

## Week at a Glance

**Prior belief:** if I understand the layers individually, I can probably connect them without checking every handoff.

**Prediction:** which handoff are you least confident about: source-to-bits, bits-to-instructions, instructions-to-datapath, or dependency-to-performance?

**AI Fluency:** Lens 9 - Generate.  
**Professional Minds:** Wednesday - *Refactoring*.  
**Calendar:** Fall Break shortens the week. There is **no normal Friday burden**.  
**Checkpoint:** Machine Dossier Checkpoint 2.

## Continuity

Reuse the same `transform()` specimen from Weeks 6-8. This week is integration, not a new chapter.

The synthesis chain is:

**source meaning -> representation -> compiler/RV32I disassembly -> architectural state -> bounded datapath interpretation -> dependency/performance implication -> result**

Not every compiler phase belongs in Computer Architecture.

## Machine Dossier

**Action: REVISE.** Checkpoint 2 becomes a synthesis artifact that repairs gaps across Weeks 5-8.

## Required path

```bash
./lab/bin/archlab run riscv --out-dir dossier/evidence/week09-riscv-check
./lab/bin/archlab run dependency --updates 12000000 --out-dir dossier/evidence/week09-dependency-check
```

Reuse prior evidence when it is still valid; do not rerun merely to create duplicate files.

## Friday

Fall Break means no normal Friday Professional Minds or Explain/Defend burden. Do not move Friday to Thursday under another name.