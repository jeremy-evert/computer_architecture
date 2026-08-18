# Computer Architecture - Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026
**Repository:** `jeremy-evert/computer_architecture`
**Source of truth:** Git
**Current initiative:** 009 - Architecture launch readiness
**Current stage:** d01, d02, and d03 accepted/promoted; d04 released
**Next execution gate:** `sidecar/prompts/009_d_04_rebaseline_savnac.md`
**Recommended execution seat:** Architecture-local Luna via `sidecar/scripts/009_d_04_launch_architecture_luna.sh`

## Mission

Build and launch an online Computer Architecture course where students understand a computer as a connected, measurable system rather than a vocabulary list.

**build the investigator -> build the machine -> open the machine -> stress the machine -> make the architecture decision -> wind down and reflect**

## Current accepted truth

The Fall 2026 Architecture-local source is consolidated on canonical `main`.

- Week 1 is consumed from the shared semester-kickoff source.
- Weeks 2-4 are authored Architecture-local source.
- Weeks 5-14 are the authored technical Architecture runway.
- Week 15 is the authored asynchronous Thanksgiving wind-down and professional-pathway close.
- Week 16 is the shared Farkle + Machine Learning experience and is not Checkpoint 4.
- Week 17 is authored reflection/closure.
- Machine Dossier checkpoints exist only in Weeks 6, 9, and 14.
- A6 professional-pathway artifacts, A7 final reflection, course-evaluation source, grading doctrine, and the launch-source validator are present.

Accepted d01 restored the launch-required source from the old diverged launch branch into canonical main. Accepted d02 made the cold-start navigation surfaces truthful. Accepted d03 proved that exact current-main source compiles under the current Course Foundry Architecture contract.

## Accepted d03 compiler proof

Brandy d03 evidence established:

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
- historical `SourcePaths.defaults()` / `ARCHITECTURE_SOURCE_ROOT` concern retested and passed.

The current 11-group count is authoritative. `docs/grading-model.md` defines 11 weighted categories totaling 100%, and the current compiler implements those same categories. Prompt 006's 12-group count is historical evidence only.

See:

- `sidecar/reports/009_d_03_validate_current_main_compiler.md`
- `sidecar/reports/009_d_03_foreman_acceptance.md`
- `sidecar/runs/009_d_03_compiler_receipt.md`

## Historical Savnac proof

Prompt 006 historically reconciled a full Architecture desired state into Savnac course 8 and reached two consecutive dry-runs at `0 create / 0 update / 240 unchanged / 0 delete`.

That run used an older launch worktree. d04 now asks the smaller question: does current accepted main still match live Savnac course 8 closely enough to inherit that fixed point, or is a fresh bounded Savnac reconcile actually required?

## Pinned course and deployment decisions

- online/asynchronous; M/W/F is production/release rhythm, not attendance;
- Weeks 5-14 are the technical Architecture runway;
- Machine Dossier freezes Week 14;
- checkpoints only Weeks 6, 9, and 14;
- RISC-V is the planning-leading teaching ISA;
- CPU-only, zero-cost required path;
- no required paid AI, premium agent, GPU, private infrastructure, or commercial textbook;
- five recurring categories use `drop_lowest=1`;
- due day without a named clock defaults to 11:59 PM America/Chicago unless explicit source/calendar truth overrides it;
- late penalties are owned by Marker policy;
- Week 16 dead days carry no recurring graded work;
- production Canvas writes require a fresh explicit human authorization gate.

## Initiative 009 launch path

| Unit | Status | Purpose |
|---|---|---|
| 009_a | ACCEPTED | report current launch truth |
| 009_b | ACCEPTED | map launch-ready end state |
| 009_c | ACCEPTED | plan bounded route |
| 009_d_01 | ACCEPTED / PROMOTED | restore canonical launch source |
| 009_d_02 | ACCEPTED / PROMOTED | reconcile current status/navigation |
| 009_d_03 | ACCEPTED / PROMOTED | validate current-main source + compiler |
| 009_d_04 | READY TO EXECUTE | read-only Savnac course-8 re-baseline |
| 009_d_05 | CONDITIONAL | bounded Savnac reconcile only if d04 proves material delta |
| 009_d_06 | WAITING | read-only production target lock + semantic diff |
| 009_d_07 | HUMAN GATE | production write only after GREEN TO WRITE + fresh Jeremy authorization |
| 009_d_08 | WAITING | independent production closeout |
| 009_e | WAITING | final Foreman launch-readiness validation |

## d04 decision fork

d04 is read-only. It must return exactly one verdict:

- `ZERO_OR_EQUIVALENT`: Savnac is already equivalent; skip d05 and proceed toward d06 after acceptance.
- `EXPECTED_MATERIAL_DELTA`: bounded understood Savnac changes are required; release d05.
- `UNEXPLAINED_DELTA`: stop and investigate before any Savnac write.

No d04 result itself authorizes a live Savnac reconcile.

## Named non-blocking yellows

Brandy's full laboratory capability remains incomplete for some optional/full paths. The committed required/fallback source path is validated. Course Foundry also had substantial pre-existing dirt during d03; the worker preserved it and did not modify it.

## Dispatch rule

Use this board for current launch state and `sidecar/prompts/README.md` for bounded dispatch. Prompts/reports 001-008 remain historical provenance, not the active queue.

**The next executable Architecture unit is `009_d_04_rebaseline_savnac.md`.**
