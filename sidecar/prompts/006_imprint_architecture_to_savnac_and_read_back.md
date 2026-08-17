# Sidecar Prompt 006 - Imprint Computer Architecture into Savnac and read it back

**Status:** ACCEPTED 2026-08-17 — see `sidecar/reports/006_imprint_architecture_to_savnac_and_read_back.md`  
**Owner:** Foreman / deployment worker  
**Mode:** inspect -> compile -> dry-run -> authorized imprint -> read back -> walk -> verify

## Mission

Reconcile the current Git-backed Computer Architecture course into the **existing intended Savnac course 8** through the established Course Foundry / Imprint machinery, then read the rendered course back and verify the student/professor experience.

This is deployment/dogfood, not a second curriculum-authoring system.

Acceptance condition:

> Jeremy can open the intended Computer Architecture course in Savnac, navigate a recognizable current course, and see what the repository actually became.

Git remains authoritative. Savnac is the inspection surface. Production SWOSU Canvas remains out of scope.

## Current Savnac reality - not a blank slate

An earlier accepted Architecture deployment already imprinted the **partial** course into Savnac course 8 using the then-current compiler surface:

- shared Week 1;
- authored Week 5;
- 6 modules total in that partial state;
- 20 assignments;
- assignment-group weights summing to 100%;
- 51 objects created on the original blank-slate pass.

Therefore this prompt is a **reconciliation/extension** of an existing dogfood course, not permission to create another Architecture course or to assume every desired object is new.

Prompt 008 must first produce an inspected full-semester no-write diff against this existing state.

## Hard prerequisites

### Prompt 007 - launch-source validation

Accept a real Brandy receipt from the repaired Architecture launch-source branch. A stale receipt from an older worktree tip does not count.

### Prompt 008 - full-semester compiler + policy/compliance + dry run

Accept only after the compiler is:

- on the current kickoff API;
- targeted-test GREEN and Ruff GREEN on real sibling checkouts;
- source/policy truthful;
- Week 16 dead-days compliant;
- free of unsupported drop-lowest/due-time invention;
- successfully dry-run against the real existing Savnac course 8 with no unexplained deletes/duplicates/conflicts.

Do not begin a live imprint before both prerequisites are accepted.

## Read first

### Computer Architecture

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- `planning/fall-2026-course-design.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/fall-2026-spine.md`
- `docs/grading-model.md`
- `sidecar/questions/003_assessment_and_grading_contract.md`
- current week source
- actual assignments/labs/rubrics that have landed
- `sidecar/PLANNING.md`
- relevant `sidecar/reports/*.md`
- Prompt 007 and Prompt 008 receipts/reports

### Existing deployment machinery

Inspect Course Foundry / Imprint and the accepted unified Savnac CLI. Reuse the existing Architecture desired-course path and shared deployment machinery.

Do not clone a parallel LMS stack.

## Pinned rendered-course doctrine

The rendered course must preserve:

- official modality = online/asynchronous;
- M/W/F = release/recording grammar, not attendance;
- Monday = AI Fluency + lecture/deck/recording where scheduled;
- Wednesday = Professional Minds + Architecture investigation/lab where scheduled;
- Friday = Professional Minds + Explain/Defend + optional instructor Stack Showcase where scheduled;
- Weeks 1-4 = investigator runway;
- Weeks 5-14 = complete Architecture technical runway;
- Machine Dossier starts Week 5 and freezes Week 14;
- checkpoints = Weeks 6, 9, 14 only;
- Week 14 = technical finale;
- Week 15 = wind-down/professional pathway;
- Week 16 = shared Farkle + ML application/fun, **not** an Architecture capstone/Checkpoint 4 and **not** a week of prohibited recurring graded work during dead days;
- Week 17 = evidence-backed final reflection, no new technical content.

The Savnac course must not imply that students are required to purchase or possess:

- zyBooks/commercial textbook;
- paid ChatGPT/Claude/other AI subscription;
- Codex/Claude Code/other premium CLI agent;
- specialized GPU hardware.

Optional premium resources must be visibly optional and may not raise the grading ceiling.

## Grading boundary

The **grading category weights and checkpoint cadence are accepted** in `docs/grading-model.md`.

Do not reopen or silently replace them.

The operational mechanics are more nuanced:

- some shared-source scheduling facts are explicit (for example Professional Minds pre-session reading deadlines);
- the compiler may derive legal dates from the accepted weekly grammar and official calendar only where that derivation is documented;
- exact clock times, late-work behavior, revision/resubmission windows, and drop-lowest rules must not be fabricated simply because Canvas supports them;
- `sidecar/questions/003_assessment_and_grading_contract.md` owns any remaining Jeremy-level policy decision;
- Week 16 dead-days compliance is a release requirement, not an optional preference.

## Required work

