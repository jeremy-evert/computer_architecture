# Computer Architecture Sidecar Prompts

Project-local work orders for COMSC-3013 Fall 2026 deployment.

## Current dispatch rule

Initiative 009 is the active launch path. Prompts 001-008 remain historical provenance and are not the current dispatch queue.

Current chain:

`009_a -> 009_b -> 009_c -> 009_d_01 -> 009_d_02 -> 009_d_03 -> 009_d_04 -> [009_d_05 if needed] -> 009_d_06 -> 009_d_07 -> 009_d_08 -> 009_e`

### Initiative 009 status

| Prompt | Status | Purpose |
|---|---|---|
| `009_a_report_architecture_launch_readiness.md` | ACCEPTED | establish current launch truth |
| `009_b_map_architecture_launch_ready_shape.md` | ACCEPTED | define launch-ready end state |
| `009_c_plan_architecture_launch_readiness.md` | ACCEPTED | decompose the route |
| `009_d_01_reconcile_canonical_launch_source.md` | ACCEPTED / PROMOTED | restore canonical launch source |
| `009_d_02_reconcile_current_status.md` | ACCEPTED / PROMOTED | make cold-start status/navigation truthful |
| `009_d_03_validate_current_main_compiler.md` | ACCEPTED / PROMOTED | validate current-main source + compiler |
| `009_d_04_rebaseline_savnac.md` | READY TO EXECUTE | read-only Savnac course-8 inventory and guarded dry-run |
| `009_d_05_reconcile_savnac_fixed_point.md` | CONDITIONAL | bounded Savnac write only if d04 proves a material delta |
| `009_d_06_production_recon_and_target_lock.md` | WAITING | read-only production target lock + semantic diff |
| `009_d_07_reconcile_production_canvas.md` | HUMAN GATE | production write only after GREEN TO WRITE + fresh Jeremy authorization |
| `009_d_08_production_launch_closeout.md` | WAITING | independent read-only production closeout |
| `009_e_validate_architecture_launch_readiness.md` | WAITING | final Foreman validation |

**Next executable unit:** [`009_d_04_rebaseline_savnac.md`](009_d_04_rebaseline_savnac.md).

Recommended Brandy launcher:

`sidecar/scripts/009_d_04_launch_architecture_luna.sh`

That launcher uses the Luna/medium Codex seat directly inside `computer_architecture`. It does not use JTT task traversal, `assistant/luna`, or the JTT completed-task intake.

## Accepted evidence chain

- d01 worker report: `../reports/009_d_01_reconcile_canonical_launch_source.md`
- d01 Foreman acceptance: `../reports/009_d_01_foreman_acceptance.md`
- d02 worker report: `../reports/009_d_02_reconcile_current_status.md`
- d02 Foreman acceptance: `../reports/009_d_02_foreman_acceptance.md`
- d03 worker report: `../reports/009_d_03_validate_current_main_compiler.md`
- d03 Foreman acceptance: `../reports/009_d_03_foreman_acceptance.md`
- d03 compiler receipt: `../runs/009_d_03_compiler_receipt.md`

## Current source/compiler truth

Accepted d03 proved the current canonical Architecture source under the current Course Foundry compiler:

- 21 modules covering Weeks 1-17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- no graded recurring Week 16 work and no Week 16 checkpoint;
- Machine Dossier checkpoints only Weeks 6, 9, and 14;
- A6, A7, and course evaluation present;
- zero undeclared omissions;
- zero unresolved link tokens;
- Architecture tests and deployment tests both passed 8/8.

The current 11-group count follows the authoritative grading model. Prompt 006's historical 12-group count must not be substituted for current doctrine.

## Human decision surface

There is no current Jeremy decision blocking d04. d04 is a read-only Savnac course-8 inventory/dry-run gate.

A fresh human authorization is required later for d07 production Canvas write. d04 does not grant or consume that authorization.

## d04 verdict contract

d04 must return exactly one:

- `ZERO_OR_EQUIVALENT`: d05 skipped after Foreman acceptance;
- `EXPECTED_MATERIAL_DELTA`: d05 becomes ready after Foreman acceptance;
- `UNEXPLAINED_DELTA`: stop and author a bounded repair/investigation unit.

No d04 verdict authorizes a live Savnac reconcile by itself.

## Status vocabulary

- **READY TO EXECUTE** - bounded work order exists and dependencies are accepted.
- **ACCEPTED / PROMOTED** - Foreman independently reviewed the package and promoted it to authoritative `main`.
- **WAITING** - a named predecessor or gate is not yet accepted.
- **CONDITIONAL** - execute only if prior evidence proves it is needed.
- **HUMAN GATE** - fresh explicit human authorization is required at execution time.

## Historical foundation

| Prompt family | Historical status | Durable result |
|---|---|---|
| 001 | IMPLEMENTED / COMPLETE | reconciled source chassis |
| 002 | IMPLEMENTED / COMPLETE | open-source Architecture canon |
| 003 | IMPLEMENTED WITH PLATFORM YELLOWS | reproducible Architecture laboratory |
| 004 | IMPLEMENTED / COMPLETE WITH NAMED YELLOWS | Weeks 5-14 technical core |
| 005 | IMPLEMENTED / VALIDATED | Week 16 shared Farkle + ML |
| 006 | ACCEPTED HISTORICAL SAVNAC FIXED POINT | full Savnac reconcile/read-back using older launch source |
| 007 | CONSUMED BY 006 | validator repair evidence |
| 008 | CONSUMED BY 006 | compiler/policy repair evidence |

Do not redispatch 006, 007, or 008 as current launch dependencies.
