# Computer Architecture Sidecar Prompts

Project-local work orders for COMSC-3013 Fall 2026 deployment.

> **CURRENT FORWARD PATH — Initiative 009 (2026-08-17).** Accepted `../reports/009_a_report_architecture_launch_readiness.md` proved the legacy launch queue below is stale: Prompts 007/008 were consumed by accepted Prompt 006, Prompt 006 reached a real Savnac fixed point, and the launch-ready source remains stranded on a diverged `savnac/architecture-launch-readiness` branch rather than fully integrated into current `main`. **Do not redispatch 006–008 from the historical queue below.** The accepted route is `009_a → 009_b → 009_c → 009_d_NN → 009_e`; the first READY implementation unit is [`009_d_01_reconcile_canonical_launch_source.md`](009_d_01_reconcile_canonical_launch_source.md). Full status reconciliation belongs to d_02 after d_01 establishes canonical source truth.

## Status vocabulary

- **READY** - bounded work order exists and dependencies are satisfied.
- **IMPLEMENTED** - real durable artifacts exist behind the work order.
- **IMPLEMENTED WITH YELLOWS** - implementation exists; named evidence/deployment checks remain.
- **WAITING** - cannot honestly advance until a named dependency/physical condition is available.

Do not call implemented work `drafted` merely because final deployment has not happened.

## Current launch queue

**Historical pre-Initiative-009 queue retained temporarily for provenance. Do not dispatch from this section.** d_02 will reconcile this file after d_01 is accepted.

1. **IMPLEMENTED / WAITING ON BRANDY ACCEPTANCE - Prompt 007:** repair the Savnac launch-source validator. The repair is authored on `savnac/architecture-launch-readiness` at `3ab17ba5d0d943cf9f63b6de378ef104dc3002f3`. It now distinguishes strict full-lab capability diagnostics from launch-source readiness and names the committed Week 3 fallback evidence. Before accepting or rejecting it, Brandy must fast-forward to that commit (or an accepted descendant), assert the SHA, rerun the validator, and retain the real receipt.
2. **MECHANICAL REPAIR IMPLEMENTED / POLICY-COMPLIANCE RECONCILIATION REQUIRED - Prompt 008:** the known kickoff-API mismatch and Ruff failures are repaired on `course_foundry:savnac/architecture-full-semester`, but the pre-acceptance audit found three additional truth gates: unsupported/incomplete drop-lowest rules, Week 16 dead-days compliance, and exact due-time provenance. `sidecar/questions/003_assessment_and_grading_contract.md` now contains the bounded Jeremy-level policy recommendation. After that decision is recorded, the worker repairs the compiler/tests, then Brandy runs targeted pytest + Ruff and the guarded no-write Savnac course-8 dry run.
3. **WAITING ON ACCEPTED 007 + 008 - Prompt 006:** reconcile the full course into the intended Savnac course and read it back. Course 8 is **not blank**: an earlier accepted partial imprint already placed shared Week 1 + authored Week 5 there. Prompt 006 must reconcile that existing state rather than create a duplicate course or assume a clean slate. Do not begin a live Savnac push until the source validator and full-semester compiler/dry-run are trustworthy and the live write is explicitly authorized. Production SWOSU Canvas remains separate and unauthorized.

## Current human decision surface

`sidecar/questions/003_assessment_and_grading_contract.md` is structurally resolved and now contains only the remaining operational policy cluster.

Current recommendation:

- drop lowest 1 in AI Fluency, Professional Minds Wednesday, Professional Minds Friday, Weekly Architecture/Investigation, and Weekly Explain/Defend;
- no drop in kickoff, Dossier checkpoints, professional pathway, final reflection, or evaluation;
- where source/policy names a due day but no clock, default to 11:59 PM America/Chicago unless an explicit source/calendar exception overrides it;
- leave late-work penalties and revision/resubmission windows unset until separately decided rather than fabricating them.

Week 16 dead-days compliance is **not** an open preference question: recurring graded work must not be scheduled on the three pre-finals class days.

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
