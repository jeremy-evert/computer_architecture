# Sidecar Prompt 001 - Reconcile and validate the Computer Architecture course source chassis

**Status:** OPEN - review/validation pass  
**Owner:** Foreman  
**Mode:** inspect -> compare -> reconcile only where needed -> validate -> report

## Mission

Review the course-source chassis that now exists and make sure it is coherent, internally consistent, and recognizably aligned with the planning grammar used across CS1/CS2/DSCT.

**Do not recreate the chassis.** Jeremy and ChatGPT have already established:

- `planning/fall-2026-course-design.md`
- `planning/fall-2026-spine.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/week-01.md` through `planning/week-16.md`
- `planning/week-17-finals.md`
- `docs/grading-model.md`

The job now is to catch drift, broken links, duplicated truth, stale doctrine, or structural inconsistencies before the canon/lab/week-authoring work deepens the tree.

## Read first

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- all files under `planning/`
- `docs/grading-model.md`
- `sidecar/PLANNING.md`
- all `sidecar/questions/*.md`
- `sidecar/README.md`

Inspect current CS1/CS2/DSCT planning where useful. The goal is **family resemblance, not cloning**.

## Pinned truths to preserve

- official section = online/asynchronous;
- M/W/F 2 PM = Jeremy's production/release rhythm only;
- Monday = AI Fluency + lecture/deck/recording;
- Wednesday = Professional Minds + hands-on investigation/lab;
- Friday = Professional Minds + Explain/Defend + optional instructor Stack Showcase;
- instructor stack visibility is pedagogy, not a student requirement;
- Week 1 = universal survive/thrive/enjoy opening; no Architecture gate;
- Week 2 = provider-neutral AI Lab Training;
- Week 3 = Containers & Repeatability;
- Week 4 = Linux as a Machine Telescope;
- **Weeks 5-14 are the entire Architecture technical runway**;
- Machine Dossier begins Week 5 and freezes Week 14;
- sensory-lab doctrine = predict -> perturb -> run -> measure -> visualize -> explain -> revise;
- Python/matplotlib is the planned visualization instrument;
- LaTeX is the planned dossier publishing instrument, both scaffolded;
- Week 6 = Checkpoint 1;
- Week 9 = Checkpoint 2;
- Week 14 = Checkpoint 3 and technical finale;
- Week 15 = Thanksgiving asynchronous wind-down, no new Architecture layer;
- Week 16 = shared Farkle + ML application/fun, **not** an Architecture capstone or Checkpoint 4;
- Week 17 = reflection, no new technical content;
- grading structure is now recorded in `docs/grading-model.md`;
- due/late/drop operational mechanics remain open;
- no required commercial textbook/zyBooks;
- no required paid AI;
- no required premium CLI agent;
- no specialized GPU requirement;
- CPU-only completion path;
- RISC-V is planning-leading independent of commercial resources.

## Required work

### 1. Compare durable planning zoom levels

Verify README, course design, arc map, block map, Machine Dossier contract, spine, week files, grading model, sidecar planning, and prompts tell the same story.

Pay special attention to stale phrases such as:

- "Week 14 capstone launch";
- "Week 15 capstone preflight";
- "Week 16 Architecture capstone";
- "Checkpoint 4";
- "grading still fully open."

Those are superseded.

### 2. Check CS-family resemblance

Confirm a contributor can recognize:

- universal Week 1;
- shared AI Fluency progression;
- shared Professional Minds progression;
- persistent authentic course artifact;
- checkpoint/synthesis rhythm;
- deliberate Week 15-17 wind-down.

Do not force live classroom structures into an asynchronous course.

### 3. Preserve honest readiness

The week files and master plan are planning source, not proof that decks/labs/plots/scripts have been authored or executed.

Do not promote placeholders into fake-green content.

### 4. Validate structure

Run repository-native checks and `git diff --check`.

Check internal links/paths/names and stale doctrine.

Do not mutate Savnac or production Canvas.

## Explicit non-goals

- no new curriculum redesign;
- no changing grading weights without Jeremy;
- no inventing due/late/drop mechanics;
- no paid tool requirements;
- no commercial-textbook requirement;
- no container implementation;
- no full Weeks 5-14 authoring;
- no Savnac/production Canvas writes.

## Required report

Write:

`sidecar/reports/001_reconcile_course_source_chassis.md`

Include:

- source commits inspected;
- sibling patterns compared;
- stale doctrine corrected;
- confirmation of M/W/F online production grammar;
- confirmation of Machine Dossier lifecycle;
- confirmation of Week 14 technical finale and Week 15-17 wind-down;
- grading-model consistency;
- remaining YELLOWs;
- validation results;
- worker commit SHA(s).

## Done when

The repo tells one obvious, current story and Prompt 002/003/004 workers can build against it without guessing.
