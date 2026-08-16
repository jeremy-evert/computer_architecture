# Sidecar Report 004_b - Author Week 5: Build the Machine

**Status:** COMPLETE WITH NAMED YELLOWS  
**Date:** 2026-08-16  
**Parent:** `sidecar/prompts/004_author_weeks_05_14_architecture_core.md`  
**Work order:** `sidecar/prompts/004_b_author_week_05_build_the_machine.md`

## Result

Week 5 is now a real authored technical week under `weeks/week-05/`.

It does not teach students to shop for a “best PC.” It gives them a persistent machine-design hypothesis that the rest of Computer Architecture can attack with stronger evidence.

The week is built around one controlled intellectual move:

> **Hold the workload and budget mostly still. Move a bounded amount of money/resources. Explain what the move buys, what it costs, and what you still cannot prove.**

That makes tradeoff a verb before students have learned pipeline, cache, multicore, or accelerator theory.

## Durable Week 5 package

Created:

```text
weeks/week-05/
  README.md
  monday.md
  monday.tex
  wednesday.md
  friday.md
  references.md
  _instructor.md
  _validation.md
```

Added course-owned observable-machine fallback evidence:

```text
lab/fallback_data/week05-machine-reference.json
lab/fallback_data/week05-machine-reference.txt
```

and updated `lab/fallback_data/README.md` so scope-limited machine evidence is a first-class fallback rather than an afterthought.

## Major decisions made

### 1. One fixed $1,500 hypothetical tower budget

Every student uses the same $1,500 USD pre-tax/pre-shipping system-unit constraint.

This is an intellectual equalizer, not a claim that $1,500 is a magic price point. Students do not buy anything and owning expensive hardware cannot raise the grading ceiling.

Included categories are CPU, compatible motherboard, RAM, primary storage, case, PSU, required cooling, and discrete GPU only when the workload/design needs one. Peripherals and OS licensing are excluded.

### 2. Four workload archetypes plus guarded free choice

The course-owned menu is:

- Build & Container Developer;
- Play & Stream;
- Create;
- Local Data / AI Explorer.

A guarded custom workload is allowed when the student names three concrete tasks, the important capacity/throughput/responsiveness concern, one likely bottleneck/uncertainty, and why the workload still fits the same tower constraint.

Students do not need benchmark expertise yet. A wrong Week 5 prediction is valid raw material for later learning.

### 3. PCPartPicker-style DNA without PCPartPicker dependency

The historical build experience survives, but no commercial builder is course truth.

The student may use PCPartPicker or an equivalent surface for convenience. The required reasoning path is a course-owned bounded compatibility checklist:

- CPU ↔ motherboard;
- motherboard ↔ memory;
- storage ↔ motherboard;
- board/GPU/cooler ↔ case;
- CPU/GPU ↔ PSU;
- usable graphics path.

Architecture/specification claims are verified against official manufacturer pages where practical. Market price is the dated observation from the retailer/aggregator the student actually saw.

During authoring validation, automated retrieval of `https://pcpartpicker.com/list/` returned HTTP 403. That strengthened the decision to keep a full manual/equivalent path rather than building the assignment around one site's current UI or bot policy.

### 4. Dated market evidence, no timeless parts list

The durable course does not contain a September 2026 “correct build.”

Students record exact model, observed USD price, URL, observation date, relevant architecture property, and official spec source when the claim matters.

Week 14 will refresh market evidence instead of confusing price drift with architectural learning.

### 5. One bounded budget perturbation

After a compatible baseline, the student reallocates roughly $100-$200 while keeping workload and total budget approximately fixed.

This prevents Wednesday from becoming two giant shopping lists. The student only needs enough change to expose a design tradeoff.

### 6. Dollars-Per survives, but gets intellectually honest

Required Week 5 metrics are:

- RAM $/GB;
- primary storage $/TB or clearly labeled $/GB;
- one deliberately naive proxy such as CPU $/advertised physical core or GPU $/GB VRAM;
- component budget-share percentages.

