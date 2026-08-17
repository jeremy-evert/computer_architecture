# Computer Architecture Sidecar Prompts

Project-local work orders for COMSC-3013 Fall 2026 deployment.

## Status vocabulary

- **READY** - bounded work order exists and dependencies are satisfied.
- **IMPLEMENTED** - real durable artifacts exist behind the work order.
- **IMPLEMENTED WITH YELLOWS** - implementation exists; named evidence/deployment checks remain.
- **WAITING** - cannot honestly advance until a named dependency/physical condition is available.

Do not call implemented work `drafted` merely because final deployment has not happened.

## Current launch queue

Work this list in order. The detailed work stays here in the course sidecar; the global task tracker should point here rather than duplicate the implementation narrative.

1. **IMPLEMENTED / WAITING ON BRANDY ACCEPTANCE - Prompt 007:** repair the Savnac launch-source validator. The repair is authored on `savnac/architecture-launch-readiness` at `3ab17ba5d0d943cf9f63b6de378ef104dc3002f3`. It now distinguishes strict full-lab capability diagnostics from launch-source readiness and names the committed Week 3 fallback evidence. Before accepting or rejecting it, Brandy must fast-forward to that commit (or an accepted descendant), assert the SHA, rerun the validator, and retain the real receipt.
2. **IMPLEMENTED / WAITING ON BRANDY ACCEPTANCE - Prompt 008:** repair the Course Foundry full-semester Architecture compiler. The known kickoff-API mismatch and six Ruff E501 failures are repaired on `course_foundry:savnac/architecture-full-semester` at `667693d9b06066c1268e0f319668029019ccef82`. Brandy must fast-forward/assert the exact implementation, run targeted pytest + Ruff against the real sibling checkouts, inspect the full plan, then run the guarded no-write Savnac course-8 dry run.
3. **WAITING ON ACCEPTED 007 + 008 - Prompt 006:** reconcile the full course into the intended Savnac course and read it back. Course 8 is **not blank**: an earlier accepted partial imprint already placed shared Week 1 + authored Week 5 there. Prompt 006 must reconcile that existing state rather than create a duplicate course or assume a clean slate. Do not begin a live Savnac push until the source validator and full-semester compiler/dry-run are trustworthy and the live write is explicitly authorized. Production SWOSU Canvas remains separate and unauthorized.

### Real-host rule

Before any validation run used as acceptance evidence:

1. fetch/pull the intended branch;
2. print/assert the exact commit under test;
3. only then execute the gate.

A RED produced by an older worktree tip is evidence about that older tip, not about a newer remote repair.

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
