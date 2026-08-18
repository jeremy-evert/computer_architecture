# Computer Architecture Sidecar Prompts

Project-local work orders for COMSC-3013 Fall 2026 deployment.

## Current dispatch rule

Initiative 009 is the active launch path. Prompts 001-008 remain useful historical provenance, but they are **not** the current dispatch queue.

Current chain:

`009_a -> 009_b -> 009_c -> 009_d_01 -> 009_d_02 -> 009_d_03 -> 009_d_04 -> [009_d_05 if needed] -> 009_d_06 -> 009_d_07 -> 009_d_08 -> 009_e`

### Initiative 009 status

| Prompt | Status | Purpose |
|---|---|---|
| `009_a_report_architecture_launch_readiness.md` | ACCEPTED | establish current launch truth |
| `009_b_map_architecture_launch_ready_shape.md` | ACCEPTED | define launch-ready end state |
| `009_c_plan_architecture_launch_readiness.md` | ACCEPTED | decompose the route |
| `009_d_01_reconcile_canonical_launch_source.md` | ACCEPTED / PROMOTED | restore launch-required Architecture-local source to canonical `main` |
| `009_d_02_reconcile_current_status.md` | ACCEPTED / PROMOTED | make cold-start status/navigation truthful |
| `009_d_03_validate_current_main_compiler.md` | READY TO EXECUTE | validate current-main source + compiler; shared repos read-only |
| `009_d_04_rebaseline_savnac.md` | WAITING ON d03 | read-only Savnac inventory/dry-run |
| `009_d_05_reconcile_savnac_fixed_point.md` | CONDITIONAL | bounded Savnac write only if d04 proves a delta |
| `009_d_06_production_recon_and_target_lock.md` | WAITING | read-only production target lock + semantic diff |
| `009_d_07_reconcile_production_canvas.md` | HUMAN GATE | production write only after `GREEN TO WRITE` + fresh Jeremy authorization |
| `009_d_08_production_launch_closeout.md` | WAITING | independent read-only production closeout |
| `009_e_validate_architecture_launch_readiness.md` | WAITING | final Foreman validation |

**Next executable unit:** [`009_d_03_validate_current_main_compiler.md`](009_d_03_validate_current_main_compiler.md).

Recommended Brandy launcher:

`sidecar/scripts/009_d_03_launch_architecture_luna.sh`

That launcher uses the Luna/medium Codex seat directly inside `computer_architecture`. It does **not** use JTT task traversal, `assistant/luna`, or the JTT completed-task intake.

## Status vocabulary

- **READY** - bounded work order exists and dependencies are satisfied.
- **ACCEPTED / PROMOTED** - Foreman reviewed the evidence and promoted the bounded result into authoritative `main`.
- **IMPLEMENTED** - real durable artifacts exist behind the historical work order.
- **IMPLEMENTED WITH YELLOWS** - implementation exists; named evidence/deployment checks remain.
- **WAITING** - cannot honestly advance until a named dependency is accepted.
- **CONDITIONAL** - execute only if prior evidence proves it is needed.
- **HUMAN GATE** - a fresh explicit human authorization is required at execution time.

## Current source truth

Prompt 009 d01 recovered the still-valid launch source from the diverged `savnac/architecture-launch-readiness` branch and promoted it to `main` after Brandy validation. The canonical Architecture source now includes local Weeks 2-4, 15, and 17; A6/A7; course-evaluation source; and the launch-source validator while preserving newer main doctrine.

Prompt 009 d02 then reconciled the repository status/navigation surfaces and was accepted after a silent Brandy `git diff --check`.

See:

- `../reports/009_d_01_reconcile_canonical_launch_source.md`
- `../reports/009_d_01_foreman_acceptance.md`
- `../runs/architecture_savnac_source_validation_20260818T053147Z.md`
- `../reports/009_d_02_reconcile_current_status.md`
- `../reports/009_d_02_foreman_acceptance.md`

Prompt 006 is historical evidence that the full course once reached a real Savnac fixed point. It is **not** authorization to assume current `main`, current Savnac, or production Canvas still match that snapshot. d03 and d04 re-prove those surfaces from current truth.

## Human decision surface

There is no current Jeremy decision blocking d03.

Accepted assessment/deployment doctrine includes:

- `drop_lowest=1` in the five recurring groups: AI Fluency, Professional Minds Wednesday, Professional Minds Friday, Weekly Architecture/Investigation, and Weekly Explain/Defend;
- no drop in kickoff, Machine Dossier checkpoints, professional pathway, final reflection, or course evaluation;
- due-day-without-clock defaults to 11:59 PM America/Chicago unless explicit source/calendar truth overrides it;
- recurring graded work does not land on Week 16 pre-finals dead days;
- production Canvas remains separately gated.

### Real-host evidence rule

Before a machine run is used as acceptance evidence:

1. fetch/pull the intended Architecture branch;
2. print/assert the exact Architecture commit under test;
3. record the exact shared-source SHAs actually consumed;
4. preserve unrelated dirt;
5. execute the bounded gate.

A result from an older worktree tip is evidence about that older tip, not about a newer remote repair.

## Historical completed foundation

| Prompt family | Historical status | Durable result |
|---|---|---|
| 001 | IMPLEMENTED / COMPLETE | reconciled source chassis |
| 002 | IMPLEMENTED / COMPLETE | open-source Architecture canon |
| 003 | IMPLEMENTED WITH PLATFORM YELLOWS | reproducible Architecture laboratory |
| 004 | IMPLEMENTED / COMPLETE WITH NAMED YELLOWS | Weeks 5-14 technical core |
| 005 | IMPLEMENTED / VALIDATED | Week 16 shared Farkle + ML experience |
| 006 | IMPLEMENTED / ACCEPTED HISTORICAL SAVNAC FIXED POINT | full Savnac reconcile/read-back using the older launch worktree |
| 007 | CONSUMED BY ACCEPTED 006 | validator repair evidence |
| 008 | CONSUMED BY ACCEPTED 006 | compiler/policy repair evidence |

Do not redispatch 006, 007, or 008 as current launch dependencies.

## Prompt 004 campaign provenance

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

Authoritative Prompt 004 receipt: `../reports/004_author_weeks_05_14_architecture_core.md`.