# Sidecar Prompt 006 - Imprint Computer Architecture into Savnac and read it back

**Status:** OPEN  
**Owner:** Foreman / deployment worker  
**Mode:** inspect -> compile -> imprint -> read back -> walk -> verify

## Mission

Make the current Git-backed Computer Architecture course visible and inspectable in Savnac through the established Course Foundry / Imprint machinery.

This is deployment/dogfood, not a second curriculum-authoring system.

Acceptance condition:

> Jeremy can open the intended Computer Architecture course in Savnac, navigate a recognizable current course, and see what the repository actually became.

Git remains authoritative. Savnac is the inspection surface. Production SWOSU Canvas remains out of scope.

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
- current week source
- `docs/grading-model.md`
- actual assignments/labs/rubrics that have landed
- `sidecar/PLANNING.md`
- `sidecar/questions/*.md`
- relevant `sidecar/reports/*.md`

### Existing deployment machinery

Inspect Course Foundry / Imprint and the most recently accepted Savnac deployment paths for sibling courses, especially CS1/CS2/DSCT.

Locate the actual desired-course compiler, dry-run/diff path, write path, identity mapping, and read-back/acceptance tooling that currently own this responsibility.

Reuse/generalize existing machinery where a real Architecture gap proves generalization necessary. Do not clone a parallel LMS stack.

## Pinned rendered-course doctrine

The rendered course must preserve:

- official modality = online/asynchronous;
- M/W/F = release/recording grammar, not attendance;
- Monday = AI Fluency + lecture/deck/recording;
- Wednesday = Professional Minds + lab;
- Friday = Professional Minds + Explain/Defend + optional instructor Stack Showcase;
- Weeks 1-4 = investigator runway;
- Weeks 5-14 = complete Architecture technical runway;
- Machine Dossier starts Week 5 and freezes Week 14;
- checkpoints = Weeks 6, 9, 14;
- Week 14 = technical finale;
- Week 15 = wind-down;
- Week 16 = shared Farkle + ML application/fun, not an Architecture capstone/Checkpoint 4;
- Week 17 = reflection, no new technical content.

The Savnac course must not imply that students are required to purchase or possess:

- zyBooks/commercial textbook;
- paid ChatGPT/Claude/other AI subscription;
- Codex/Claude Code/other premium CLI agent;
- specialized GPU hardware.

Optional premium resources must be visibly optional and may not raise the grading ceiling.

## Grading boundary

The **grading category weights and checkpoint cadence are already accepted** in `docs/grading-model.md`.

Do not reopen or silently replace them.

Still unresolved operational mechanics include:

- exact due-day/time cadence;
- late-work handling;
- exact drop-lowest mechanics;
- revision/resubmission windows;
- final Canvas assignment/object wiring;
- institutional calendar/dead-days verification.

Savnac may represent source-backed category/group intent where the compiler supports it, but it must not fabricate those unresolved mechanics simply to make the course look complete.

## Sequencing

This prompt may open early for reconnaissance, but do not publish fake-green weeks merely because the semester map names them.

A useful first imprint can include only source-backed material, such as:

- Course Information / landing context;
- Week 1;
- Week 2;
- Week 3;
- Week 4;
- later weeks only as they become genuinely authored and validated.

As more source lands, extend the same desired-state path without duplicate objects.

## Required work

### 1. Resolve intended Savnac identity

Before writing, inspect Savnac and determine:

- existing Computer Architecture dogfood course identity;
- course ID/code/name;
- instructor enrollment;
- publication/state as relevant;
- current modules/pages/assignments/rubrics/groups;
- stale/partial content already present.

Do not create a duplicate course because discovery is inconvenient.

### 2. Reconcile Git source against compiler

Run the existing Architecture desired-state/dry-run path if one exists.

If no Architecture compiler exists but shared machinery can be parameterized cleanly, generalize the shared path rather than cloning it.

Represent unresolved values honestly.

Do not invent:

- due dates/times;
- late penalties;
- drop rules;
- revision windows;
- unsupported point mechanics;
- submission mechanisms not backed by source;
- commercial-resource requirements;
- premium-tool requirements;
- production configuration.

### 3. Imprint only source-backed objects

Prioritize a coherent student journey over object count.

Once source exists, rendered course should expose as appropriate:

- course identity/information;
- zero-cost required-materials doctrine;
- semester/weekly navigation;
- Week at a Glance or equivalent weekly landing;
- course-owned/open references;
- lecture/deck/recording links when authored;
- actual labs/evidence objects/rubrics that are source-ready;
- grading-group intent from `docs/grading-model.md` when implementation is source-backed;
- coherent Week 1 -> Week 2 -> Week 3 -> Week 4 path.

### 4. Read Savnac back

Verify the rendered target, not merely the outbound payload:

- correct course identity and instructor;
- module order/navigation;
- page/assignment/rubric/group existence;
- source-owned links;
- student-visible state where appropriate;
- Week 1 has no Architecture gate;
- Week 2 does not imply a paid AI/provider/CLI requirement;
- Weeks 3-4 match the laboratory/observation runway;
- Week 5 begins the Machine Dossier when it is published;
- checkpoints appear only at Weeks 6, 9, 14 when those objects exist;
- Week 14 is visibly the Architecture technical finale;
- Week 15 does not create a hidden technical preflight;
- Week 16 is not rendered as an Architecture capstone/Checkpoint 4;
- Week 17 adds no new technical content;
- no stale textbook-driven week titles overwrite the current spine;
- no zyBooks/commercial text, GPU, or premium AI/CLI appears required;
- no duplicate objects were created.

### 5. Professor/student walk

Where acceptance tooling permits, walk the rendered course as professor and/or synthetic student.

Ask:

- Can a student tell what this week is about?
- Can they find lecture/reference/lab/evidence items that actually exist?
- Can the required path be completed without a paywall/premium tool/special hardware?
- Can they move forward/back without traps?
- Do YELLOW/unpublished items appear honestly rather than as dead links?
- Does rendered language match Git source?

### 6. Prove immediate re-run behavior

Run supported dry-run/diff/no-op again after imprint.

Desired state:

- no duplicate objects proposed;
- no unexplained source-owned drift;
- intentional YELLOWs explicit;
- second imprint safe/understood.

## Production boundary

This prompt authorizes **Savnac writes only**.

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
- deployment paths reused/generalized;
- resolved Savnac course identity;
- pre-write reconnaissance;
- compiler/dry-run result;
- objects created/updated/left untouched;
- grading-group handling and unresolved operational mechanics;
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

1. the intended Architecture dogfood course, not a duplicate, was used;
2. rendered content comes from current Git source;
3. unsupported operational grading facts were not fabricated;
4. accepted grading structure was not silently replaced;
5. zero-cost/CPU-only path remains visible;
6. Week 1-4 navigation reflects the investigator runway;
7. Week 14 is the technical ending and Week 16 is not a hidden capstone;
8. immediate re-run behavior is safe/understood;
9. production Canvas/zyBooks were not mutated;
10. established deployment machinery was reused.

## Done when

Computer Architecture can be compiled from current repository truth, imprinted into the intended Savnac course, read back, navigated, and re-run without duplication, fabricated policy, stale curriculum, or hidden paid-resource requirements.
