# Week 12 - More Cores, More Problems

> **Central machine question:** When does adding workers help, and when does cooperation cost more than it buys?

## Week at a Glance

**Prior belief:** more cores means more performance as long as the program is parallel.

**Prediction:** predict 1 -> 2 -> 4 worker speedup, then predict which workload is more sensitive to a 20 ms per-message wait: many dependent messages or one bulk transfer.

**AI Fluency:** Lens 12 - Revise.  
**Professional Minds:** Wednesday - *Getting Things Done*; Friday - *Joy on Demand*.

Monday builds an Amdahl-style model and the chunky-versus-chatty workload vocabulary. Wednesday runs both the scaling and Chatterbox/Freight Train experiments as one investigation. Friday revises the rule for when adding workers helps.

## Machine Dossier

**Action: ADD.** Add scaling and communication Sensitivity Profile plots.

## Required path

```bash
./lab/bin/archlab run scaling --work 4000000 --out-dir dossier/evidence/week12-scaling
./lab/bin/archlab plot scaling dossier/evidence/week12-scaling/scaling.csv --out dossier/evidence/week12-scaling/scaling.png
./lab/bin/archlab run communication --out-dir dossier/evidence/week12-communication
./lab/bin/archlab plot communication dossier/evidence/week12-communication/communication.csv --out dossier/evidence/week12-communication/communication.png
```

The 4,000,000-work scaling size matches Prompt 003's executed smoke workload.

## Scope

The communication experiment is a course-owned user-space model of **per-message waiting sensitivity**, not a direct Internet/network benchmark. MPI syntax is not a learning goal.