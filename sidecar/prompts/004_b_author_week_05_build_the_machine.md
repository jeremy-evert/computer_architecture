# Prompt 004_b - Author Week 5: Build the Machine

**Status:** OPEN  
**Depends on:** 004_a complete  
**Continuity role:** creates the machine/workload/budget story that returns in Week 14

## Why this week exists

Weeks 2-4 taught students how to investigate. Week 5 finally gives them something worth investigating.

This is the week the course reveals its object: **a machine designed for a purpose, compared under real constraints, and documented well enough that later evidence can change the design.**

The danger is turning Week 5 into consumer shopping or component vocabulary. The payoff is giving every later architecture word a concrete machine and workload to attach to.

## Central question

> **What should I build for this workload, what does each part buy me, and how should I compare choices?**

## Read first

- parent 004;
- 004_a authoring kit;
- `planning/week-05.md`;
- `planning/machine-dossier.md`;
- Prompt 002 Week 5 source decisions;
- `lab/CONTRACT.md` and `archprobe` docs;
- grading model.

## Required intellectual movement

Student begins with naive hardware instincts and leaves with:

- a compatible proposed machine;
- an explicit workload;
- a bounded budget/constraint set;
- dated evidence for specifications and prices;
- an observable-machine snapshot;
- initial derived metrics;
- awareness that those metrics are provisional hypotheses, not final truth.

## Required historical DNA

### Would It Run?

Students must reason about compatibility, not merely select expensive parts.

Bound the depth to useful constraints such as socket/chipset, memory compatibility, storage/interface, power/form factor/thermals where needed.

### Would It Be Fun / Fit the Workload?

The workload must drive the machine.

Author a small set of humane workload archetypes or a guarded student-defined path. Candidates may include programming/build workloads, gaming, media creation, data/ML-shaped work, office/general-purpose, or another credible bounded use case.

Do not require benchmark expertise they have not learned yet.

### Dollars Per

Preserve the useful naive-metric instinct:

- $/GB or $/TB where retail capacity is real;
- $/core or similar only when its limitation is visible;
- do not fabricate retail $/GB for on-die cache.

Introduce architectural scarcity for cache rather than fake economics.

## Monday package

Teach:

- workload before specification;
- compatibility vs performance;
- hierarchy from registers/cache outward through RAM/storage/network/cloud at the right depth;
- capacity, latency, bandwidth as different axes without pretending students can measure all of them yet;
- market price vs architecture property;
- naive derived metrics as useful starting models.

End Monday with a prediction such as:

> **Which part of your proposed machine do you currently believe matters most for your workload, and what evidence would make you change your mind?**

## Wednesday investigation

Students should:

1. define/select workload and constraints;
2. build a compatible machine using PCPartPicker or an equivalent accessible workflow;
3. capture dated part/spec/price evidence;
4. calculate several bounded derived metrics;
5. run `archprobe` on an observable machine where supported;
6. distinguish designed machine from observed real machine;
7. create Machine Dossier v0.

Do not grade purchasing power. A constrained hypothetical budget is the intellectual equalizer.

## Friday Explain / Defend

Require a bounded design claim:

- one component where they spent intentionally;
- one component where they accepted a compromise;
- metric/evidence used;
- one reason the current metric may later prove naive.

Raw part lists do not count as explanation.

## Machine Dossier v0

Must include enough to survive to Week 14:

- workload statement;
- budget/constraints;
- designed machine;
- observable machine snapshot;
- dated market evidence;
- initial hierarchy ledger;
- initial assumptions;
- initial metrics;
- at least one predicted bottleneck/constraint.

## AI Fluency Lens 5

Use model/tool selection as a real reasoning exercise.

A strong move is to ask two different AI models or two differently framed prompts for a recommendation, then identify which assumptions/metrics caused the recommendations to differ. AI recommendations are candidates, not evidence.

## Professional Minds

Wednesday: *The Art of Thinking Clearly*  
Friday: *How Not to Be Wrong*

Keep the connection about reasoning errors/metric seduction, not forced book metaphors.

## Stack Showcase

Pick one real instructor machine and defend it as a design under a workload. Show something imperfect. A machine with compromises is pedagogically richer than a trophy spec sheet.

## Hard authoring decisions

004_b must actually decide:

- exact budget amount(s) and whether there are tiers;
- workload archetypes vs guarded free choice;
- what component categories are mandatory;
- exact initial hierarchy ledger columns;
- what price evidence students capture;
- how long the market-research task is allowed to become;
- whether a cloud/storage comparison belongs in required or enrichment material;
- which real machine is the Friday showcase.

## Validation

- verify all student instructions against current accessible web/product workflow;
- date-stamp any examples;
- run `archprobe` on at least one supported machine;
- prove the dossier v0 can feed later week conventions;
- confirm no commercial source is required.

## Report

Write `sidecar/reports/004_b_author_week_05_build_the_machine.md`.

## Done when

Week 5 gives the student a machine, workload, assumptions, and naive metrics that later weeks can attack.

The week should end with a design the student is willing to defend **and the course is eager to make them reconsider**.