The student must name what the naive proxy hides.

L1/L2/L3 cache capacity appears in the hierarchy ledger, but cache receives no fabricated retail $/GB. Its Week 5 economics are architectural scarcity, not pretend shelf pricing.

### 7. No fake latency table

The Week 5 hierarchy ledger records capacity, whether the layer is separately purchasable, market price where meaningful, persistence, evidence source/date, and what the number hides.

Students are not asked to copy a universal nanosecond table from the web. Week 10 owns measured latency/bandwidth/locality behavior.

## Monday package

The Monday digest and 13-slide Beamer deck teach:

- workload before specification;
- compatibility before performance claims;
- capacity vs latency vs bandwidth as distinct questions;
- hierarchy from cache outward through RAM/storage;
- market price vs architecture property;
- budget share as a design statement;
- Dollars-Per as a model rather than a verdict;
- one controlled design reallocation;
- AI/model disagreement as hypothesis generation rather than evidence.

The deck uses a clearly synthetic CPU A/CPU B example so a recorded arithmetic demonstration cannot become stale product doctrine.

The Monday handoff is:

> **Under the $1,500 constraint, which resource deserves the largest budget share for your workload, and what evidence would make you move about $150?**

## Wednesday package

The investigation follows the shared 004_a grammar while adapting “perturb” to design rather than physical performance:

1. predict workload priority;
2. build a compatible baseline;
3. capture dated market/spec evidence;
4. calculate literal + intentionally naive metrics;
5. build the initial hierarchy ledger;
6. run `archprobe` on an observable machine;
7. make one bounded budget reallocation;
8. explain what changed;
9. revise the original prediction;
10. initialize Machine Dossier v0.

The market-data table schema is explicit and portable:

```text
category,component,observed_price_usd,source_url,observed_date,architecture_property,property_value,official_spec_url,notes
```

## Machine Dossier v0

The student begins a persistent working shape:

```text
dossier/
  machine-map.md
  evidence/
    week05-market.csv
    week05-archprobe/
      machine.json
      machine.txt
```

The Machine Map records:

- workload and constraint;
- baseline machine;
- controlled reallocation;
- compatibility receipt;
- hierarchy ledger;
- dated market evidence;
- observable-machine scope;
- initial metrics;
- predicted bottleneck;
- one **Claim waiting to be attacked**.

The final prompt is deliberately forward-looking:

> **Right now I believe ______ matters most to this workload because ______. The later measurement most likely to prove me wrong would be ______.**

Week 14 should preserve and revisit this original claim rather than rewriting history.

## Friday Explain / Defend

Friday requires the student to defend:

- one intentional spend;
- one accepted compromise;
- the evidence/metric used;
- what happened when budget was reallocated;
- one limitation of the metric;
- one future measurement that could change the decision.

Raw parts lists, shopping screenshots, or AI recommendations cannot satisfy the receipt.

## AI Fluency / Professional Minds integration

### AI Lens 5 - Select the Right Model

Students compare recommendations under materially different workload framing using two models, one model with two prompts/roles, or course-provided samples when live AI access is unavailable.

The durable distinction is:

> **AI output can nominate a design. Compatibility/spec/price evidence must be independently verified.**

### Professional Minds

Wednesday uses *The Art of Thinking Clearly* and Friday uses *How Not to Be Wrong* through one shared question:

> **How do attractive numbers and familiar stories trick us into feeling more certain than the evidence allows?**

No duplicate Professional Minds Architecture assignment was created.

## Source/current-web validation

On 2026-08-16 the authoring pass verified current official/public surfaces for representative hardware truth:

- AMD Processor Specifications;
- Intel product specifications/comparison;
- NVIDIA GeForce specification/comparison.

The week instructs students to use the official manufacturer page for the exact product selected rather than treating one generic table as permanent truth.

External manufacturer marketing/performance claims are hypothesis inputs, not neutral benchmark proof.

## Executed Observatory proof

The exact repository-root command shape used by the student handout was executed successfully on the available Linux validation surface:

