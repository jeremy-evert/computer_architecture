# Prompt 030 — Computer Architecture → Optional Computing Commons, End-First Migration

Date: 2026-08-24
Owner: Jeremy Evert
Course: COMSC-3013 Computer Architecture
Production Canvas course: `75249`
Computing Commons Canvas course: `24298`

## Owner outcome

Finish the Fall 2026 optional-Commons cleanup for **Computer Architecture and Computer Architecture only**.

Work from the **end of the semester backward**. Harvest every useful non-Architecture-core assignment/resource into Computing Commons first. Then remove the Computer Architecture production assignment only when live evidence proves that **no student has submitted it and no grade/score exists**.

When this campaign is done:

1. Computing Commons contains the useful shared/enrichment material harvested from Computer Architecture as optional 0-point material;
2. Computing Commons has a durable migration ledger showing what it already has, what was copied, where it came from, and whether the Architecture original was removed or preserved;
3. the live Computer Architecture course is cleaned of future shared/enrichment assignment obligations that nobody has touched;
4. anything already touched by a student remains intact in Computer Architecture as historical/earned-credit evidence;
5. Computer Architecture source truth no longer instructs future deployment to recreate the removed shared/enrichment assignments; and
6. Computer Architecture's disciplinary core remains intact.

This prompt authorizes a bounded production migration, but only inside the exact safety rules below.

## Read first

Read and obey:

- `AGENTS.md`
- `README.md`
- `docs/grading-model.md`
- the current Week 1–17 source under `weeks/`, `assignments/`, `planning/`, and other active student-facing paths
- `jeremy-evert/swosu_cs_curriculum/decisions/029_fall_2026_optional_computing_commons_pivot.md`
- `jeremy-evert/swosu_cs_curriculum/reports/029_four_course_optional_commons_pivot_inventory.md`, especially §§15–16 live Canvas evidence
- `jeremy-evert/computing_commons/AGENTS.md`
- `jeremy-evert/computing_commons/README.md`
- `jeremy-evert/computing_commons/docs/source-registry.md`
- `jeremy-evert/computing_commons/docs/course-boundary-migration.md`

Immediately before any production mutation, refresh live Canvas state through the already-approved Harbor path. Do not rely only on Report 029's snapshot.

## Scope boundary

This campaign is **Computer Architecture only** plus the corresponding destination work in Computing Commons.

Writable project roots may include only:

- `jeremy-evert/computer_architecture`
- `jeremy-evert/computing_commons`

Production Canvas writes may target only:

- Computer Architecture `75249`
- Computing Commons `24298`

Do not modify CS1, CS2, DSCT, Software Engineering, Machine Learning, JTT curriculum content, or any other production course.

A thin JTT/Foreman pointer may be recorded if required by control-plane policy, but detailed work truth belongs in the two owning repositories above.

## Governing classification test

For every Architecture Canvas assignment/resource encountered from Week 17 backward, answer two separate questions.

### A. Does it belong to Computer Architecture?

**KEEP — ARCHITECTURE CORE** when the object directly teaches or assesses Architecture outcomes, including things such as:

- Weekly Architecture Investigation;
- Weekly Explain / Defend evidence;
- Machine Dossier checkpoints;
- architecture-specific CPU, memory, ISA, profiling, binary, hardware, performance, measurement, trace, or systems-analysis work;
- Linux use when it is a telescope for inspecting the machine rather than generic Linux training;
- Final Architecture reflection when it depends on the Architecture evidence trail;
- Course evaluation.

Zero submissions do **not** authorize deleting Architecture-core work.

### B. Is it shared/enrichment/accelerator material that Decision 029 moved out of the required course path?

Candidates include:

- AI Fluency / Monday Moments;
- Professional Minds Wednesday/Friday material;
- Success Foundations / Semester Kickoff material;
- professional pathway / resume / degree plan / dream job / LinkedIn / career artifacts;
- generic containers / WSL / LaTeX / Git / Linux / documentation training that is merely an accelerator;
- shared Farkle + Machine Learning finale material;
- similar synchronized shared enrichment that is not itself an Architecture learning outcome.

Only this second class is eligible for Commons harvesting/removal.

If classification is genuinely ambiguous, preserve the Architecture object and record the ambiguity. Do not delete first and debate later.

## End-first chain-gun execution

Work **Week 17 → Week 1**, continuing automatically from one accepted slice to the next.

For each eligible shared/enrichment assignment/resource:

### Step 1 — Read live state

Capture, aggregate only:

- Architecture Canvas object ID and type;
- name/title;
- week/module placement;
- assignment group and group weight when applicable;
- `points_possible`;
- due/lock dates;
- published state;
- submission count;
- recorded score/grade count;
- module-item references that would dangle if the assignment were removed.

No student PII in durable receipts.

### Step 2 — Check Computing Commons before copying

Search the Commons repo and live Commons Canvas for the same or substantially equivalent student experience.

