# Source/compiler/test evidence

## Source validator
GREEN WITH YELLOWS (matches d03/d04 pattern). Full receipt:
`sidecar/runs/architecture_savnac_source_validation_20260819T112052Z.md`

Named yellow (unchanged from d03/d04): host `archlab doctor` misses
`python_3_10_plus`, `debugger_state_inspection`, `plotting`,
`riscv_cross_compile`, `pdf_build`. Diagnostic-only; Week 3 fallback path
covers it. Not a launch-source blocker.

## Focused Architecture/Course Foundry tests
`tests/test_architecture_desired_course.py`, `tests/test_savnac_deploy.py`,
`tests/test_production_deploy.py`:

- Before repair: 45 passed (13 failed due to a worktree sibling-path
  placement artifact, not a real defect — see below).
- After moving the worktree to a proper git-parent sibling location and
  after the shared-layer repair (commit `969b50a`): **46 passed** (45 + 1
  new regression test).

## Broader Course Foundry test suite (`tests/`)
- Before repair: 760 passed, 5 failed.
- After repair: **761 passed, 5 failed** (same 5, unchanged).

All 5 failures are CS1-scoped and unrelated to Architecture:
- `tests/test_student_sim_compiler_and_pilot.py` (3): a `monkeypatch.setattr`
  target-resolution failure against `course_foundry.student_sim`, exercising
  only CS1's pilot-assignment simulation (`build_pilot_plan(CS1_REPO)`).
- `tests/test_submission_listener_config.py` (2): `SAVNAC_COURSES` config
  assertions about CS1's (`course_id == 1`) live submission-listener
  explicit-assignment-id list and dispatch mode, drifted by an out-of-scope
  CS1 zero-submission campaign (Prompt 127). No `course_id == 8` or
  Architecture reference anywhere in either failing file.

Neither failing file, module, or fixture references Architecture, Savnac
course 8, or the production deployer. Classified as pre-existing CS1-owned
drift, not an Architecture/shared-layer blocker.

## Shared-layer repair (Course Foundry)
`architecture_savnac_desired_course()` hard-rejected any `course_id` other
than the fixed Savnac id 8, but `production_deploy._build_architecture`
calls this same builder with a freshly locked *production* id — making the
required Architecture production dry-run/push impossible to run at all.
Fixed by dropping the stale in-builder guard (the Savnac path already pins
its id independently via `COURSE_REGISTRY`). Added
`test_architecture_builder_accepts_explicit_non_savnac_course_id`, exercising
the real (non-monkeypatched) builder with a non-Savnac id end-to-end.

- Branch: `golem/009-flo-architecture-production-id-fix`
- Commit: `969b50aa7f07dedb96049103f52b8bcc9fa0ac5c`
- Promoted to `course_foundry` `main` by fast-forward (base `50801ff` was
  still `origin/main` at fetch time — no drift, no force needed).
- `git diff --check`: pass.

## `git diff --check` (Architecture)
Pass (clean tree; no source changes made in this repo during preflight).