```bash
./lab/bin/archprobe --out-dir /tmp/week05-archprobe
```

The observed receipt correctly reported:

- `container-visible` scope;
- Debian GNU/Linux 13;
- x86_64;
- AMD EPYC 9V74 model string;
- five visible logical processors;
- approximately 5.9 GiB visible memory;
- four cache records;
- no visible accelerator, with the explicit caveat that absence is not proof about the physical host.

The apparently odd combination of an 80-core processor model string with only five visible logical processors is pedagogically useful: it demonstrates why evidence scope is part of Architecture reasoning.

A copy of this privacy-safe receipt is committed as the Week 5 fallback. It is not a hardware baseline.

## Deck / recording validation

The Week 5 student deck compiled successfully using the shared 004_a Beamer contract:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

Validation artifact:

- 13 pages;
- 78,949 bytes;
- SHA-256 `b162f50c12243c13771d1ddd7b03577dfc984aca1ca751317bcab6053ebdf744`.

Instructor notes build also passed:

- 13 pages;
- 97,406 bytes;
- SHA-256 `63b9a65ef0147589363bdd94064a9d84b3beacea43586718f1f9847cb1fd3708`.

Rendered title, hierarchy, claims-boundary, and Wednesday-handoff frames were visually spot-checked with no clipping/overlap found.

## Friday Stack Showcase plan

Preferred showcase system: **STF 320 Bill**.

Reason: an ordinary instructional Windows machine with real institutional/use-case compromises is a richer design artifact than a trophy spec sheet.

The showcase will use the same grammar students use:

**workload -> constraint -> compatibility -> resource allocation -> evidence -> limitation.**

Current Bill hardware inventory must still be captured before the recording. April is the named backup if Bill is unavailable or a poor recording specimen.

## Cross-week handoff

### What 004_c may treat as frozen

- the $1,500 budget and selected workload persist;
- `dossier/machine-map.md` is the Week 5 baseline;
- original market evidence is preserved rather than rewritten;
- the observable-machine receipt keeps its scope label;
- the student's naive performance/resource claims are intentionally available for later correction;
- Week 6 must not ask students to redesign/re-shop the machine.

### Important ISA continuity boundary for Week 6

Week 5's designed/observable machine is the **workload and design context**.

Week 6's RISC-V specimen is the **bounded teaching ISA contract** used to follow meaning -> bits -> instructions -> architectural state.

Do not imply that the student's designed desktop literally becomes a RISC-V physical machine or executes the course specimen natively. Continuity comes from the same evidence habits, workload/design story, and Machine Dossier, while RISC-V provides a clean instructional lens for the ISA layer.

## Implementation history

- `b1955d3cbbbb358e85e50d55a337cc01a09fac85` - sharpen Prompt 004_b execution contract;
- `a50a6703d479e5f0c1eecf5096f00ffa2873c044` - establish Week 5 overview/student contract;
- `e50b78dec20e164db4a70ecb1d9ecb99db12ac6d` - author Week 5 core + fallback observable-machine evidence;
- `0615b66e3609f2c9ec7dabc6f3d4542f0a767f2a` - commit Week 5 validation receipt.

## Remaining YELLOWs

| Yellow | Blocks Week 6 authoring? | Blocks Week 5 student release? | Next proof |
|---|---|---|---|
| STF 320 Bill inventory / final showcase capture | no | final recording only | real Bill inspection / 004_m |
| WSL2 Observatory validation | no | yes if WSL2 is advertised as fully green | 004_m on real Windows Bill |
| macOS validation | no | only if macOS is advertised as supported | 004_m on real Mac |
| commercial builder UI drift | no | no; manual path is complete | re-check close to release |

## Disposition

**Prompt 004_b is complete with named deployment/recording YELLOWs.**

The Week 5 student/instructor package is coherent enough to unblock Prompt 004_c. The remaining YELLOWs do not change the Week 5 reasoning task and are already owned by later real-hardware/platform validation.
