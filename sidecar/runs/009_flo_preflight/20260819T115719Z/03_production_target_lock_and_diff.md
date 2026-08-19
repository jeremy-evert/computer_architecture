# SWOSU production target lock and semantic diff (read-only)

## Discovery method
Authenticated to `https://swosu.instructure.com` as `Jeremy Paul Evert`
(user id 24406) and listed all courses with `enrollment_type=teacher`
(128 total), then filtered for any course whose name/course_code/
sis_course_id contained `3013`, `1438`, or "architecture" (case-insensitive).
No historical Savnac id, memory, or prior report id was used to seed the
search.

## Candidates evaluated and rejected
Eight historical Computer Architecture sections were found and rejected —
all pre-Fall-2026 terms (2016 Spring, 2017 Spring, 2017 Fall, 2018 Spring,
2019 Spring, 2020 Spring, 2020 Fall, 2021 Fall), none matching term
`Fall 2026` or section `COMSC-3013-1438`:

| id | name | term | course_code |
|---|---|---|---|
| 12632 | COMPUTER ARCHITECTURE | 152S - Spring 2016 | COMSC-3013 |
| 18813 | COMPUTER ARCHITECTURE | 162S - Spring 2017 | COMSC-3013 |
| 26790 | COMPUTER ARCHITECTURE | 171S - Fall 2017 | COMSC-3013 |
| 24833 | COMPUTER ARCHITECTURE | 172S - Spring 2018 | COMSC-3013 |
| 30920 | COMPUTER ARCHITECTURE | 182S - Spring 2019 | COMSC-3013 |
| 37056 | 2020SP Computer Architecture (COMSC-3013-1417) | Spring 2020 | COMSC-3013-1417 |
| 40255 | 2020FA Computer Architecture (COMSC-3013-1425) | Fall 2020 | COMSC-3013-1425 |
| 45464 | Fall 2021 Computer Architecture (COMSC-3013-1426) | Fall 2021 | COMSC-3013-1426.2021FA |

## Locked target
**course id `75249`**

```json
{
  "id": 75249,
  "name": "Fall 2026 Computer Architecture (COMSC-3013-1438)",
  "course_code": "COMSC-3013-1438.2026FA",
  "sis_course_id": "51160",
  "workflow_state": "unpublished",
  "term": "Fall 2026"
}
```

Sole Fall-2026 candidate; name, course_code, sis_course_id, and term all
converge unambiguously on section `COMSC-3013-1438`. Jeremy holds
`TeacherEnrollment` on this course.

The production deployer's own live-identity guard independently confirmed
this before building the reconcile plan:
```
Architecture production target identity check: course_id=75249, name='Fall 2026 Computer Architecture (COMSC-3013-1438)', course_code='COMSC-3013-1438.2026FA'
```

The deployer was also proven to still refuse Architecture with no explicit
id:
```
production_deploy.py: error: architecture production deploy requires an explicit --course-id from fresh accepted production target-lock evidence
```

## Live target inventory (before any write; none occurred)
- Modules: 14 live, all named/ordered around a "Monday/Wednesday/Friday"
  shared-kickoff skeleton (`Monday: Survive This Semester`,
  `Wednesday: Thrive In Your Degree`, `Friday: Entering Your Career`,
  `A07 — Advisor (Later)`, `Success Foundations (Optional/Bonus)`) plus
  seven leftover placeholder modules (`Week 2 and 3` … `Week 16`) each
  holding one stale zyBook-chapter-style assignment (`Chapter 1: Computer
  Abstract/Tech` … `Appendix B`), evidently a rough skeleton predating the
  finalized 21-module Fall 2026 curriculum.
- Module items: 32 (`7 Page`, `21 Assignment`, `3 ExternalUrl`,
  `1 Discussion`).
- Assignment groups: 12 live, weights already total `100%`
  (`0/5/5/5/5/30/10/20/8/5/5/2`) — the 11 desired named groups plus the
  unused zero-weight default `Assignments` group, same pattern as Savnac
  course 8. Five recurring groups are missing `drop_lowest: 1`.
- Assignments: 27 live; **0** report `has_submitted_submissions`.
- Pages: 8 live. Files: 3 live (`kim.jpg`, two Academic Integrity policy
  `.docx` files).
- Enrollments: **7** — `TeacherEnrollment`/Jeremy Paul Evert and **6 real
  `StudentEnrollment` students** (McKenna Anthony, Jesus Bonilla, Calen R
  Mayer, Jacob Jeffrey Nachimson, Micah William Stringfield, Austin Wade
  Wilson). This is a live real-student roster, unlike Savnac's Test-Student-
  only enrollment. Course `workflow_state` is `unpublished`, so none of this
  content (existing or newly-created) is visible to those students
  regardless of individual item `published` flags until the course itself
  is separately published — a distinct, human-owned action this job does
  not take.

