# Initiative 009 — Flo Canvas recovery: inventory, legacy removal, desired-state reconcile

**Foreman:** Flo (fresh Sonnet shift, launched `./sidecar/launch_flo.sh recovery` at
2026-08-20T01:49:43Z)
**Job:** `sidecar/jobs/009_architecture_canvas_recovery_rebuild.md`
**Mode:** `recovery` (inventory → classify → bounded legacy removal → desired-state
reconcile → independent readback), production writes explicitly authorized
**Evidence:** `sidecar/runs/009_flo_recovery/20260820T015131Z/`
**Production target:** Canvas course `75249`, `Fall 2026 Computer Architecture
(COMSC-3013-1438)`, `swosu.instructure.com`

## Summary

The production shell for course `75249` contained legacy Kim Zachary /
zyBooks-era material (a wrong-course front page, course syllabus contact
info, seven zyBooks-chapter placeholder modules plus stray appendix/lab
assignments, and an old "Week 1" boilerplate module) alongside the
already-correct shared semester-kickoff content. Every live object was
freshly inventoried and classified, an explicit object-level `REMOVE`
manifest was built and executed after independently re-proving zero
protected student state, the current Git-backed Architecture desired state
was then reconciled onto the cleaned course, and the result was
independently read back to a fixed point. The course remains
**unpublished**.

## 1. Launch authorization and freshness gate

- Launcher: `./sidecar/launch_flo.sh recovery`, 2026-08-20T01:49:43Z.
- `computer_architecture` at `e796a1b` (clean, == `origin/main`) at shift start.
- `course_foundry` main working tree is pre-existing dirty (concurrent
  DSCT/CS1 work, same dirt noted in the preflight report) and was left
  untouched; all Architecture compiler/deploy/test execution used the
  isolated worktree `course_foundry-flo009-preflight`, whose checkout
  (`969b50a`) was independently confirmed identical to fresh `origin/main`
  before use.
- `imprint` started clean at `7745fe1` == `origin/main`.
- Live identity re-proved before any mutation (`00_stage0_identity_gate.txt`):
  course `75249`, name `Fall 2026 Computer Architecture
  (COMSC-3013-1438)`, `course_code=COMSC-3013-1438.2026FA`,
  `workflow_state=unpublished`, Jeremy holds `TeacherEnrollment`, 6 real
  `StudentEnrollment` rows (7 enrollments total). Every Canvas call in this
  job ran through a client allowlisted to course `75249` only
  (`CANVAS_ENFORCE_COURSE_ALLOWLIST=true`).

## 2. Before-state inventory and classification

Full before-state capture: `01_before_inventory.json` (course settings,
tabs, modules+items, assignment groups, assignments with submission counts,
pages+bodies, front page, quizzes, discussion topics, files, folders,
external tools, enrollments).

Live state: 14 modules, 27 assignments, 12 assignment groups, 8 pages
(front page `home`), 1 discussion topic, 3 files. Sentinel scan confirmed
`Kim Zachary` / `kim.zachary@swosu.edu` / `zybook` text live in
`course.syllabus_body` and the `home` page body; assignment bodies for the
"Chapter N" objects literally read "Please read and complete activities in
Zybook". Every one of the 27 live assignments showed `with_content=0`
(0 real submissions across all 6 students); the one discussion topic had 0
entries — no protected student state anywhere in the course.

Classification (`02_removal_manifest.py`):

