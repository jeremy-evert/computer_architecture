# Initiative 009 d03 bounded compiler receipt

- Work order: `sidecar/prompts/009_d_03_validate_current_main_compiler.md`
- Architecture branch: `golem/009-d03-current-main-compiler`
- Architecture source SHA: `b0ae4211715e067c64895f59b2f36c0715f7aa75`
- Host: `brandy`
- Shared checkouts were read-only; no Savnac or Canvas access occurred.

## Inputs actually consumed

| checkout | SHA | dirt at preflight |
| --- | --- | --- |
| `computer_architecture` isolated d03 worktree | `b0ae4211715e067c64895f59b2f36c0715f7aa75` | clean before generated receipt |
| `course_foundry` | `22b895a593ef72d0787882b5f40d8463b36db981` | dirty: 673 status entries (6 tracked, 667 untracked), primarily listener/runtime receipts and state |
| `semester_kickoff_week` | `94d8591369c350996f6984b05d0a9d50cee764a8` | clean |
| `ai_fluency` | `022262cf207c28a9504425779a24247ddcf66884` | clean |
| `professional_minds` | `af54438aeb4bddbbceed4524bc10379b0b9d5a3c` | clean |

The dirty Course Foundry checkout was not updated or modified. Pytest emitted cache-write warnings because its cache path is in that read-only shared checkout; test results themselves completed successfully.

## Commands and results

1. `python3 scripts/validate_savnac_launch_source.py` — **GREEN WITH YELLOWS**. All required current-main source paths, placeholder checks, Week 3 fallback reference, repeated `archprobe`, and local `git diff --check` passed. `archlab doctor` retained a host-capability yellow for missing Python 3.10+, debugger inspection, plotting, RISC-V cross-compilation, and PDF build capability.
2. Full-semester compiler invocation using `course_foundry.course_foundry.architecture_desired_course` with explicit roots for this Architecture worktree and the four shared checkouts — **PASS**.
3. `pytest -q ../../../course_foundry/tests/test_architecture_desired_course.py` with explicit source-root environment variables — **8 passed**.
4. `pytest -q ../../../course_foundry/tests/test_savnac_deploy.py` — **8 passed**. This retested the historical `SourcePaths.defaults()` / `ARCHITECTURE_SOURCE_ROOT` concern; it did not reproduce.
5. `make task-check` — unavailable: `make: *** No rule to make target 'task-check'. Stop.`
6. `make check` — unavailable: `make: *** No rule to make target 'check'. Stop.`
7. `git diff --check` — **PASS** for the Architecture evidence worktree.

## Actual compiler counts

- course: `Computer Architecture`, id `8`
- modules: `21` (shared Week 1 plus Architecture Weeks 2–17)
- objects: `229` (`81` pages, `32` files, `116` assignments)
- assignment groups: `11`, weights `100.0%`
- undeclared omissions: `()`
- unresolved `{{link:...}}` tokens: `0`
- checkpoints: exactly Machine Dossier Checkpoints 1/2/3 in Weeks 6/9/14

## Policy and sentinel-week table

| contract | observed result | status |
| --- | --- | --- |
| Weeks 1–17 represented | module positions include Week 1 and every Week 2–17 | GREEN |
| assignment groups | 11 groups total 100% | GREEN |
| recurring drop-lowest | exactly five groups at `drop_lowest=1`: AI, PM Wednesday, PM Friday, Weekly Architecture, Weekly Explain/Defend | GREEN |
| Week 16 dead days | seven recurring activities remain present but all are `not_graded`; no checkpoint | GREEN |
| Machine Dossier checkpoints | only Weeks 6, 9, 14 | GREEN |
| A6 | Week-14 update and Week-15 submission present | GREEN |
| A7 | final reflection present in Week 17 | GREEN |
| course evaluation | present in Week 17, 2-point no-submission object | GREEN |
| calendar | Labor Day fold, Fall Break, Thanksgiving, and finals constraints pass targeted tests | GREEN |
| required paths | source validator found all required paths | GREEN |
| unresolved links | compiler output contains zero unresolved tokens | GREEN |

## Gate conclusion

The exact current-main Architecture source set is **SOURCE-VALIDATED** and **COMPILED** by the current Course Foundry Architecture compiler/tests. This is bounded d03 evidence, not acceptance or release certification. The host capability yellow and the pre-existing dirty Course Foundry checkout remain documented caveats; neither blocked the required source/compiler path, and no shared defect was reproduced.

Recommended d04 readiness: external Foreman review may use this branch/report as the current-main compiler gate evidence and decide whether to authorize the next Savnac re-baseline unit. Do not merge this branch, write Savnac/Canvas, or self-certify acceptance as part of d03.

## Evidence files

- `sidecar/runs/architecture_savnac_source_validation_20260818T124555Z.md`
- this bounded compiler receipt
- required report: `sidecar/reports/009_d_03_validate_current_main_compiler.md`

Report commit SHA is recorded in the required report after commit.
