# Week 14 - Sit in the Architect's Chair

> **Central machine question:** Given my workload and constraints, what would I build now, and what evidence changed or strengthened my judgment?

## Week at a Glance

**Prior belief:** a final project should add one more impressive technical topic.

**Prediction:** before refreshing the market, name the Week 5 choice you are most likely to keep and the one most likely to change. Cite the course evidence that makes you think so.

**AI Fluency:** Lens 14 - Automate.  
**Professional Minds:** Wednesday - *Docs for Developers*; Friday - *Prompt Engineering for Generative AI*.  
**Checkpoint:** Machine Dossier Checkpoint 3.  
**Hard boundary:** technical Computer Architecture ends here.

## Role of the week

No new mechanism. Reopen the Week 5 workload, $1,500 constraint, baseline design, dated market evidence, and **Claim waiting to be attacked**. Use Weeks 6-13 evidence to make the architecture decision.

## Machine Dossier

**Action: REVISE, then FREEZE.** The final technical PDF freezes at the end of Week 14. Weeks 15-17 may read/curate/reflect on it, but do not add a new Architecture evidence layer.

## Required evidence

Defend at least **four consequential design choices**. At least **three** must cite course-produced technical evidence from different parts of Weeks 6-13. An unchanged choice can earn full conceptual credit when it is now defended for stronger reasons.

## Dossier build

```bash
./lab/bin/archlab dossier build --work-dir dossier/final \
  --figure dossier/evidence/week08-dependency/dependency.png \
  --figure dossier/evidence/week10-memory/memory.png \
  --figure dossier/evidence/week12-scaling/scaling.png \
  --figure dossier/evidence/week12-communication/communication.png \
  --figure dossier/evidence/week13-vector/vector.png
```

## Market refresh

Use the same Week 5 dated evidence procedure. Market drift is **not** the same thing as learning. Separate `price/spec changed` from `my architecture judgment changed`.

## Hard stop

No hidden new unit, Checkpoint 4, technical dependency in Week 16, or post-Week-14 dossier layer.