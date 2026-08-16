# Week 10 - Make the Memory Hierarchy Hurt

> **Central machine question:** Why do we need layers of memory, and what does crossing a layer feel like?

## Week at a Glance

**Prior belief:** cache is fast, RAM is slow, and one speed number describes memory well enough.

**Prediction:** as the working set grows from tiny to tens of MiB, predict the shape of dependent-access time and whether streaming bandwidth should show the same shape.

**AI Fluency:** Lens 10 - Critique.  
**Professional Minds:** Wednesday - *Software Engineering*; Friday - *Agile Software Development*.

Monday attacks the Week 5 hierarchy ledger with locality, latency, bandwidth, working set, cache lines, misses, and a bounded AMAT model. Wednesday runs the memory sweep. Friday interprets regions and noise without claiming exact cache boundaries the evidence cannot support.

## Machine Dossier

**Action: ADD.** Add the memory plot and revise the hierarchy ledger so capacity, latency, bandwidth, scarcity/cost, and workload sensitivity are separate dimensions.

## Required path

```bash
./lab/bin/archlab run memory --out-dir dossier/evidence/week10-memory
./lab/bin/archlab plot memory dossier/evidence/week10-memory/memory.csv --out dossier/evidence/week10-memory/memory.png
```

## Scope

This week cares about **shape**, not memorized nanosecond tables. Prefetching, TLB behavior, replacement, machine load, and real cache organization can make cliffs noisy or shifted.