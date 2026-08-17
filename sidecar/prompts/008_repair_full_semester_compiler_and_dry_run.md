# Sidecar Prompt 008 - Repair the full-semester Architecture compiler and prove the dry run

**Status:** READY  
**Owner:** Foreman / deployment worker  
**Priority:** BLOCKS Prompt 006  
**Primary target branch:** `course_foundry:savnac/architecture-full-semester`  
**Architecture source branch:** `computer_architecture:savnac/architecture-launch-readiness`

## Mission

Repair the connector-authored full-semester Computer Architecture DesiredCourse compiler until the real sibling-checkout tests are GREEN, then run the guarded **no-write** Savnac dry run for course 8 and retain the observed diff.

Do not push live Savnac changes in this prompt.

## Evidence that opened this prompt

Real Brandy run against Course Foundry tip `6f82a68f53389530e4fdb3d81e3efaf23de13d67` produced:

- 6 failed / 4 passed targeted tests;
- all six failures collapse to the same kickoff API mismatch:

```text
TypeError: compute_kickoff_plan() got an unexpected keyword argument 'course_repo_path'
```

- Ruff found six E501 line-length violations.

The failing kickoff call is in `_week1_modules()` in `course_foundry/architecture_desired_course.py`.

## Required work

### 1. Reconcile the kickoff API from source

Inspect the current `compute_kickoff_plan` signature in Course Foundry. Do not guess from an older caller.

Repair Architecture's `_week1_modules()` to call the current API correctly while preserving the intended doctrine:

- shared `semester_kickoff_week` owns universal Week 1;
- Architecture does not create a duplicate Week 1 curriculum fork;
- course id remains 8;
- no fake Architecture technical gate is introduced into Week 1.

If the current kickoff API cannot accept an Architecture course-root overlay, do not smuggle one in. Use the existing supported universal path.

### 2. Fix style failures without changing behavior

Resolve the six observed E501 violations in:

- `course_foundry/architecture_desired_course.py`;
- `tests/test_architecture_desired_course.py`.

Keep the text/rubric semantics unchanged.

### 3. Run the targeted tests on real sibling checkouts

Use the Architecture launch worktree rather than requiring Architecture main to move first:

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

### 4. Inspect the resulting plan before Canvas contact

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

### 5. Run the guarded Savnac dry run

Only after targeted tests and Ruff are GREEN:

```bash
PYTHONPATH=. "$PY" -m course_foundry.savnac_deploy dry-run \
  --course architecture \
  --architecture-root /mnt/brandy_nvme/jevert/git/computer_architecture_savnac
```

This prompt authorizes **dry-run/read-only reconciliation only**. It does not authorize `push` or `--confirm-live`.

Retain the complete reconcile summary and enough detail to inspect create/update/skip/delete intent. Any unexpected delete, duplicate, course-id mismatch, or suspicious existing-object conflict is a blocker for Prompt 006 live imprint.

### 6. Write a durable report

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

1. the kickoff compiler call matches the real current API;
2. targeted Architecture/deployer tests are GREEN on Brandy;
3. Ruff is GREEN for the touched compiler/test files;
4. the full Architecture plan builds from the launch worktree;
5. assignment-group weights sum to 100%;
6. calendar exception tests remain GREEN;
7. the Savnac course-8 dry run completes without writes;
8. the dry-run intent contains no unexplained deletes/duplicates/cross-course objects;
9. the observed diff is retained for Prompt 006 review;
10. production Canvas and live Savnac state are unchanged.

## Done when

Prompt 006 has a tested full-semester compiler and an inspected course-8 dry-run diff instead of connector-authored code that has never cleared the real sibling-checkout gate.
