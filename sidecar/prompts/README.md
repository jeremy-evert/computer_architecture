# Computer Architecture Sidecar Prompts

Project-local work orders for COMSC-3013 Fall 2026 deployment.

## Status vocabulary

- **READY** - bounded work order exists and dependencies are satisfied.
- **IMPLEMENTED** - real durable artifacts exist behind the work order.
- **IMPLEMENTED WITH YELLOWS** - implementation exists; named evidence/deployment checks remain.
- **WAITING** - cannot honestly advance until a named dependency/physical condition is available.

Do not call implemented work `drafted` merely because final deployment has not happened.

## Current launch queue

Work this list in order. The detailed work stays here in the course sidecar; the global `jeremy_task_tracking/TASKS.md` should point here rather than duplicate the implementation narrative.

1. **READY - Prompt 007:** repair the Brandy Savnac launch-source validator. Real receipt `architecture_savnac_source_validation_20260817T011634Z.md` is RED because the validator currently treats the full `archlab doctor` capability result as a launch-source hard gate. Preserve doctor strictness; repair the validator contract and prove the required/fallback Week 3 path honestly.
2. **READY - Prompt 008:** repair the Course Foundry full-semester Architecture compiler. Real Brandy targeted run is 6 failed / 4 passed because `_week1_modules()` calls `compute_kickoff_plan` with an obsolete `course_repo_path` keyword; Ruff also has six E501 nits. Fix from current API source, prove pytest/Ruff, then run the guarded no-write Savnac course-8 dry run.
3. **WAITING ON 007 + 008 - Prompt 006:** imprint Computer Architecture into the intended Savnac course and read it back. Prompt 006 is the umbrella deployment/dogfood gate. Do not begin a live Savnac push until the source validator and full-semester compiler/dry-run are trustworthy and the live write is explicitly authorized. Production SWOSU Canvas remains separate and unauthorized.

## Completed / implemented foundation

1. **IMPLEMENTED / COMPLETE** - Prompt 001 reconciliation.
2. **IMPLEMENTED / COMPLETE** - Prompt 002 open-source Architecture canon.
3. **IMPLEMENTED WITH PLATFORM YELLOWS** - Prompt 003 reproducible Architecture laboratory.
4. **IMPLEMENTED / COMPLETE WITH NAMED PHYSICAL/RELEASE YELLOWS** - Prompt 004 Weeks 5-14 technical core.
5. **IMPLEMENTED / VALIDATED** - Prompt 005 shared Week 16 Farkle + ML experience; historical filename retained, not an Architecture capstone.

## Prompt 004 campaign

| Prompt | Status | Result |
|---|---|---|
| 004_a | IMPLEMENTED / PASS | shared authoring workbench |
| 004_b | IMPLEMENTED WITH YELLOWS | Week 5 |
| 004_c | IMPLEMENTED WITH YELLOWS | Week 6 + CP1 |
| 004_d | IMPLEMENTED WITH YELLOWS | Week 7 |
| 004_e | IMPLEMENTED WITH YELLOWS | Week 8 |
| 004_f | IMPLEMENTED WITH YELLOWS | Week 9 + CP2 |
| 004_g | IMPLEMENTED WITH YELLOWS | Week 10 |
| 004_h | IMPLEMENTED WITH YELLOWS | Week 11 |
| 004_i | IMPLEMENTED WITH YELLOWS | Week 12 |
| 004_j | IMPLEMENTED WITH YELLOWS | Week 13 |
| 004_k | IMPLEMENTED WITH YELLOWS | Week 14 + CP3 |
| 004_l | IMPLEMENTED / PASS | continuity audit + fallback repairs |
| 004_m | IMPLEMENTED WITH PHYSICAL YELLOWS | Linux release truth + platform matrix/runbook |
| 004_n | IMPLEMENTED / PASS | helm acceptance |

**Authoritative Prompt 004 receipt:** `../reports/004_author_weeks_05_14_architecture_core.md`.

Physical Windows/Mac/container validation can update support receipts without reopening the 004 authoring campaign unless it exposes a real course-contract failure.
