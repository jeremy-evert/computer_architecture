# Prompt 009d01 — Reconcile canonical Architecture launch source

**Status:** READY TO EXECUTE  
**Initiative:** 009  
**Plan:** `sidecar/reports/009_c_plan_architecture_launch_readiness.md`  
**Worksite:** `computer_architecture` only  
**Mode:** bounded source reconciliation; no shared-repo or LMS mutation

## Mission

Bring every still-valid launch-required Architecture artifact stranded on `savnac/architecture-launch-readiness` into current authoritative `main`, while preserving all newer accepted main truth.

This is **not** a branch merge task. The launch branch is diverged and behind main. Treat it as a provenance/recovery source and reconcile file-by-file against current doctrine.

## Start by proving the current branch delta

Before editing:

1. fetch/prune normally without rewriting history;
2. record exact `main` HEAD and launch-branch HEAD;
3. compare `main...savnac/architecture-launch-readiness` fresh;
4. preserve any pre-existing worktree dirt;
5. inventory every branch-only/different file relevant to launch.

Do not rely on 009a's ahead/behind counts as current; Initiative 009 itself has moved main since that snapshot.

## Required classification

Classify each launch-branch artifact as:

- `INTEGRATE` — still required and missing from current main;
- `RECONCILE` — required but conflicts/overlaps newer main doctrine;
- `SUPERSEDED` — newer main source already owns the truth;
- `HISTORICAL_ONLY` — useful receipt/provenance but not active launch source.

At minimum inspect:

- `weeks/week-02/`
- `weeks/week-03/`
- `weeks/week-04/`
- `weeks/week-15/`
- `weeks/week-17/`
- `assignments/A6-professional-pathway-artifacts.md`
- `assignments/A7-final-reflection.md`
- `docs/course-evaluation.md`
- `scripts/validate_savnac_launch_source.py`
- branch-only planning/report/run files
- the four Week 07/08/10/11 reference changes
- current main `docs/professional-pathway.md`
- current `docs/grading-model.md`
- current planning shells for Weeks 2–4, 15, 17.

## Reconciliation rules

1. Current accepted main doctrine wins over older branch wording where they conflict.
2. Preserve the actual student-facing source required by `course_foundry/course_foundry/architecture_desired_course.py`.
3. Do not copy shared Week 1, AI Fluency, Professional Minds, or Farkle curriculum into this repo merely to satisfy paths.
4. A6/Week-15 source must agree with the newer accepted `docs/professional-pathway.md` claim → evidence → gap → decision pathway.
5. Week 16 remains ungraded/dead-days compliant and receives no Checkpoint 4.
6. Week 17 remains reflection/closure, not another technical unit.
7. Do not create a second `planning/week-17.md` if `planning/week-17-finals.md` is the durable main planning identity unless evidence shows both have distinct necessary roles.
8. Preserve branch receipts as historical evidence only where they add provenance; do not flood main with redundant raw runs solely because they exist.

## Required validation

After reconciliation, prove at minimum:

- every course-local path directly required by the current full-semester Architecture compiler exists on the working branch;
- no required launch artifact remains only on `savnac/architecture-launch-readiness`;
- Week 2/3/4/15/17 package internal links/source references are coherent;
- A6/A7/evaluation sources are present and consistent with current doctrine;
- any repo-local validators that do not require shared mutation pass;
- `git diff --check` passes;
- intended diff is explicitly inspected.

Do not repair `course_foundry` if a shared test fails. Record the failure for d_03.

## Required report

Write:

`sidecar/reports/009_d_01_reconcile_canonical_launch_source.md`

Include:

- exact starting SHAs;
- full artifact classification table;
- files integrated/reconciled and why;
- files deliberately not integrated and why;
- validation run/results;
- any remaining source ambiguity;
- final branch commit SHA;
- explicit statement whether any launch-required Architecture source remains stranded outside current-main lineage.

## Worker / Git contract

- Use an isolated job branch/worktree such as `golem/009-d01-canonical-launch-source`.
- Modify only `computer_architecture`.
- Preserve unrelated dirt.
- Stage explicit paths only.
- Commit and push the bounded work.
- Do not self-certify or merge into main. Return the Worker Report/commit to Foreman for acceptance/promotion.

## Acceptance criterion

d_01 is GREEN only if Foreman can promote the branch knowing current main will contain the complete Architecture-local source expected by the full-semester compiler **without losing newer main doctrine**.

## Stop condition

Stop after the source reconciliation, report, validation, commit, and push. Do not repair status prose, run Savnac, inspect production Canvas, or mutate shared repositories.
