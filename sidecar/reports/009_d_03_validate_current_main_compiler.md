# Prompt 009 d03 — Validate current-main Architecture compiler

## Result

The exact Architecture source at `b0ae4211715e067c64895f59b2f36c0715f7aa75` is **SOURCE-VALIDATED** and **COMPILED** by the current Course Foundry Architecture compiler. This report is bounded execution evidence only; it does not self-certify acceptance, merge to `main`, or authorize d04.

## Work order and source state

- Prompt: `sidecar/prompts/009_d_03_validate_current_main_compiler.md`
- Isolated branch: `golem/009-d03-current-main-compiler`
- Isolated worktree source SHA: `b0ae4211715e067c64895f59b2f36c0715f7aa75`
- Architecture base `main` was clean at launch and remained unmodified.
- No JTT traversal or mutation, Savnac mutation, production Canvas access, shared-repository writes, package installation, or environment-wide reconfiguration occurred.

## Exact shared inputs and caveats

| checkout | SHA | preflight state |
| --- | --- | --- |
| `course_foundry` | `22b895a593ef72d0787882b5f40d8463b36db981` | dirty: 673 entries (6 tracked, 667 untracked), listener/runtime receipts and state; not updated or modified |
| `semester_kickoff_week` | `94d8591369c350996f6984b05d0a9d50cee764a8` | clean |
| `ai_fluency` | `022262cf207c28a9504425779a24247ddcf66884` | clean |
| `professional_minds` | `af54438aeb4bddbbceed4524bc10379b0b9d5a3c` | clean |

The compiler and tests were run against explicit roots for the isolated Architecture worktree and these recorded shared checkouts. Pytest produced only cache-write warnings because the dirty Course Foundry checkout was read-only in this run.

## Validation performed

| check | result |
| --- | --- |
| Architecture source validator | **GREEN WITH YELLOWS**; all required paths, placeholders, fallback reference, repeated archprobe, and local diff check passed |
| Full-semester Architecture compiler | **PASS** |
| Architecture Course Foundry tests | **8 passed** |
| Course Foundry deployment tests | **8 passed** |
| Historical `SourcePaths.defaults()` registry test | retested and **passed**; no reproduction of the earlier failure |
| `make task-check` | unavailable: no such target |
| `make check` | unavailable: no such target |
| Architecture `git diff --check` | **PASS** |

The validator's retained host yellow is `archlab doctor` missing Python 3.10+, debugger state inspection, plotting, RISC-V cross-compilation, and PDF build capability. The committed Week 3 fallback path was verified, so this did not block the source/compiler gate.

## Current desired-state counts

- `21` modules: shared Week 1 plus Weeks 2–17
- `229` objects: `81` pages, `32` files, `116` assignments
- `11` assignment groups totaling `100.0%`
- zero undeclared omissions
- zero unresolved `{{link:...}}` tokens

## Policy and sentinel-week results

| contract | result |
| --- | --- |
| Weeks 1–17 | all represented |
| `drop_lowest=1` | exactly five recurring groups: AI Fluency, Professional Minds Wednesday, Professional Minds Friday, Weekly Architecture, Weekly Explain/Defend |
| Week 16 dead days | recurring assignments remain as `not_graded`; no graded recurring work or checkpoint |
| Machine Dossier | checkpoints only Weeks 6, 9, 14 |
| A6 | Week-14 update and Week-15 submission included |
| A7 | final reflection included in Week 17 |
| Course evaluation | included in Week 17 as a 2-point no-submission object |
| holiday/break/finals rules | targeted tests pass for Labor Day, Fall Break, Thanksgiving, and finals windows |
| required source paths | validator passes |
| unresolved link safety | compiler emits none |

## Evidence and next readiness

Raw/source validation receipt: `sidecar/runs/architecture_savnac_source_validation_20260818T124555Z.md`.

The bounded compiler receipt with command context is `sidecar/runs/009_d_03_compiler_receipt.md`. External Foreman review may use this branch as d03 evidence and decide whether d04 may begin. The d03 Foreman stops here; it does not merge, release, touch Savnac/Canvas, or self-certify acceptance.

## Repository compliance

- `AGENTS.md`: read; no update needed.
- `make task-check`: unavailable, exact error recorded above.
- `make check`: unavailable, exact error recorded above.
- `git diff --check`: passed.
- Report introduced by evidence commit: `3ff7e56`.
- Push status: to be filled after push.

Recommended next prompt: external Foreman review of d03 evidence, followed only if authorized by the separate d04 work order.
