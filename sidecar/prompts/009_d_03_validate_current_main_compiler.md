# Prompt 009d03 — Validate current-main Architecture source and compiler

**Status:** WAITING ON 009_d_01 + 009_d_02  
**Initiative:** 009  
**Plan:** `sidecar/reports/009_c_plan_architecture_launch_readiness.md`  
**Mode:** execution/validation with shared repositories read-only; no LMS write  
**Evidence owner:** `computer_architecture`

## Mission

Prove that the reconciled authoritative `computer_architecture/main` is a complete source for the current full-semester Architecture desired-state compiler.

This is the first post-reconciliation execution gate. It may read and execute code from Course Foundry and shared curriculum checkouts, but it may not mutate them.

## Execution-seat boundary

Cleo owns Brandy while CS1 production work is active. Do not commandeer, reset, stash, clean, kill processes, or alter working trees owned by that run.

Use another capable local seat, an isolated worktree, or wait until the ownership window is clear. Runtime inconvenience is not permission to mutate shared state.

## Preflight

Record exact branch/HEAD/worktree state for:

- `computer_architecture`;
- `course_foundry`;
- `semester_kickoff_week`;
- `ai_fluency`;
- `professional_minds`;
- any other source actually consumed by the current compiler/validator.

Preserve pre-existing dirt. Do not update a dirty shared checkout merely for neatness.

## Required validation

Use the repository's current source validator and current Course Foundry Architecture compiler/tests. At minimum prove:

1. every course-local launch source path exists on current Architecture main;
2. shared-source paths resolve from the recorded checkouts;
3. the current full-semester desired course builds from current main rather than the old Savnac worktree;
4. Weeks 1–17 are represented with no undeclared omission;
5. assignment groups total 100%;
6. accepted `drop_lowest=1` rules are present on the five recurring categories;
7. Week 16 recurring Architecture/AI/Professional-Minds work is not graded on dead days;
8. Machine Dossier checkpoints exist only Weeks 6, 9, and 14;
9. A6 Week-14/15, A7 final reflection, and course evaluation are included;
10. holiday/fall-break/Thanksgiving/finals date rules are coherent;
11. required file/source paths exist;
12. no unresolved `{{link:...}}` token can ship;
13. targeted Architecture Course Foundry tests pass or fail with an exact bounded reproduction;
14. Architecture repo-local validation and `git diff --check` are clean for any report-only changes.

Record module/object/assignment-group counts from the actual run. Do not import counts from Prompt 006 as current truth.

## Shared-defect handling

If a Course Foundry/Harbor/shared-source defect appears:

- reproduce it minimally;
- name the exact owning repo/file/test/contract;
- classify whether it blocks the required launch path;
- record the current shared SHA;
- stop without patching the shared repo.

Foreman will decide whether to author the next unused evidence-specific `009_d_NN` repair prompt after checking collision/ownership.

The historical `SourcePaths.defaults()` / `ARCHITECTURE_SOURCE_ROOT` test issue must be retested rather than assumed alive or dead.

## Required report

Write:

`sidecar/reports/009_d_03_validate_current_main_compiler.md`

Include:

- exact source SHAs and worktree caveats;
- commands/tests run;
- current desired-state counts;
- policy/sentinel-week validation table;
- failures/warnings with blocker classification;
- whether current main is `SOURCE-VALIDATED` and `COMPILED`;
- recommended d_04 readiness;
- report commit SHA.

Useful raw receipts may go under `sidecar/runs/` with no secrets/student data.

## Authority

Allowed:

- read shared repos;
- execute their existing tests/compiler paths;
- write Architecture report/run evidence only.

Forbidden:

- shared repo edits/commits;
- Savnac mutation;
- production Canvas read/write;
- environment-wide package/config changes merely to make the receipt prettier.

## Acceptance criterion

GREEN only if one exact current-main source set produces a complete, policy-consistent Architecture desired course without depending on the old launch branch.

## Stop condition

Stop after validation evidence and report. Do not proceed into Savnac or production reconnaissance in this prompt.
