# Flo Job — Architecture Canvas Recovery: Inventory, Remove Legacy, Load Desired State

**Owner:** Jeremy / Piper  
**Foreman:** Flo  
**Worksite:** `jeremy-evert/computer_architecture`  
**Shared dependency allowed when necessary:** `jeremy-evert/course_foundry`  
**Production target:** SWOSU Fall 2026 `COMSC-3013-1438`, preflight target course id `75249`, subject to fresh live identity verification  
**Mode:** inventory → classification → bounded legacy removal → desired-state reconcile → independent readback  
**Production authority:** granted only by a fresh `./sidecar/launch_flo.sh recovery` invocation that started this shift

## Owner intent

The production Canvas shell contains legacy/wrong-course material while the current Computer Architecture desired course is already durable in Git and has passed Architecture preflight.

Recover the production shell in this order:

1. inventory the live Canvas course completely;
2. classify what is current desired Architecture content versus legacy/wrong-course content;
3. remove the legacy/wrong-course content when and only when deletion/removal is proven safe;
4. load/reconcile the current Git-backed Computer Architecture desired state;
5. independently verify the resulting course and stop at `READY FOR PUBLISH DECISION`.

This job does **not** publish the course.

## Prior evidence to consume, not blindly trust

Read and independently verify:

1. `AGENTS.md`
2. `sidecar/PLANNING.md`
3. `sidecar/FLO_BURN.md`
4. `sidecar/reports/009_flo_preflight_to_green_to_write.md`
5. current `course_foundry` Architecture desired-state and production-deploy machinery
6. canonical Foreman contracts supplied by the launcher

The accepted preflight established, as of 2026-08-19:

- target course id `75249`, `Fall 2026 Computer Architecture (COMSC-3013-1438)`;
- course workflow state `unpublished`;
- Jeremy has teacher authority;
- six real student enrollments and zero submissions on the then-live 27 assignments;
- desired state of 21 modules / 229 objects / 11 weighted assignment groups;
- an additive desired-state diff of 225 create / 6 update / 25 unchanged / 0 delete;
- seven legacy placeholder modules were known to exist outside the desired-state plan.

That evidence is historical proof only. Re-read the live course before any mutation.

## Hard boundaries

### Allowed

- Read the exact production course and current Git/source truth.
- Create a complete durable before-state inventory and classification.
- Remove/detach/unpublish/delete legacy content **only** when the object is proven outside current desired state, has no student submission state that would be destroyed, and is not needed by a desired object.
- Replace the wrong/legacy home-page experience with the current desired Architecture landing/orientation content.
- Reconcile the current Git-backed Architecture desired state into the exact locked course.
- Use bounded idempotent retry of the same authorized operation when readback makes the state unambiguous.
- Dispatch bounded Wandas/workers and inspect their receipts.
- Commit/push reports and status updates to canonical Architecture `main`.

### Forbidden

- No other Canvas course.
- No guessed or replacement target id.
- No course publication/workflow-state change.
- No section, enrollment, cross-list, SIS, term, teacher, or student mutation.
- No deletion of an object with student submissions, graded state, or ambiguous provenance.
- No deletion merely because an object is ugly, old-looking, or absent from one incomplete inventory.
- No force/broad-prune switch used as a substitute for an explicit removal manifest.
- No broad shared-tool refactor.
- No JTT work or other course work.
- No secrets in reports/receipts.

If a legacy object cannot be safely deleted, remove it from student navigation where safe, preserve it, and report the exact blocker. Do not destroy student state.

## Stage 0 — Freshness and identity gate

Before mutation:

- fetch current Architecture and Course Foundry remote truth;
- preserve unrelated dirty/shared work by using isolated worktrees when needed;
- record exact SHAs;
- verify current Architecture source/compiler/deployer tests relevant to this job;
- live-read course `75249` and prove Fall 2026 / Computer Architecture / `COMSC-3013-1438` / Jeremy teacher authority;
- verify course remains unpublished;
- re-read sections, enrollments, submissions, assignment submission counts, and grading state.

If target identity is ambiguous, the course is now published, or student submission state makes cleanup unsafe, stop before destructive mutation and report `RED` with the smallest exact gate.

## Stage 1 — Complete live inventory

Inventory the whole course, not just Modules.

At minimum capture:

- course identity/settings/home-page/front-page state;
- modules, module items, order, prerequisites, requirements, publication state;
- pages and front-page flag;
- assignments and assignment groups, weights/drop rules, dates, submission types, publication state, submission counts;
- quizzes if present;
- files/folders and references where practical;
- discussions/announcements if relevant to student navigation;
- external/LTI links relevant to the course, especially zyBooks;
- navigation entries and student-visible landing path;
- sections/enrollments read-only;
- duplicate titles, orphaned objects, zombies, and objects not reachable from desired navigation.

Also search current live content for strong legacy/wrong-course sentinels including:

- `Kim Zachary`
- `kim.zachary@swosu.edu`
- `SWOSUCOMSC3013ZacharyFall2026`

Do not treat those strings as the only legacy criterion.

Write durable before-state evidence under:

`sidecar/runs/009_flo_recovery/<UTC_TIMESTAMP>/`

