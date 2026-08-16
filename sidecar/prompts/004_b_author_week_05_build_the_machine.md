# Prompt 004_b - Author Week 5: Build the Machine

**Status:** READY TO EXECUTE  
**Depends on:** 004_a complete  
**Continuity role:** creates the machine/workload/budget story that returns in Week 14  
**Parent charter:** `004_author_weeks_05_14_architecture_core.md`

## Why this week exists

Weeks 2-4 taught students how to investigate. Week 5 finally gives them something worth investigating.

This is the reveal: the course is not fundamentally about naming parts inside a computer. It is about **making architectural choices under constraints, gathering evidence about those choices, and becoming willing to change the design when the machine disagrees with the story.**

Week 5 creates the persistent object that makes the rest of the semester coherent:

- one workload;
- one bounded budget;
- one designed machine;
- one observable real machine;
- one first set of assumptions and naive metrics;
- one Machine Dossier that later weeks are allowed to attack.

The danger is turning the week into consumer shopping, component trivia, or benchmark theater. The payoff is that every later word such as latency, bandwidth, locality, throughput, scaling, and specialization has a concrete machine and workload to attach to.

## Central question

> **What should I build for this workload, what does each part buy me, and how should I compare choices?**

## Frozen helm decisions for this execution

These decisions are deliberate and should not be reopened casually during authoring.

### One equalizing budget

Use a **$1,500 USD hypothetical tower budget**.

- tower/system unit only;
- pre-tax and pre-shipping;
- display, keyboard/mouse, operating-system license, and other peripherals are excluded;
- used hardware is not required;
- a discrete GPU is optional when the workload and CPU choice do not justify one.

The point is not that $1,500 is a magic market number. The point is to force comparable tradeoffs under one common constraint while keeping a realistic modern-desktop design space.

### Workload menu plus guarded free choice

Offer four course-owned archetypes:

1. **Build & Container Developer** - compilation, IDEs, containers/VM-shaped multitasking, general development responsiveness.
2. **Play & Stream** - modern interactive/gaming workload with simultaneous communication/light recording/streaming.
3. **Create** - photo/video/content-creation work where CPU, memory, storage, and optional accelerator choices all compete for budget.
4. **Local Data / AI Explorer** - data-analysis and modest local inference/experimentation, explicitly not giant-model training.

Allow a student-defined workload when it names:

- three concrete tasks;
- the most important capacity/throughput/responsiveness concern;
- one likely bottleneck or uncertainty;
- why the workload still fits the same $1,500 tower constraint.

Students do not need prior benchmark expertise to choose a workload. Predictions are allowed to be wrong.

### PCPartPicker is convenience, not truth

Preserve the historical PCPartPicker-style build experience, but do not make one commercial website a hard dependency.

- PCPartPicker or another accessible builder/retailer workflow may help assemble a candidate system.
- The course-owned compatibility checklist is the required reasoning surface.
- Architecture/specification claims should be verified against official manufacturer product/specification pages where practical.
- Price is a dated market observation from the retailer/aggregator the student actually saw.
- If a builder site is unavailable or inaccessible, the student can complete the same work manually from manufacturer + retailer evidence with no grading penalty.

### Dated evidence, not timeless shopping tables

Do not hard-code one August/September 2026 parts list as permanent curriculum truth.

For every price/spec observation record:

- component and exact model;
- observed price in USD;
- source URL;
- observation date;
- architecture/spec claim being used;
- official spec source when that claim matters.

Week 14 will refresh time-sensitive evidence rather than pretending the Week 5 market froze.

### One controlled design perturbation

After producing a compatible baseline build, the student must make one bounded reallocation while keeping the workload and total budget approximately fixed.

Examples:

- move about $100-$200 from CPU to GPU;
- trade storage capacity for RAM;
- trade a discrete GPU for stronger CPU/RAM/storage in a workload that can tolerate integrated graphics;
- choose a less expensive motherboard/case and spend the difference on another constrained resource.

The purpose is not to build two giant shopping lists. The purpose is to make **tradeoff** a verb.

### Dollars-Per doctrine

Require:

1. **RAM $/GB** when RAM is separately purchased;
2. **primary storage $/TB** (or $/GB with units made explicit);
3. one deliberately naive workload-facing proxy such as **CPU $/advertised physical core** or **GPU $/GB of VRAM** when relevant;
4. component **budget-share percentages**.

Then require the student to name what the naive proxy hides.

Do **not** fabricate retail $/GB for L1/L2/L3 cache. Cache capacity belongs in the hierarchy, but its Week 5 economic story is architectural scarcity, not a pretend shelf price.

### Week 5 hierarchy ledger

The first hierarchy ledger should include, where exposed/relevant:

- L1 cache;
- L2 cache;
- L3 cache;
- RAM;
- primary SSD/NVMe storage;
- optional secondary SSD/HDD/storage.

Columns should emphasize:

- capacity;
- separately purchasable or not;
- observed market price where meaningful;
- derived price/capacity where meaningful;
- persistence;
- evidence source/date;
- what the number fails to tell us.

Do not require students to paste a dubious nanosecond table from the web. Week 10 will make latency/bandwidth/locality measurable.

### Preferred Friday Stack Showcase

Use **the real STF 320 Windows machine (“Bill”)** as the preferred showcase because it connects the course back to a real instructional machine and invites discussion of ordinary constraints rather than trophy specifications.