### 1. Resolve and confirm intended Savnac identity

Before writing, inspect Savnac course 8 and confirm:

- course identity/code/name;
- instructor enrollment;
- publication/state as relevant;
- current partial modules/pages/assignments/rubrics/groups;
- stale/partial content already present from the earlier Week 1 + Week 5 imprint.

Do not create a duplicate course because discovery/reconciliation is inconvenient.

### 2. Review the accepted Prompt 008 dry-run diff

Confirm the full desired state extends/reconciles the existing partial course rather than duplicating it.

Block on:

- unexpected deletes;
- duplicate titles/objects;
- course-id mismatch;
- cross-course objects;
- unsupported grading-group rules;
- unsupported due times;
- Week 16 recurring graded work;
- stale textbook/premium-tool requirements;
- source-owned links that cannot resolve.

### 3. Live Savnac write boundary

A live Savnac push requires **explicit Jeremy authorization at the point of mutation**.

When authorized, use the established unified Course Foundry/Savnac path. Do not hand-create equivalent Canvas objects around the compiler because a reconciliation is inconvenient.

Production SWOSU Canvas remains separate and unauthorized.

### 4. Read Savnac back

Verify the rendered target, not merely the outbound payload:

- correct course identity and instructor;
- module order/navigation;
- page/assignment/rubric/group existence;
- source-owned links/files;
- student-visible state where appropriate;
- Week 1 has no Architecture gate;
- Week 2 does not imply a paid AI/provider/CLI requirement;
- Weeks 3-4 match the reproducibility/observation runway;
- Week 5 begins the Machine Dossier;
- checkpoints appear only at Weeks 6, 9, 14;
- Week 14 is visibly the Architecture technical finale;
- Week 15 does not create a hidden technical preflight;
- Week 16 is Farkle/application content with no hidden Architecture capstone and no prohibited recurring graded work;
- Week 17 adds no new technical content;
- no stale textbook-driven week titles overwrite the current spine;
- no zyBooks/commercial text, GPU, or premium AI/CLI appears required;
- no duplicate objects were created.

### 5. Professor/student walk

Where acceptance tooling permits, walk the rendered course as professor and/or synthetic student.

Ask:

- Can a student tell what each week is about?
- Can they find the lecture/reference/lab/evidence items that actually exist?
- Can the required path be completed without a paywall/premium tool/special hardware?
- Can they move forward/back without traps?
- Do YELLOW/unpublished items appear honestly rather than as dead links?
- Does rendered language match Git source?
- Does Week 16 stay useful without violating dead days?

### 6. Prove immediate re-run behavior

Run the supported dry-run/diff/no-op again after imprint.

Desired state:

- no duplicate objects proposed;
- no unexplained source-owned drift;
- no unintended delete/create churn;
- intentional YELLOWs explicit;
- second imprint safe/understood.

## Production boundary

This prompt may authorize **Savnac writes only after Jeremy explicitly approves the live write**.

It does not authorize:

- production SWOSU Canvas writes;
- production enrollments;
- zyBooks vendor writes/adoptions;
- production LTI configuration;
- credential disclosure.

## Required report

Write:

`sidecar/reports/006_imprint_architecture_to_savnac_and_read_back.md`

Include:

- source commits inspected;
- Prompt 007 receipt;
- Prompt 008 test/Ruff/dry-run receipt;
- deployment paths reused/generalized;
- resolved Savnac course identity;
- pre-write partial-course inventory;
- compiler/dry-run result;
- objects created/updated/left untouched;
- grading-group handling and operational-policy provenance;
- dead-days verification;
- rendered read-back verification;
- Week 14 hard-ending / Week 16 no-capstone verification;
- professor/student walk evidence;
- no-paywall/optional-premium verification;
- immediate re-run/drift behavior;
- unresolved source/YELLOW items;
- confirmation production Canvas/zyBooks were untouched;
- worker commit SHA(s)/receipts.

## Acceptance

Accept only when:

1. the intended existing Architecture dogfood course 8, not a duplicate, was used;
2. rendered content comes from current Git source;
3. unsupported operational grading facts were not fabricated;
4. accepted grading structure was not silently replaced;
5. zero-cost/CPU-accessible path remains visible;
6. Week 1-4 navigation reflects the investigator runway;
7. Week 14 is the technical ending;
8. Week 16 is not a hidden capstone and complies with dead days;
9. immediate re-run behavior is safe/understood and duplicate-free;
10. production Canvas/zyBooks were not mutated;
11. established deployment machinery was reused;
12. Jeremy can actually navigate and understand the rendered course in Savnac.

## Done when

Computer Architecture can be compiled from current repository truth, reconciled into the intended existing Savnac course, read back, navigated, and re-run without duplication, fabricated policy, stale curriculum, hidden paid-resource requirements, or calendar-policy violations.
