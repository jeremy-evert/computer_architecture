# Savnac course 8 reconcile evidence

## Pre-write dry-run
```
Dry-run plan: course=8 label='Computer Architecture'; 229 objects, 21 modules, 11 grading groups
Reconcile summary: create=0, update=7, skip=233, delete=0
```

Per-object detail (independently obtained by calling `imprint.reconcile.push_course`
directly with `dry_run=True` and printing the log — not just the summary tally):

```
page       | Computer Architecture Week 02 - AI Laboratory Training              | Week 02 - Week at a Glance
page       | Computer Architecture Week 03 - Containers & Repeatability          | Week 03 - Week at a Glance
page       | Computer Architecture Week 04 - Linux as a Machine Telescope        | Week 04 - Week at a Glance
assignment | Computer Architecture Week 14 - Sit in the Architect's Chair        | A6 - Professional Pathway (Week 14 Update)
assignment | Computer Architecture Week 15 - Thanksgiving Wind-Down              | A6 - Professional Pathway (Week 15 Submission)
page       | Computer Architecture Week 16 - Farkle + Machine Learning...        | Week 16 - Week at a Glance
assignment | Computer Architecture Week 16 - Farkle + Machine Learning...        | Week 16 - Explain / Defend
```

Exact match to the seven d04-accepted bodies. Zero creates/deletes/group/kind/
topology changes. This is a subset (in fact identical set) of the accepted
envelope, so the write proceeded under Jeremy's explicit authorization.

## Live write (Jeremy-authorized, `--confirm-live`, `--prune-scope none`)
```
Live push plan: course=8 label='Computer Architecture'; 229 objects, 21 modules, 11 grading groups
Reconcile summary: create=0, update=7, skip=233, delete=0
Detail: Reconciled Computer Architecture: 0 created, 7 updated, 233 unchanged, 0 deleted.
Assignment-group self-check: 100% across 12 groups (100%).
```

## Independent readback (separate API calls, not the deploy tool's own claim)
- Course 8: `Computer Architecture (COMSC-3013)`, `available`.
- Modules: 21; module items: 229 (`81 Page`, `32 File`, `116 Assignment`).
- Assignment groups: 12 live (11 desired + unused zero-weight default
  `Assignments`), total weight `100%`; exactly 5 groups carry
  `drop_lowest: 1` (AI Fluency/Monday Moment, Professional Minds Wed/Fri,
  Weekly Architecture, Weekly Explain/Defend) — matches desired doctrine.
- Assignments: 116; **0** report `has_submitted_submissions`.
- Enrollments: exactly `StudentViewEnrollment`/Test Student and
  `TeacherEnrollment`/Jeremy — no other enrollment present.
- All seven updated objects independently re-read with fresh `updated_at`
  timestamps (2026-08-19T11:30–11:31Z), confirming the write landed:
  Week 02/03/04 Week-at-a-Glance pages, A6 Week 14/15 assignments, Week 16
  Week-at-a-Glance page, Week 16 Explain/Defend assignment.

## Fixed-point dry-run 1
```
Reconcile summary: create=0, update=0, skip=240, delete=0
```

## Fixed-point dry-run 2
```
Reconcile summary: create=0, update=0, skip=240, delete=0
```

Two consecutive zero-delta dry-runs proven (240 = 233 + 7, consistent with
the seven objects now matching desired content). Savnac course 8 is at fixed
point.