Before recording, capture its current visible/spec inventory. If that machine is not ready for a clean recording, use April as the backup showcase and state the workload/constraints honestly.

The showcase plan may be authored now even though the real hardware inventory remains a later execution proof.

## Read first

- parent Prompt 004;
- `sidecar/reports/004_a_build_shared_authoring_kit.md`;
- `weeks/README.md` and `weeks/_template/`;
- `planning/week-05.md`;
- `planning/machine-dossier.md`;
- `planning/open-source-resource-canon.md`;
- Prompt 002 report;
- `lab/README.md`, `lab/CONTRACT.md`, and `archprobe` implementation/behavior;
- `docs/grading-model.md`.

## Required intellectual movement

The student begins with some version of:

> **A better computer is mostly the one with bigger numbers.**

The student should leave Week 5 able to say:

> **A part is useful only relative to a workload and constraint; compatibility determines whether the machine can exist, and every attractive metric hides something I have not measured yet.**

That second statement is still intentionally incomplete. Weeks 6-14 exist to make it better.

## Monday package

Teach only enough to make Wednesday's design investigation intellectually honest:

- workload before specification;
- compatibility vs workload fit;
- component role and interfaces at useful depth;
- hierarchy from cache outward through RAM/storage;
- capacity vs latency vs bandwidth as different questions;
- market price vs architecture property;
- budget allocation as a design decision;
- naive derived metrics as useful hypotheses rather than truth.

Use a clearly labeled **synthetic teaching example** for arithmetic/metric demonstrations so no sample price accidentally becomes permanent market doctrine.

End Monday with:

> **Under the $1,500 constraint, which component category do you currently think deserves the largest share of your budget for your workload, and what evidence would make you move about $150 somewhere else?**

## Wednesday investigation

Use the 004_a Wednesday grammar.

Students should:

1. select/define a workload;
2. state the initial predicted bottleneck/priority;
3. create a compatible baseline $1,500 build;
4. document the bounded compatibility checks;
5. capture dated market/spec evidence;
6. calculate the required Dollars-Per/budget-share metrics;
7. make one bounded budget reallocation and compare the story;
8. run `archprobe` on an observable machine where supported;
9. distinguish designed-machine evidence from observed-machine evidence;
10. initialize Machine Dossier v0.

The student should preserve machine-readable `archprobe` evidence rather than submitting a screenshot of system-information windows.

## Machine Dossier v0

Initialize a persistent student work directory with a shape compatible with later lab evidence, for example:

```text
dossier/
  machine-map.md
  evidence/
    week05-market.csv
    week05-archprobe/
      machine.json
      machine.txt
```

`machine-map.md` must contain:

- workload and $1,500 constraint;
- designed baseline machine;
- controlled reallocation/tradeoff;
- compatibility receipt;
- initial hierarchy ledger;
- initial derived metrics;
- observable-machine summary + evidence scope;
- at least one predicted bottleneck/constraint;
- one claim the student expects later evidence may overturn.

This is source evidence for the future dossier PDF, not a second grading system.

## Friday Explain / Defend

Require one compact architectural design argument:

- the component/category where the student spent most intentionally;
- the compromise they accepted;
- the metric/evidence used;
- what changed after the controlled reallocation;
- one limitation of the chosen metric;
- what future measurement would make them reconsider.

Raw parts lists, shopping screenshots, or AI recommendations do not satisfy the Explain/Defend requirement.

## AI Fluency Lens 5 - Select the Right Model

Use AI/model selection as judgment, not brand loyalty.

The required intellectual move is to compare recommendations produced under **different assumptions or framing** and identify why they diverge.

A student may use:

- two different available AI models;
- one model with two materially different prompts/roles;
- or course-provided recommendation samples when AI access is unavailable.

AI output may generate a candidate design or hypothesis. It is not compatibility/spec/price evidence.

## Professional Minds

Wednesday: *The Art of Thinking Clearly*  
Friday: *How Not to Be Wrong*

Use the shared question: **How do attractive numbers and familiar stories trick us into feeling more certain than the evidence allows?**

Do not create a duplicate Architecture assignment for the Professional Minds strand.

## Validation required before closure

- student deck builds from the 004_a Beamer contract;
- `archprobe` command actually runs on an available validated surface;
- fallback observable-machine evidence exists;
- official manufacturer spec sources are reachable for representative CPU/GPU claims;
- PCPartPicker is treated as optional convenience, not required truth;
- all hard-coded examples are synthetic or explicitly date-stamped;
- no premium tool, special hardware, or purchasing power changes the grading ceiling;
- Week 5 output clearly gives Week 6 and Week 14 persistent artifacts to consume.

## Required durable outputs

Create `weeks/week-05/` using the 004_a contract:

- `README.md`;
- `monday.md`;
- `monday.tex`;
- `wednesday.md`;
- `friday.md`;
- `references.md`;
- `_instructor.md`;
- `_validation.md`.

A small course-owned fallback machine snapshot may be added under the existing laboratory fallback-data contract when execution proves it useful.

## Report

Write `sidecar/reports/004_b_author_week_05_build_the_machine.md`.

## Done when

Week 5 gives the student a machine, a workload, a budget, a tradeoff, an observable-machine receipt, and intentionally naive metrics that later weeks can attack.

The week should end with a design the student is willing to defend **and the course is eager to make them reconsider**.