If a good equivalent already exists:

- do **not** create a duplicate;
- record the existing Commons destination in the migration ledger;
- verify it is optional, 0 points/ungraded, and has no module completion requirement before treating it as a valid destination.

If it is not already there, copy/compose the best version into Computing Commons.

Prefer the Commons doctrine **stitch, do not fork**:

- when a canonical source exists (`ai_fluency`, `professional_minds`, `Farkle_and_Machine_Learning`, etc.), preserve provenance and compose/link/package the canonical material rather than creating a drifting independent curriculum source;
- nevertheless, the **student-facing Canvas experience** must exist in Computing Commons before the Architecture original is removed.

### Step 3 — Commons copy contract

Every migrated Commons Canvas assignment must be clearly optional:

- `points_possible = 0`;
- no required due date;
- no lock date that turns it into a required timed obligation;
- no module completion requirement;
- no requirement that a home course receive a receipt, link, reflection, or grade sync;
- title/body should make optional status clear without cluttering the student's experience.

Preserve a compact provenance note in the Commons migration ledger containing:

- original course: COMSC-3013 Computer Architecture;
- original Canvas object ID;
- original week/module;
- original title;
- original points possible;
- original assignment-group name and group weight where applicable;
- canonical source repo/path/blob when known;
- resulting Commons Canvas object/module/page ID or existing destination;
- migration date;
- disposition of Architecture original: `REMOVED — ZERO ACTIVITY`, `PRESERVED — STUDENT ACTIVITY`, `KEPT — ARCHITECTURE CORE`, or `DEFERRED — AMBIGUOUS`.

The ledger is the durable report of what Commons already has and what Architecture can safely delete.

Recommended durable location:

`computing_commons/docs/migration-ledger-computer-architecture-fall-2026.md`

Create it if it does not exist; update it idempotently if it does.

### Step 4 — Verify the Commons destination

Before touching the Architecture original, read the new/existing Commons object back and verify:

- correct student-facing content/destination;
- 0 points/ungraded;
- no required due date;
- no completion requirement;
- published/available if that is the intended optional student experience;
- provenance captured in the ledger.

If the Commons copy fails verification, do not remove the Architecture original.

### Step 5 — Remove only zero-activity Architecture objects

After Commons verification, an Architecture assignment may be removed only if **all** are true at mutation time:

1. it is classified shared/enrichment/optional accelerator, not Architecture core;
2. submission count is exactly 0;
3. recorded score/grade count is exactly 0;
4. no student work, comment, rubric assessment, or attempt would be destroyed;
5. every module/item reference that would dangle is identified and can be safely removed/repointed;
6. the Commons destination is verified first.

For eligible zero-activity objects, remove the assignment from Architecture and clean dangling module/navigation references so the live online course becomes simpler.

Do not merely unpublish a pile of dead objects when clean deletion is safe and verified; the owner wants the online course cleaned.

### Step 6 — Preserve anything with student activity

If **any** submission or recorded grade exists:

- do not delete the Architecture object;
- do not zero its points in this campaign;
- do not move it to another group;
- do not change its score/grade/rubric/due date;
- copy/ensure the optional Commons destination if useful;
- mark the Architecture object `PRESERVED — STUDENT ACTIVITY` in the ledger.

This intentionally protects Week 1 historical work and the known Week 2 AI Fluency activity unless a fresh live read proves otherwise.

A later bonus/legacy normalization campaign may deal with already-used objects. It is out of scope here.

## Known live evidence from Report 029 to re-check, not blindly assume

Report 029 §15–16 found on 2026-08-25T00:43Z:

- Architecture Semester Kickoff has real submissions and recorded grades on several items — preserve.
- Architecture AI Fluency Week 02 — Gather Context had 2 of 6 submissions — preserve.
- Architecture Professional Minds Wednesday/Friday instances had zero submissions at that snapshot.
- Architecture AI Fluency Weeks 3–16 had zero submissions at that snapshot.
- Architecture Professional Pathway Week 14/15 had zero submissions.
- Architecture Week 16 shared material was ungraded/0-point.
- Architecture course-core Weekly Investigation / Explain-Defend / Dossier / Final Reflection objects are not Decision 029 migration targets even when they have zero activity.

Fresh live state wins if any fact changed.

## Source-truth cleanup

The campaign is not complete if Canvas is cleaned but source truth would simply recreate the old structure tomorrow.

After each live removal (or in coherent bounded batches), reconcile `computer_architecture` active source so future deployment no longer recreates the removed required shared/enrichment objects.

Requirements:

- preserve Architecture-specific technical teaching;
- remove shared enrichment as **required graded Architecture work**;
- when a weekly Architecture page used a short Professional Minds/AI Fluency prelude before the actual daily experience, remove the required wrapper and let the Architecture experience start directly;
- do not reshuffle the semester merely to fill reclaimed time;
- keep optional references to Commons only when they genuinely help navigation and are clearly optional;
- preserve historical source/provenance in sidecar/history where repository conventions warrant it rather than destroying evidence;
- do not delete canonical source content owned by shared repos.

