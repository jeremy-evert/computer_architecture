# Computer Architecture Sidecar Prompts

Project-local work orders for COMSC-3013 Fall 2026 deployment.

## Current dispatch rule

Initiative 009 is the active launch path. Prompts 001-008 remain historical provenance and are not the current dispatch queue.

Current chain:

`009_a -> 009_b -> 009_c -> 009_d_01 -> 009_d_02 -> 009_d_03 -> 009_d_04 -> 009_d_05 -> 009_d_06 -> 009_d_07 -> 009_d_08 -> 009_e`

### Initiative 009 status

| Prompt | Status | Purpose |
|---|---|---|
| `009_a_report_architecture_launch_readiness.md` | ACCEPTED | establish current launch truth |
| `009_b_map_architecture_launch_ready_shape.md` | ACCEPTED | define launch-ready end state |
| `009_c_plan_architecture_launch_readiness.md` | ACCEPTED | decompose the route |
| `009_d_01_reconcile_canonical_launch_source.md` | ACCEPTED / PROMOTED | restore canonical launch source |
| `009_d_02_reconcile_current_status.md` | ACCEPTED / PROMOTED | make cold-start status/navigation truthful |
| `009_d_03_validate_current_main_compiler.md` | ACCEPTED / PROMOTED | validate current-main source + compiler |
| `009_d_04_rebaseline_savnac.md` | ACCEPTED / PROMOTED | read-only Savnac re-baseline; `EXPECTED_MATERIAL_DELTA` |
| `009_d_05_reconcile_savnac_fixed_point.md` | READY TO EXECUTE | apply exactly seven accepted Savnac body updates and prove fixed point |
| `009_d_06_production_recon_and_target_lock.md` | WAITING ON d05 | read-only production target lock + semantic diff |
| `009_d_07_reconcile_production_canvas.md` | HUMAN GATE | production write only after GREEN TO WRITE + fresh Jeremy authorization |
| `009_d_08_production_launch_closeout.md` | WAITING | independent read-only production closeout |
| `009_e_validate_architecture_launch_readiness.md` | WAITING | final Foreman validation |

**Next executable unit:** [`009_d_05_reconcile_savnac_fixed_point.md`](009_d_05_reconcile_savnac_fixed_point.md).

Recommended Brandy launcher:

`sidecar/scripts/009_d_05_launch_savnac_reconcile_luna.sh`

That launcher uses Luna/medium as the bounded Computer Architecture execution/validation Golem. It does not use JTT traversal, `assistant/luna`, or JTT completed-task intake. The external Foreman owns acceptance and promotion.

## Accepted evidence chain

- d01 worker report: `../reports/009_d_01_reconcile_canonical_launch_source.md`
- d01 Foreman acceptance: `../reports/009_d_01_foreman_acceptance.md`
- d02 worker report: `../reports/009_d_02_reconcile_current_status.md`
- d02 Foreman acceptance: `../reports/009_d_02_foreman_acceptance.md`
- d03 worker report: `../reports/009_d_03_validate_current_main_compiler.md`
- d03 Foreman acceptance: `../reports/009_d_03_foreman_acceptance.md`
- d03 compiler receipt: `../runs/009_d_03_compiler_receipt.md`
- d04 worker report: `../reports/009_d_04_rebaseline_savnac.md`
- d04 Foreman acceptance: `../reports/009_d_04_foreman_acceptance.md`
- d04 Savnac receipt: `../runs/009_d_04_savnac_rebaseline_receipt.md`

## Current source/compiler truth

Accepted d03 proved current canonical Architecture source under the current Course Foundry compiler:

- 21 modules covering Weeks 1-17;
- 229 objects: 81 pages, 32 files, 116 assignments;
- 11 desired assignment groups totaling 100%;
- exactly five recurring groups with `drop_lowest=1`;
- no graded recurring Week 16 work and no Week 16 checkpoint;
- Machine Dossier checkpoints only Weeks 6, 9, 14;
- A6, A7, and course evaluation present;
- zero undeclared omissions;
- zero unresolved link tokens;
- Architecture tests and deployment tests both passed 8/8.

## Accepted d04 Savnac truth

Savnac course 8 is structurally aligned with desired current state, but seven accepted body updates remain.

Accepted dry-run:

```text
0 create / 7 update / 233 unchanged / 0 delete
```

Accepted updates:

- Week 02 Week at a Glance;
- Week 03 Week at a Glance;
- Week 04 Week at a Glance;
- A6 Week 14 Update;
- A6 Week 15 Submission;
- Week 16 Week at a Glance;
- Week 16 Explain / Defend.

No creates, deletes, group changes, kind changes, duplicate collisions, or prune actions belong to d05.

## Human decision surface

There is **no Jeremy policy decision blocking d05**. d05 is the already-planned guarded non-production Savnac course-8 reconcile after accepted d04 evidence.

A fresh human authorization is required later at d07 before any production Canvas write. d05 does not grant or consume production authorization.

## d05 execution contract

Before write, the launcher/Golem must re-prove the exact accepted `0 create / 7 update / 233 unchanged / 0 delete` envelope and confirm no source/compiler, enrollment, submission, or object drift.

After write, require:

- write envelope `0 create / 7 update / 0 delete`;
- bounded read-back;
- first guarded no-op dry-run;
- second consecutive guarded no-op dry-run.

Anything unexpected stops the run before further mutation.

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