## Semantic diff (read-only dry-run against locked id 75249)
```
Dry-run plan: course=75249 label='Computer Architecture'; 229 objects, 21 modules, 11 grading groups
Reconcile summary: create=225, update=6, skip=25, delete=0
```

Breakdown by action/kind:
```
create: 16 module, 74 page, 103 assignment, 32 file
update: 5 assignment_group (drop_lowest None -> 1), 1 page (body changed), 5 module (metadata refresh, untallied)
skip:   6 assignment_group, 6 page, 13 assignment
delete: 0
```

### Classification
1. **Missing desired modules/objects** — all 16 new "Computer Architecture
   Week 02 …" through "Week 17 …" modules and their 209 objects (74 page +
   103 assignment + 32 file) do not yet exist live. Pure creates.
2. **Stale desired-owned objects needing update** — 5 assignment groups
   need `drop_lowest: 1` added; the shared Week-1 "Monday — Survive this
   semester" page body differs from current desired content (matches the
   same live-drift pattern already proven safe on Savnac course 8's Week
   02–04 pages).
3. **Live objects absent from Git/shared desired state** — the 7 leftover
   `Week 2 and 3` … `Week 16` placeholder modules and their 7 stale
   chapter-style assignments are **not** part of the current desired plan.
   `prune_scope=none` means the dry-run/push leaves them completely
   untouched (neither created, updated, nor deleted) — confirmed by the
   detailed reconcile log, which contains no log entry referencing those
   module titles at all. This is a known, explainable pre-existing
   skeleton predating the finalized curriculum (see
   `course_foundry/reports/2026-08-09_computer_architecture_fall_2026_onboarding.md`
   for the original onboarding), not a defect this preflight introduces or
   must resolve. It is recorded here as a named yellow for Jeremy/Piper:
   cleaning it up (if desired) requires a separate, explicitly authorized
   pruning decision — never inferred from "not in desired state" per the
   job's own prune-provenance rule.
4. **Duplicates/orphans** — cross-checked every desired page/assignment
   title against every live page/assignment title course-wide. The only
   title overlaps are the 13 shared Week-1 items (Monday/Wednesday/Friday
   pages+exit tickets, A01–A10), and those are exactly the objects the
   reconciler already resolves as `skip`/`update` **within their existing
   live modules** (matched by title in `_existing_item_index`), not
   duplicate creates. No desired create collides by title with any live
   object. Zero duplicate-creation risk.
5. **Assignment-group/weight/drop-rule differences** — only the 5 named
   `drop_lowest` additions above; total weight is already, and remains,
   `100%` across the same 11 desired categories.
6. **Due/availability-date differences** — not evaluated further beyond the
   compiler's own calendar-exception tests (`test_architecture_calendar_
   exceptions_are_preserved`, `test_architecture_assignments_avoid_
   official_break_windows`), both green; no live due-date fields are
   touched by matched objects other than the one body-changed page.
7. **Publish-state differences** — course `workflow_state` is
   `unpublished`; created items default to `published=true` at the item
   level per `imprint.reconcile`, but that has no live-visibility effect
   while the course itself remains unpublished. No course-level publish
   action was taken or proposed.
8. **Week-1 shared-content state** — confirmed live and correctly matched;
   only the one expected body-content drift.
9. **Links/files/assets** — 32 file creates are new Architecture lab
   assets; no unresolved `{{link:...}}` tokens (proven by the source
   validator and `test_architecture_kickoff_objects_never_ship_
   unresolved_link_tokens`).
10. **Prune/delete candidates** — `prune_scope=none`; delete count is `0`.
    No prune was requested or evaluated as a write.
11. **Live student/instructor data safety** — 6 real students enrolled, 0
    submissions on any of the 27 live assignments. The proposed diff is
    purely additive plus two safe non-destructive updates; nothing in the
    plan touches, orphans, or risks any submission or enrollment record.
12. **Source/compiler/live contradictions** — none found; the single page
    body update is the same class of expected content drift already
    proven safe via Savnac course 8's identical Week-1 pages.

## Production-write preconditions (for the separately-gated production job)
- Explicit `--course-id 75249` (deployer refuses without it — reconfirmed
  above).
- `--prune-scope none` (no other value has been evaluated or is authorized).
- `--confirm-live` (still required by the deployer for any push).
- Exact command:
  ```
  python -m course_foundry.production_deploy push \
    --course architecture --course-id 75249 \
    --prune-scope none --confirm-live
  ```