### Grading-model caution

This campaign may remove future shared/enrichment assignments from production, but **do not perform a live assignment-group-weight renormalization that could alter current earned grades** unless a separately verified impact preview proves every currently enrolled student's grade is preserved or improved.

It is acceptable for the source report to identify the pure-Architecture future grading model as remaining follow-up if live grade-weight surgery is not proven safe in this same campaign.

The owner outcome for this prompt is first and foremost: harvest shared material, delete untouched shared assignments, and stop future recreation.

## Computing Commons report/ledger behavior

The Commons ledger should become increasingly useful as a cross-course deduplication report.

For each Architecture candidate, explicitly state one of:

- `ALREADY IN COMMONS — NO COPY NEEDED`
- `COPIED TO COMMONS — NEW OPTIONAL OBJECT`
- `COMMONS SOURCE EXISTS — STUDENT DELIVERY COMPOSED`
- `NOT FOR COMMONS — ARCHITECTURE CORE`
- `AMBIGUOUS — PRESERVED`

This makes the next course cheaper: if Commons already has the same AI Fluency, Professional Minds, career, Local AI, tooling, or finale item, the next migration can reuse the verified destination rather than copying it again.

## Production safety

Use only the existing approved Canvas/Harbor/Course Foundry access path.

Do not:

- expose credentials or tokens;
- retrieve/persist student PII;
- weaken target/course allowlists;
- touch any production course except 75249 and 24298;
- alter enrollments;
- alter existing student submissions, scores, comments, rubric assessments, or attempts;
- delete an Architecture-core assignment because it happens to have zero submissions;
- delete before the Commons destination is verified;
- create graded/required Commons work;
- build Commons-to-home-course completion plumbing.

If an API/tooling boundary cannot safely perform a specific copy or delete, diagnose and repair only the smallest bounded non-production tooling seam already within Flo's authority. Otherwise record the item as deferred and continue with other safe items rather than stopping the whole campaign.

## Validation after each bounded slice

For every migrated/removed object:

1. Commons destination exists and is optional/0-point/no-completion-required.
2. Architecture source/destination provenance is recorded.
3. Architecture pre-delete activity counts were exactly zero.
4. Architecture object is absent after deletion.
5. No module item dangles.
6. No Architecture-core object changed.
7. Aggregate submission/grade counts for all pre-existing activity-bearing Architecture assignments are unchanged.
8. No student PII appears in Git receipts.

Periodically verify live assignment/module counts to catch accidental collateral changes.

## Durable report

Write the course-side execution report at:

`computer_architecture/sidecar/reports/030_architecture_to_optional_commons_end_first_migration.md`

It should summarize:

- source and live Canvas preflight;
- the end-to-front slices executed;
- Commons objects reused versus created;
- Architecture assignments removed;
- Architecture assignments preserved due to student activity;
- Architecture-core items explicitly kept;
- source files reconciled;
- any deferred ambiguity/tooling seam;
- aggregate before/after object counts;
- proof that student submissions/grades were not altered;
- final remaining Architecture cleanup, if any.

Commit and push accepted changes in both owning repositories according to their Git safety belts. Do not leave one repo claiming a migration the other repo has not actually received.

## Chain-gun policy

This prompt is the Owner authorization for the full **Computer Architecture-only** campaign.

Bounded weeks/items are safety slices, **not human stop points**. After one slice is verified, continue automatically to the next earlier week until Week 1 has been classified and the course outcome is complete.

Do not return to Jeremy/Olivia for routine classifications already answered by Decision 029 and this prompt.

Stop only for a genuine human gate:

- student activity appears on an object that would otherwise be deleted;
- content cannot be confidently classified as Architecture-core versus shared/enrichment;
- a proposed mutation risks existing student work/grades;
- repository state is unsafe/diverged and cannot be reconciled without risking pre-existing work;
- required production authority is missing;
- a tooling repair would require weakening a security/target boundary.

A single deferred object does not block safe progress on later/earlier items. Record it and keep firing through the remaining safe queue.

## Final verdict / sentinel

End the durable report with exactly one of:

- `ARCHITECTURE COMMONS MIGRATION COMPLETE — OPTIONAL HARVEST / ZERO-ACTIVITY CLEANUP VERIFIED`
- `ARCHITECTURE COMMONS MIGRATION PARTIAL — SAFE WORK COMPLETE / DEFERRED ITEMS RECORDED`
- `ARCHITECTURE COMMONS MIGRATION BLOCKED — HUMAN GATE REQUIRED`

When the first or second verdict is durably committed and pushed in both owning repositories, reply exactly:

`ARCHITECTURE COMMONS MIGRATION COMPLETE.`