- **KEEP** — modules `218090`–`218094` (the "Monday/Wednesday/Friday
  survive-thrive-career" kickoff modules, `A07 — Advisor`, `Success
  Foundations`) and assignment groups `156858`–`156868` (11 groups):
  already-correct desired shared-kickoff content and the desired weighted
  grading groups (preflight's "25 unchanged").
- **REMOVE** — 1 discussion topic (`533438`, cascades its assignment), 13
  legacy assignments (7 zyBooks-chapter placeholders + 1 academic-integrity
  boilerplate, both module-linked; 5 orphaned zyBooks appendix/lab
  placeholders not linked into any module), 9 legacy modules (`212431`–
  `212439`: old "Week 1" plus the 7 zyBooks bi-weekly modules plus an empty
  unpublished "Week 16"), the Canvas-default 0%-weight `Assignments` group
  (`152780`, left holding only removed content), and 3 files (2 unreferenced
  academic-integrity `.docx`s and `kim.jpg`, the last only after the page
  referencing it was replaced).
- **REPLACE** — the `home` front page body (Kim Zachary/zyBooks content →
  neutral Architecture orientation) and two course settings not modeled by
  any desired-state object: `default_view` (`wiki` → `modules`, so the
  Modules surface, not the wiki front page, is the actual landing path) and
  `syllabus_body` (Kim Zachary contact info/zyBooks purchase instructions →
  accurate Jeremy Evert / Computer Architecture text).
- **PRESERVE_BLOCKED / UNKNOWN** — none. No object anywhere had submission
  content, discussion entries, or ambiguous provenance.

## 3. Removal execution

Before executing, live state was re-read and diffed against
`01_before_inventory.json`: zero drift on module/assignment/group ids,
manifest objects still present, still zero submission content anywhere,
course still `unpublished` (readback embedded in
`sidecar/runs/009_flo_recovery/20260820T015131Z/`, prior turn).

Human explicitly authorized proceeding with the completed manifest for this
step. All 29 manifest operations executed in dependency-safe order (discussion
topic → assignments → modules → assignment group → home page/course settings
→ files) succeeded (`03_removal_receipt.json`, 29/29 `2xx`).

Independent post-cleanup re-inventory (`04_post_cleanup_inventory.json`):
5 modules, 13 assignments, 11 assignment groups, 0 discussion topics, 0
files remain — exactly the kept kickoff/desired set. Zero `Kim
Zachary`/`zybook`/sentinel occurrences anywhere in the course.
Enrollments identical before/after (7/7). `workflow_state` still
`unpublished`; `default_view` now `modules`; the `home` page body now reads
the neutral orientation text.

## 4. Desired-state reconcile

Fresh post-cleanup dry-run (`05_post_cleanup_dry_run.txt`): `225 create / 6
update / 25 unchanged / 0 delete` — the same bounded, purely-additive shape
already proven at preflight, now confirmed against the cleaned course.

The first live `push --confirm-live` attempt failed partway through
(`06b_partial_failure_readback.txt`) with Canvas 400 "Drop rules cannot be
higher than the number of assignments" on assignment group `156859`. Read-back
confirmed the only side effect was the idempotent, harmless
`apply_assignment_group_weights=true` course setting; no group weight/rule
and no module/assignment/page had been created or changed. Root cause:
`imprint.reconcile._reconcile_assignment_groups` already deferred a
brand-new group's `drop_lowest` rule until its assignments exist later in
the same push, but applied the rule immediately for an *already-existing*
group — true for every prior caller, but false here because these 5
desired groups already existed live (created in an earlier partial run)
while still holding zero assignments.

Fixed in `jeremy-evert/imprint` (branch
`flo/009-architecture-recovery-drop-lowest-fix`, commit `5779931`, promoted
fast-forward to `main`): route the existing-group case through the same
deferred-application follow-up pass the create branch already uses; a rule
being *cleared* is still applied immediately since that direction is always
safe. Added `test_drop_lowest_added_to_existing_group_still_empty_of_assignments`
reproducing the exact scenario. Full `imprint` suite: 61/61 passed both
before promotion and as part of ordinary CI-equivalent local run.

Fresh dry-run re-run after the fix (`07_post_fix_dry_run.txt`): identical
`225 create / 6 update / 25 unchanged / 0 delete`. Live push
(`06_reconcile_push_receipt.txt`) succeeded: `225 created, 6 updated, 25
unchanged, 0 deleted`; assignment-group self-check `100% across 11 groups`.

## 5. Independent closeout

Independent full readback (`08_final_independent_inventory.json`, separate
API calls from the push): **21 modules, 116 assignments, 32 files, 82 pages**
(81 desired pages + the pre-existing `home` front page), **11 assignment
groups totaling 100%**, exactly the **5** desired groups (`AI Fluency /
Monday Moment`, `Professional Minds - Wednesday strand`, `Professional
Minds - Friday strand`, `Weekly Architecture / investigation work`,
`Weekly Explain / Defend evidence receipt`) carry `drop_lowest=1`. Machine
Dossier checkpoints appear on exactly Weeks 6, 9, 14. Zero unresolved
`{{link:...}}` tokens anywhere. Zero sentinel occurrences (`Kim
Zachary`/`kim.zachary@swosu.edu`/`SWOSUCOMSC3013ZacharyFall2026`/`zybook`).
Enrollments identical to the original before-state, 7/7. `workflow_state`
still `unpublished`. Zero real submission content on any of the 116
assignments (post-push re-check).

**Fixed-point dry-run** (`09_fixed_point_dry_run.txt`): `0 create / 32
update / 208 unchanged / 0 delete`. All 32 "updates" are File-kind objects
(compiled Beamer slide decks) reported "content changed"; this is the
already-diagnosed, already-fixed-elsewhere Canvas limitation that
`--skip-files` exists for (`course_foundry/reports/106_production_deploy_
skip_files.md`; Canvas exposes no content hash on a File, so this project's
own hash-based diff cannot distinguish "unchanged" from "regenerated with
identical bytes" for that object kind). Excluding files, the re-run
(`09c_fixed_point_dry_run_skip_files.txt`) is exact fixed point: `0 create
/ 0 update / 208 unchanged / 0 delete`. This is a pre-existing, named,
non-blocking yellow — not something this recovery introduced, and no
graded/student-facing content is affected by it.

Module order/publication, assignment group weights (100% total, 5 correct
`drop_lowest=1` groups), and module item counts per week were all
independently confirmed in `10_stage5_closeout_checks.txt`, including a
title-level walk of Week 1 (kickoff), Week 2 (AI Laboratory Training),
representative technical weeks 6–14, and Weeks 15–17
(Thanksgiving Wind-Down / Farkle+ML / Reflection and Closure) — no legacy
titles, no Kim Zachary identity, no obsolete zyBooks references anywhere
in that path.

## Remaining yellows (non-blocking)

1. File-kind objects (32 compiled slide decks) always report "content
   changed" on a fresh dry-run because Canvas exposes no content hash for
   Files; `--skip-files` is the existing, already-diagnosed workaround for
   proving fixed point on everything else. Not introduced by this job.
2. Same host-capability (`archlab doctor`) and pre-existing CS1-only test
   yellows already carried forward from the preflight report — unrelated to
   Architecture, unaffected by this recovery.

## Verdict

**`GREEN — CLEAN AND LOADED; READY FOR PUBLISH DECISION`**

The production course is clean of legacy/wrong-course identity, holds
exactly the current Git-backed Architecture desired state at a proven
fixed point (modulo the named File-hash yellow), no student
enrollment/submission state was disturbed, and the course remains
unpublished pending Jeremy's separate publish decision.
