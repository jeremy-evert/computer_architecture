# Sidecar Prompt 008 - Repair the full-semester Architecture compiler and prove the dry run

**Status:** IMPLEMENTED — AWAITING REAL BRANDY ACCEPTANCE  
**Owner:** Foreman / deployment worker  
**Priority:** BLOCKS Prompt 006 until accepted  
**Primary target branch:** `course_foundry:savnac/architecture-full-semester`  
**Implemented Course Foundry tip to validate:** `667693d9b06066c1268e0f319668029019ccef82`  
**Architecture source branch:** `computer_architecture:savnac/architecture-launch-readiness`

## Mission

Repair the connector-authored full-semester Computer Architecture DesiredCourse compiler until the real sibling-checkout tests are GREEN, then run the guarded **no-write** Savnac dry run for course 8 and retain the observed diff.

Do not push live Savnac changes in this prompt.

## Current state

The known compiler/API/style repairs have been authored remotely. They are **not accepted until Brandy fast-forwards the Course Foundry worktree to the implemented tip and reruns the real tests**.

Before judging the implementation, prove the worktree is on the intended code:

```bash
git pull --ff-only
git rev-parse HEAD
```

Expected Course Foundry commit:

```text
667693d9b06066c1268e0f319668029019ccef82
```

Also assert the Architecture source worktree is on the accepted Prompt 007 implementation or a later accepted descendant before the final dry run.

A failing result from the older `6f82a68...` compiler does not reject the implementation at `667693d...`.

## Evidence that opened this prompt

A real Brandy run against older Course Foundry tip `6f82a68f53389530e4fdb3d81e3efaf23de13d67` produced:

- 6 failed / 4 passed targeted tests;
- all six failures collapsed to the same kickoff API mismatch:

```text
TypeError: compute_kickoff_plan() got an unexpected keyword argument 'course_repo_path'
```

- Ruff found six E501 line-length violations.

The failing kickoff call was in `_week1_modules()` in `course_foundry/architecture_desired_course.py`.

## Implemented repair

The Course Foundry target branch now:

- reconciles `_week1_modules()` to the **current** `compute_kickoff_plan` API;
- uses the supported universal shared Week 1 path rather than inventing an Architecture-only kickoff overlay;
- preserves Architecture course id 8;
- keeps Week 1 free of a fake Architecture technical gate;
- wraps the six observed E501 violations without changing rubric/course semantics.

This remains connector-authored code until Brandy proves it against the real sibling checkouts.

## Required acceptance work

### 1. Assert source commits first

Fast-forward and print the exact Course Foundry and Architecture source commits before testing. Do not validate a stale worktree by accident.

### 2. Run the targeted tests on real sibling checkouts

Use the Architecture launch worktree rather than requiring Architecture `main` to move first:

```bash
export ARCHITECTURE_SOURCE_ROOT=/mnt/brandy_nvme/jevert/git/computer_architecture_savnac
```

Run:

```bash
PYTHONPATH=. "$PY" -m pytest -q \
  tests/test_architecture_desired_course.py \
  tests/test_savnac_deploy.py

PYTHONPATH=. "$PY" -m ruff check \
  course_foundry/architecture_desired_course.py \
  tests/test_architecture_desired_course.py
```

Do not claim GREEN from code inspection alone.

### 3. Inspect the resulting plan before Canvas contact

Record at minimum:

- course id/label;
- module count and positions;
- object count by kind;
- assignment groups and total weight;
- checkpoint titles/weeks;
- Week 9 Fall Break behavior;
- Week 15 Thanksgiving behavior;
- Week 16 no-checkpoint behavior;
- Week 17 reflection/evaluation objects;
- due dates that fall near official breaks/finals.

### 4. Run the guarded Savnac dry run

Only after targeted tests and Ruff are GREEN:

```bash
PYTHONPATH=. "$PY" -m course_foundry.savnac_deploy dry-run \
  --course architecture \
  --architecture-root /mnt/brandy_nvme/jevert/git/computer_architecture_savnac
```

This prompt authorizes **dry-run/read-only reconciliation only**. It does not authorize `push` or `--confirm-live`.

The target is **not blank**. Savnac course 8 already contains the earlier partial Architecture imprint (shared Week 1 + authored Week 5). The full-semester dry run must therefore be interpreted as a reconciliation against existing course state, not a first creation pass.

Retain the complete reconcile summary and enough detail to inspect create/update/skip/delete intent. Any unexpected delete, duplicate, course-id mismatch, or suspicious existing-object conflict is a blocker for Prompt 006 live imprint.

### 5. Write a durable report

Write an Architecture-side receipt/report or update Prompt 006's report with:

- Course Foundry commit tested;
- Architecture source commit tested;
- targeted pytest output;
- Ruff output;
- plan summary;
- Savnac dry-run summary;
- any collision/drift concerns;
- explicit statement that no live Savnac write occurred.

## Acceptance

Accept only when:

1. the Course Foundry worktree is proven to be on `667693d9b06066c1268e0f319668029019ccef82` or a descendant containing the repair;
2. the kickoff compiler call matches the real current API;
3. targeted Architecture/deployer tests are GREEN on Brandy;
4. Ruff is GREEN for the touched compiler/test files;
5. the full Architecture plan builds from the launch worktree;
6. assignment-group weights sum to 100%;
7. calendar exception tests remain GREEN;
8. the Savnac course-8 dry run completes without writes;
9. the dry-run intent contains no unexplained deletes/duplicates/cross-course objects;
10. the observed diff is retained for Prompt 006 review;
11. production Canvas and live Savnac state are unchanged.

## Done when

Prompt 006 has a tested full-semester compiler and an inspected course-8 dry-run diff instead of connector-authored code that has never cleared the real sibling-checkout gate.
