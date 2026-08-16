# Prompt 004_a - Build the shared Architecture authoring kit

**Status:** COMPLETE - executed 2026-08-16  
**Parent charter:** `004_author_weeks_05_14_architecture_core.md`  
**Depends on:** Prompts 001-003 complete enough for authoring  
**Receipt:** `../reports/004_a_build_shared_authoring_kit.md`  
**Unblocks:** 004_b through 004_k under the shared week contract

> This work order has been executed. The durable authoring contract now lives in `../../weeks/` and the receipt records the decisions and build proof.

## Why this prompt exists

Prompt 004 can still die by fragmentation even if every week author reads the same constitution. If Week 5 invents one lecture shape, Week 8 invents a notebook, Week 10 invents a new receipt, and Week 13 invents a different dossier handoff, students experience the seams between authors instead of the architecture.

004_a builds the smallest shared kit that makes later weeks recognizable without making them templated sludge.

The goal is not bureaucracy. The goal is to let every later author spend energy on the **machine question**, not on reinventing scaffolding.

## Read first

- parent Prompt 004 in full;
- `planning/block-map.md`;
- `planning/machine-dossier.md`;
- `docs/grading-model.md`;
- `planning/open-source-resource-canon.md`;
- `lab/CONTRACT.md`;
- `lab/MEASUREMENT.md`;
- `sidecar/reports/003_build_reproducible_architecture_lab.md`.

## Mission

Create the common authoring package for Weeks 5-14.

It must define the shape of a week without pre-writing the week.

## Required shared artifacts

### 1. Week-at-a-Glance convention

A student should be able to open any technical week and immediately answer:

- What is the central machine question?
- What am I supposed to believe/predict before the lab?
- What is Monday trying to teach me?
- What will I make the machine do Wednesday?
- What evidence will I explain Friday?
- Does this week change my Machine Dossier?

Keep this concise enough to function as navigation, not another lecture.

### 2. Monday lecture-source convention

Define a reusable source structure for:

1. central question;
2. prior belief/intuitive model;
3. architecture mechanism;
4. one persistent worked example/trace;
5. scope/limitations;
6. prediction for Wednesday;
7. unresolved question the machine gets to answer.

The source must support both a readable digest and a slide deck without requiring authors to duplicate all prose manually.

### 3. Slide/deck convention

Establish a lightweight Beamer/LaTeX or existing course-native deck pattern that:

- compiles reliably;
- supports equations, code/disassembly, diagrams, and plots;
- keeps slides visually teachable rather than text-dense;
- has speaker-note/recording-plan support or a paired notes file;
- does not require decorative template work every week.

Do not spend Prompt 004_a designing a brand identity.

### 4. Wednesday lab-handout convention

Every lab handout should make the experimental grammar visible:

**Predict -> Perturb -> Run -> Measure -> Visualize -> Explain -> Revise.**

Define standard sections for:

- question;
- prediction;
- controlled variable;
- held-constant conditions;
- exact `archlab`/tool path;
- expected evidence files;
- interpretation prompts;
- overclaim warning;
- fallback path;
- cleanup/re-run guidance where needed.

### 5. Explain / Defend receipt

Create one reusable student-facing receipt shape based on:

- Claim / question;
- Evidence that matters;
- Architecture mechanism;
- Limitation / what the evidence does not prove;
- Revision / what changed after seeing evidence;
- AI/tool use and independent verification where relevant.

It must be short enough to use weekly and strong enough that raw-output dumping cannot pass.

### 6. Machine Dossier handoff convention

Define a tiny weekly handoff block that forces the author to choose one of:

- ADD evidence;
- REVISE a claim;
- CORRECT a metric;
- PRESERVE a decision with stronger evidence;
- CONSULT only;
- NO DOSSIER CHANGE, with reason.

This is how we prevent worksheet accumulation.

### 7. Stack Showcase plan convention

Create a short instructor plan structure:

- course question;
- real system/tool being shown;
- evidence/action demonstrated;
- connection to student lab;
- what is intentionally beyond the required student path;
- one takeaway.

The showcase is a workshop door, not another assignment.

### 8. Reference-map convention

Each week must distinguish:

- course-owned teaching surface;
- primary/official truth source;
- optional/link-first reinforcement;
- license/reuse note where adaptation occurred.

Do not rebuild Prompt 002.

### 9. Validation receipt convention

A week validation receipt should record at minimum:

- date;
- authored commit;
- lab command(s) executed;
- result artifacts generated;
- links checked;
- deck build status;
- fallback checked;
- dossier handoff checked;
- remaining YELLOWs;
- platform on which execution occurred.

### 10. Week directory/file layout

Choose the smallest durable repository layout that makes authored materials obvious to both humans and Course Foundry/Imprint later.

Inspect existing repo conventions first. Do not invent twelve directories because the prompt listed twelve artifacts.

## Important design decisions to make here

- one-source vs paired-source approach for digest/deck;
- exact place for student-facing week packages;
- exact place for generated/rendered artifacts if committed at all;
- whether speaker notes live in deck source or separate recording plan;
- naming of lab receipts and validation receipts;
- how checkpoint weeks extend the ordinary weekly contract without becoming a second system.

## Non-goals

Do not:

- author Week 5 technical content;
- choose Week 5 budget/workloads;
- alter grading weights;
- alter the lab CLI;
- solve WSL/macOS yellow paint;
- build Savnac objects;
- create generic templates so abstract they are harder to use than copying a prior week.

## Required report

Write `sidecar/reports/004_a_build_shared_authoring_kit.md`.

Record:

- chosen conventions;
- files created;
- example/skeleton build proof;
- any tradeoffs rejected;
- what 004_b-004_k may now treat as frozen.

## Done when

A future week author can copy/adapt one small skeleton, understand exactly what belongs in Monday/Wednesday/Friday, know how evidence and dossier handoffs work, and begin authoring the Architecture idea immediately.

The kit should feel like a **well-stocked workbench**, not a form they have to fill out for HR.
