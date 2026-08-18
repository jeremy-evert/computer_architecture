# Prompt 009d03 - Validate current-main Architecture source and compiler

**Status:** ACCEPTED / PROMOTED
**Initiative:** 009
**Plan:** `sidecar/reports/009_c_plan_architecture_launch_readiness.md`
**Mode:** execution/validation with shared repositories read-only; no LMS write
**Evidence owner:** `computer_architecture`
**Execution report:** `sidecar/reports/009_d_03_validate_current_main_compiler.md`
**Foreman acceptance:** `sidecar/reports/009_d_03_foreman_acceptance.md`

## Mission

Prove that the reconciled authoritative `computer_architecture/main` is a complete source for the current full-semester Architecture desired-state compiler.

This is the first post-reconciliation execution gate. It may read and execute code from Course Foundry and shared curriculum checkouts, but it may not mutate them.

## Execution-seat boundary

This was a **Computer Architecture-local** execution gate. `jeremy_task_tracking` was not the work queue, evidence ledger, or dispatch authority for this run.

The accepted execution used the Luna/medium Codex seat directly from this repository through:

`sidecar/scripts/009_d_03_launch_architecture_luna.sh`

## Accepted result

The exact current-main source set was SOURCE-VALIDATED and COMPILED on Brandy. The worker package was independently reviewed and promoted by the external Foreman.

Accepted evidence includes:

- 21 modules covering Weeks 1-17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- Week 16 recurring activities ungraded with no checkpoint;
- Machine Dossier checkpoints only Weeks 6, 9, and 14;
- A6, A7, and course evaluation present;
- zero undeclared omissions;
- zero unresolved `{{link:...}}` tokens;
- Architecture Course Foundry tests: 8 passed;
- Course Foundry deployment tests: 8 passed;
- historical `SourcePaths.defaults()` / `ARCHITECTURE_SOURCE_ROOT` concern retested and passed;
- Architecture `git diff --check`: PASS.

The current 11-group count is authoritative because `docs/grading-model.md` defines exactly 11 weighted categories totaling 100%, and the current compiler implements those same 11 categories. Prompt 006's historical 12-group count is not a current acceptance target.

## Named yellows retained

Brandy's full `archlab doctor` capability remains YELLOW for missing optional/full laboratory capabilities. The committed Week 3 fallback contract passed, so this did not block d03.

The consumed Course Foundry checkout was pre-existing dirty. It was preserved without update or patch, and no shared defect reproduced under the required tests.

## Authority boundary preserved

No JTT mutation, Savnac mutation, production Canvas access/write, shared-repository edit, package installation, or environment-wide reconfiguration occurred in d03.

## Promotion

The worker evidence branch `golem/009-d03-current-main-compiler` was fast-forward promoted to `main` without force. Foreman acceptance is durable at `sidecar/reports/009_d_03_foreman_acceptance.md`.

## Next gate

Proceed to `sidecar/prompts/009_d_04_rebaseline_savnac.md` for read-only Savnac course-8 inventory and guarded dry-run. d04 may not perform a live Savnac reconcile.
