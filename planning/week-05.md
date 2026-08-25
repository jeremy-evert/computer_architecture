# Week 5 - Build the Machine (Sep 14-18)

## Status

**AUTHORED / CORE VALIDATED - 2026-08-16.**

The durable teaching package is now `weeks/week-05/`.

Execution receipt: `sidecar/reports/004_b_author_week_05_build_the_machine.md`.

The student-facing intellectual path, Beamer/recording sources, Linux/container-visible Observatory path, and course-owned fallback evidence are validated. Remaining YELLOWs are deployment/showcase items rather than unresolved Week 5 pedagogy:

- capture the current STF 320 Bill inventory before the final Friday Stack Showcase recording;
- validate WSL2 on a real Windows machine before advertising that platform fully green;
- validate macOS if it will be advertised as supported;
- re-check live commercial builder/retailer surfaces near release because current market workflows drift.

## Weekly Focus

**What should I build for this workload, what does each part buy me, and how should I compare choices?**

This is the first real Architecture week. Students stop preparing the laboratory and begin using it.

The goal is not component identification or a shopping contest. Students connect workload, compatibility, budget allocation, hierarchy, evidence scope, and explicit tradeoff.

## Frozen Week 5 design

- one **$1,500 USD hypothetical tower budget** for every student;
- four course-owned workload archetypes plus a guarded custom-workload path;
- PCPartPicker-style building may be used as a convenience, but no commercial builder is required or treated as truth;
- official manufacturer specifications verify architecture/compatibility claims where practical;
- retailer/aggregator price observations are date-stamped evidence, not curriculum truth;
- every student creates one compatible baseline and then moves roughly **$100-$200** while holding workload and total budget approximately fixed;
- required first metrics include RAM $/GB, storage $/TB (or labeled $/GB), one deliberately naive workload proxy, and component budget shares;
- no fabricated retail $/GB for L1/L2/L3 cache;
- no copied universal latency table in Week 5. Later sensory labs earn those performance claims through measurement.

## Monday - Think / Frame / Lecture

**AI Fluency Lens 5: Select the Right Model.** *(Optional under Decision 029 — now hosted in Computing Commons, module "06 — Week 5: Shared Rhythm". Not a required Architecture obligation; the Build the Machine lecture below stands on its own.)*

Lecture: **Build the Machine.**

Frame the computer as a negotiated set of constraints rather than a collection of named boxes. Start with workload verbs, then ask which resources/specifications matter.

Students distinguish:

- compatibility from workload fit;
- capacity from latency from bandwidth;
- market price from architecture property;
- correct arithmetic from a defensible performance/value claim.

Monday ends with the prediction:

> **Under the $1,500 constraint, which resource deserves the largest budget share for your workload, and what evidence would make you move about $150?**

## Wednesday - Investigate / Break / Measure

**Professional Minds: _The Art of Thinking Clearly_ - How do attractive numbers and familiar stories trick us into feeling more certain than the evidence allows?** *(Optional under Decision 029 — now hosted in Computing Commons; not a required Architecture obligation.)*

Investigation:

1. choose/define a workload;
2. create a compatible $1,500 baseline machine;
3. complete the bounded compatibility receipt;
4. capture dated part/spec/price evidence;
5. calculate first Dollars-Per and budget-share metrics;
6. create the first cache/RAM/storage hierarchy ledger without false precision;
7. run `archprobe` on an observable machine or use the equal-ceiling course fallback;
8. make one controlled $100-$200 budget reallocation;
9. explain what the move bought, what it cost, and what remains unproven;
10. initialize Machine Dossier v0.

## Friday - Explain / Defend / Stack Showcase

**Professional Minds: _How Not to Be Wrong_ - same shared reasoning question.** *(Optional under Decision 029 — now hosted in Computing Commons; not a required Architecture obligation.)*

Students defend:

- one intentional spend;
- one accepted compromise;
- the evidence/metric used;
- what changed after the controlled reallocation;
- one limitation of their best-looking metric;
- one future measurement that could force revision.

Raw part lists, shopping screenshots, or AI recommendations are not sufficient evidence.

**Preferred Stack Showcase:** STF 320 Bill as a real instructional-machine design artifact. April is the backup. The final recording waits for an actual current inventory rather than inventing hardware facts.

## Evidence this week

**Machine Dossier v0:**

- workload + $1,500 constraint;
- designed baseline machine;
- controlled reallocation/tradeoff;
- compatibility receipt;
- dated market evidence;
- observable-machine snapshot with explicit scope;
- first hierarchy ledger;
- first Dollars-Per/budget-share metrics;
- predicted bottleneck/uncertainty;
- one **Claim waiting to be attacked** by later measurements.

Suggested working source:

```text
dossier/
  machine-map.md
  evidence/
    week05-market.csv
    week05-archprobe/
      machine.json
      machine.txt
```

## Machine Dossier role

**Begins here.** Action: **ADD**.

Preserve the original Week 5 evidence. Do not rewrite history later to make the original design look smarter. Week 14 deliberately returns to the same workload/budget/design argument with stronger evidence and refreshed market data.

## Week 6 continuity boundary

The Week 5 designed/observable machine remains the **workload and design context**.

Week 6's RISC-V specimen is the **bounded teaching ISA contract** used to follow meaning -> bits -> instructions -> architectural state.

Do not imply that the student's proposed desktop literally becomes a RISC-V physical machine or runs the teaching specimen natively. Continuity is the evidence habit, workload/design story, and Machine Dossier; RISC-V is the clean instructional lens for the ISA layer.

## Online-delivery note

M/W/F are asynchronous anchors. The Wednesday build is individual/asynchronous; Friday does not require live show-and-tell.

## Durable sources

- `weeks/week-05/`
- `sidecar/reports/004_b_author_week_05_build_the_machine.md`
- `weeks/week-05/_validation.md`
- `lab/fallback_data/week05-machine-reference.json`
- `lab/fallback_data/week05-machine-reference.txt`
