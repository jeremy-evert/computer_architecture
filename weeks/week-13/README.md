# Week 13 - Different Machines for Different Work

> **Central machine question:** When does the workload justify a different kind of machine?

## Week at a Glance

**Prior belief:** if code is vectorized or moved to a GPU/accelerator, it should be faster.

**Prediction:** for the course's regular data-parallel loop, predict whether compiler vectorization will improve runtime at the course problem size and name one reason the expected advantage might fail to appear.

**AI Fluency:** Lens 13 - Decide.  
**Professional Minds:** Wednesday - *97 Things Every Programmer Should Know*; Friday - *How to Win Friends and Influence People*.

Week 12 established that adding general workers has costs. Week 13 asks whether changing the execution organization itself better fits the workload.

## Machine Dossier

**Action: REVISE.** Add workload-fit/specialization evidence and revise any Week 5 assumption that treats GPU/vector/accelerator headline numbers as automatically better.

## Required CPU-only path

```bash
./lab/bin/archlab run vector --items 4000000 --out-dir dossier/evidence/week13-vector
./lab/bin/archlab plot vector dossier/evidence/week13-vector/vector.csv --out dossier/evidence/week13-vector/vector.png
```

The 4,000,000-item size matches Prompt 003's executed smoke.

## Important doctrine

**Do not engineer a guaranteed speedup.** The committed validation run reported compiler vectorization and a **slower** vectorized/native build. That inconvenient result is valid Architecture evidence.

## Optional GPU enrichment

A GPU/accelerator comparison may appear in the instructor showcase or optional exploration, but must include setup/data movement and cannot change the grading ceiling.