including a machine-readable inventory plus a compact human summary.

## Stage 2 — Classify every live object

Classify each live object into exactly one bucket:

- `KEEP` — already matches current desired Architecture identity/state;
- `REPLACE` — desired object identity exists but body/configuration is stale or wrong;
- `REMOVE` — proven legacy/wrong-course object, not in desired state, no protected student state, safe to remove;
- `PRESERVE_BLOCKED` — appears legacy but submissions/graded state/reference ambiguity makes destructive cleanup unsafe;
- `UNKNOWN` — provenance or desired-state mapping is not yet proven.

Produce an explicit removal manifest with Canvas object type, id, title, current module/location, reason, submission-state proof, desired-state cross-check, and intended operation.

**No destructive operation is authorized for `UNKNOWN` or `PRESERVE_BLOCKED`.**

The job may proceed from inventory to cleanup without another human round-trip only when the removal manifest is fully classified, bounded, and contains no protected student state.

If ambiguity remains, stop with inventory complete and a precise decision request.

## Stage 3 — Remove the old course material safely

Execute only the accepted `REMOVE` manifest.

Prefer dependency-safe order:

1. detach/remove legacy module items from navigation;
2. remove legacy modules;
3. remove legacy assignments/pages/quizzes/discussions only after confirming they are not referenced by desired state and have no protected student state;
4. remove legacy files only when safely proven unreferenced after cleanup;
5. clear/replace wrong front-page/home-page identity as required for the desired landing path.

Do not use a blind delete-everything or broad Canvas reset.

After cleanup, independently re-inventory and prove:

- every manifest removal occurred;
- no desired object was removed;
- enrollments/sections/submission state are unchanged;
- no unapproved object was mutated.

If a mutation partially fails, stop new destructive work, read back current state, and reduce any retry to the same explicit manifest operation.

## Stage 4 — Load the new Git-backed Architecture course

Once cleanup is proved safe, reconcile the current desired Architecture state from Git using the guarded Course Foundry production machinery and the explicit verified course id.

Expected desired-course invariants from current accepted Architecture truth include:

- 21 modules;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 desired weighted assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- Week 1 shared semester kickoff;
- Weeks 2–4 Architecture launch/runway;
- Weeks 5–14 technical Architecture runway;
- Week 15 asynchronous wind-down/professional pathway;
- Week 16 shared Farkle + Machine Learning;
- Week 17 reflection/closure;
- Machine Dossier checkpoints only Weeks 6, 9, and 14.

Run a fresh dry-run **after cleanup**. The historical 225/6/25 diff is no longer the acceptance number because this job intentionally changes the live starting state. Classify the fresh plan from first principles.

Use the guarded deployer with explicit course id and live confirmation. Do not authorize broad pruning simply because cleanup happened first.

## Stage 5 — Independent closeout

After desired-state reconcile:

- independently read the production course back using API calls separate from the mutation result;
- require a no-material-delta/fixed-point desired-state dry-run;
- verify module order, assignment groups, points, dates, submission types, links/files, publication states, and sentinel objects;
- verify no legacy Kim Zachary identity or obsolete zyBooks setup is reachable through the student path;
- verify there are no remaining legacy modules/assignments/pages in normal student navigation;
- verify sections/enrollments/submissions are unchanged except timestamps naturally touched by authorized objects;
- walk the course as a student/read-only independent focus through Week 1, Week 2, representative technical weeks, Weeks 14–17;
- verify the course itself remains **unpublished**.

Do not publish under this job.

## Evidence and report

Use:

`sidecar/runs/009_flo_recovery/<UTC_TIMESTAMP>/`

Capture at minimum:

- launch authorization provenance/time;
- Git SHAs and validation;
- before inventory;
- classification table;
- removal manifest;
- cleanup command/API receipt and post-cleanup inventory;
- fresh post-cleanup desired-state dry-run;
- reconcile command/receipt;
- final independent inventory/readback;
- fixed-point proof;
- student-path closeout evidence.

Write final report:

`sidecar/reports/009_flo_canvas_recovery_rebuild.md`

Allowed final verdicts:

- `GREEN — CLEAN AND LOADED; READY FOR PUBLISH DECISION`
- `YELLOW — LOADED, LEGACY PRESERVED FOR SAFETY: <exact objects/reason>`
- `RED — <precise blocker>`

Update `sidecar/FLO_BURN.md`, `sidecar/PLANNING.md`, and active Sidecar navigation to match the proven result.

## DONE

Successful completion requires:

- exact course identity freshly re-proved;
- complete before-state inventory preserved;
- every live object classified;
- only explicitly proven legacy objects removed;
- no student submission/graded state destroyed;
- current Git-backed Architecture desired state reconciled;
- fixed-point/no-material-delta readback achieved;
- independent student path passes;
- course remains unpublished;
- final report is committed/pushed to canonical `main`;
- verdict is `GREEN — CLEAN AND LOADED; READY FOR PUBLISH DECISION` or a truthful bounded yellow/red.

Do not write Piper's Owner after-action judgment. Piper/Olivia evaluates Flo's evidence afterward.