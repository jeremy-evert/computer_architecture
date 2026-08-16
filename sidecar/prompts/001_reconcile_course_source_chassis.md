# Sidecar Prompt 001 — Reconcile the Computer Architecture course source chassis

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** inspect → reconcile → author bounded source → validate → report

## Mission

Turn the accepted Fall 2026 planning decisions into a clean durable source chassis without inventing unresolved grading, zyBooks, or production-Canvas policy.

This is not a mandate to author the whole semester. It is the structural pass that makes later week-sized authoring safe and consistent.

## Read first

### This repository

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- `planning/fall-2026-spine.md`
- `planning/fall-2026-course-design.md`
- `sidecar/PLANNING.md`
- all `sidecar/questions/*.md`
- `sidecar/README.md`

### Shared/sibling evidence

Inspect the current accepted Week 1 source in `jeremy-evert/computer_science_1`, especially `planning/week-01.md`, and the corresponding current Week 1 shape in CS2/DSCT as needed. The goal is to source or faithfully align the universal Week 1 rather than letting Architecture grow a divergent copy.

Inspect reusable shared-course infrastructure before duplicating it. If `semester_kickoff_week`, `swosu_cs_curriculum`, Course Foundry, or another shared repository already owns a reusable artifact, reference/reuse it rather than cloning stale content.

## Pinned truths to preserve

- official section = online/asynchronous;
- M/W/F 2 PM = Jeremy's planning rhythm only;
- Week 1 = survive semester / thrive degree / enjoy career, no Architecture technical gate;
- Week 2 = AI Lab Training;
- Week 3 = Containers & Repeatability;
- Week 4 = Linux Command Line Introduction;
- Weeks 5–14 = architecture core from the accepted spine;
- Week 15 = Thanksgiving/travel asynchronous lightweight preflight;
- Week 16 = Farkle + ML architecture capstone;
- Week 17 = reflection + evidence-backed demonstration of understanding;
- Architecture stays with zyBooks, but exact product/ISA and grade role remain open;
- do not silently replace the operational MIPS zyBook metadata until a real adoption change exists.

## Required work

### 1. Reconcile top-level documentation

Inspect `README.md` for stale claims after the new planning pass.

Update it only where needed so a new contributor can tell:

- what the course is;
- where the accepted 17-week spine lives;
- where active deployment planning lives;
- that the currently recorded MIPS zyBook is operational truth but not necessarily the final pedagogical ISA/product;
- which decisions are still open.

Do not turn the README into the sidecar work log.

### 2. Establish week-file chassis

Create a consistent durable week-planning location/pattern if the repo does not already have one.

At minimum create source-backed planning files for:

- Week 1;
- Week 2;
- Week 3;
- Week 4;
- Week 15;
- Week 16;
- Week 17.

These are the weeks Jeremy has explicitly shaped and can therefore be represented now.

For Weeks 5–14, do **not** manufacture full lessons in this prompt. If useful, create only thin stubs generated directly from the accepted spine, clearly marked for Prompt 004 ownership.

### 3. Give every week the same planning schema

A week file should make it easy for later authoring and Course Foundry to find, where applicable:

- dates/status;
- weekly focus / central question;
- Monday/Wednesday/Friday planning rhythm;
- learning objectives;
- references/content layer;
- inspect/build/measure activity placeholder or accepted activity;
- evidence/submission intent;
- dependencies/tooling;
- readiness state;
- explicit unresolved items.

Do not invent due dates, point totals, grading weights, late policy, or zyBooks section numbers.

### 4. Preserve Week 1 universality

Architecture's Week 1 should align with the current shared Week 1 doctrine rather than introducing hardware vocabulary because the course title says Architecture.

No technical architecture quiz/lab/setup gate should be smuggled into Week 1.

### 5. Make Weeks 2–4 cumulative

The source should show the intended progression:

- Week 2 teaches AI-assisted investigation + verification notebook;
- Week 3 establishes reproducible containers/environment;
- Week 4 teaches Linux commands by using them to observe the machine;
- Week 5 can therefore begin architecture content with students already able to run, inspect, measure, record, and verify.

### 6. Validate structure

Run repository-native validation if it exists and `git diff --check`.

Check internal links/paths.

Do not mutate Savnac or production Canvas in this prompt.

## Explicit non-goals

- no grading weights;
- no final zyBooks product selection;
- no vendor configuration;
- no full Weeks 5–14 authoring;
- no container implementation beyond placeholders/interfaces needed by source;
- no production Canvas writes;
- no giant refactor of sibling repositories.

## Required report

Write:

`sidecar/reports/001_reconcile_course_source_chassis.md`

Include:

- source commits inspected;
- files created/updated;
- how Week 1 universality was preserved;
- week-file schema chosen;
- any shared artifacts reused instead of copied;
- remaining YELLOWs;
- validation results;
- worker commit SHA(s).

## Foreman acceptance

Foreman independently verifies that:

1. the accepted semester shape is discoverable and internally consistent;
2. explicitly shaped weeks have durable week planning files;
3. Week 1 contains no Architecture-specific technical gate;
4. unresolved grading/zyBooks mechanics were not invented;
5. the repo is cleaner for later bounded week authoring, not merely larger.

## Done when

The repository has a coherent course-source chassis that faithfully represents Jeremy's accepted week structure and is ready for the lab-platform and week-authoring prompts to build on.
