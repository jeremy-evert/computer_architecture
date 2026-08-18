# Computer Architecture - Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Repository:** `jeremy-evert/computer_architecture`  
**Source of truth:** Git  
**Current initiative:** 009 - Architecture launch readiness  
**Current stage:** d01 accepted/promoted; d02 status reconciliation in progress  
**Next execution gate after d02:** `sidecar/prompts/009_d_03_validate_current_main_compiler.md`

## Mission

Build and launch an online Computer Architecture course where students understand a computer as a connected, measurable system rather than a vocabulary list.

**build the investigator -> build the machine -> open the machine -> stress the machine -> make the architecture decision -> wind down and reflect**

## Current course/source truth

The Architecture-local Fall 2026 source is now on canonical `main`.

- Week 1 is consumed from the shared semester-kickoff source.
- Weeks 2-4 have authored Architecture-local student/instructor packages on `main`.
- Weeks 5-14 are the authored technical Architecture runway.
- Week 15 is the authored asynchronous Thanksgiving wind-down and professional-pathway close.
- Week 16 is the implemented shared Farkle + Machine Learning experience; it is not Checkpoint 4.
- Week 17 is authored reflection/closure.
- Machine Dossier checkpoints exist only in Weeks 6, 9, and 14.
- A6 professional-pathway artifacts, A7 final reflection, course-evaluation source, grading doctrine, and the launch-source validator are present on `main`.

Prompt 009 d01 recovered the still-valid launch source from `savnac/architecture-launch-readiness`, reconciled A6 to current professional-pathway doctrine, validated it on Brandy, and was Foreman-accepted/promoted. See:

- `sidecar/reports/009_d_01_reconcile_canonical_launch_source.md`
- `sidecar/reports/009_d_01_foreman_acceptance.md`
- `sidecar/runs/architecture_savnac_source_validation_20260818T053147Z.md`

The Brandy source receipt is **GREEN WITH YELLOWS**. The named yellows are host-capability limitations, not missing launch source.

## Historical Savnac proof

Accepted Prompt 006 previously proved that a full Architecture desired course could be reconciled into Savnac course 8 and converge to a fixed point. That historical run reached:

- 21 modules;
- 229 module items;
- 116 assignments;
- 12 assignment groups totaling 100%;
- two consecutive dry-runs at `0 create / 0 update / 240 unchanged / 0 delete`.

That proof used the older launch worktree. Initiative 009 exists to prove the **current canonical `main`** independently before any production deployment.

## Pinned course decisions

- online/asynchronous; M/W/F is production/release rhythm, not attendance;
- Monday model/AI Fluency, Wednesday investigation/Professional Minds, Friday Explain/Defend + optional Stack Showcase;
- Weeks 5-14 are the complete technical Architecture runway;
- Machine Dossier begins Week 5 and freezes Week 14;
- checkpoints only Weeks 6, 9, and 14;
- evidence grammar: **predict -> perturb -> run -> measure -> visualize -> explain -> revise**;
- RISC-V is the planning-leading teaching ISA;
- CPU-only, zero-cost required path; no required paid AI, premium agent, GPU, private infrastructure, or commercial textbook;
- accepted recurring-category rule is `drop_lowest=1` for AI Fluency, Professional Minds Wednesday, Professional Minds Friday, Weekly Architecture/Investigation, and Weekly Explain/Defend;
- when a source names a due day but no clock, default is 11:59 PM America/Chicago unless an explicit source/calendar exception applies;
- late-work penalties are owned by Marker policy, not invented by Course Foundry;
- Week 16 pre-finals dead days do not carry recurring graded work;
- Week 15 winds down, Week 16 is shared Farkle + ML, Week 17 is reflection only;
- production Canvas writes require a separate explicit human authorization gate.

## Initiative 009 launch path

| Unit | Status | Purpose |
|---|---|---|
| 009_a | ACCEPTED | report current launch truth |
| 009_b | ACCEPTED | map launch-ready end state |
| 009_c | ACCEPTED | plan bounded route |
| 009_d_01 | ACCEPTED / PROMOTED | restore canonical launch source to `main` |
| 009_d_02 | IN PROGRESS | make cold-start status/navigation truthful |
| 009_d_03 | NEXT / READY AFTER d02 | validate current-main source + compiler with shared repos read-only |
| 009_d_04 | WAITING ON d03 | read-only Savnac re-baseline |
| 009_d_05 | CONDITIONAL | reconcile Savnac only if d04 proves a live delta |
| 009_d_06 | WAITING | read-only production reconnaissance and exact target lock |
| 009_d_07 | HUMAN GATE | bounded production Canvas write after fresh authorization |
| 009_d_08 | WAITING | independent production launch closeout |
| 009_e | WAITING | final Foreman launch-readiness validation |

## Remaining launch gates

### Gate 1 - Current-main compiler proof

Run d03 against exact recorded checkouts. Prove the full current-main desired course, source paths, 100% assignment groups, drop-lowest rules, dead days, checkpoint placement, dates, and unresolved-link safety. Shared repositories are read-only during this gate.

### Gate 2 - Current Savnac equivalence

Run d04 read-only against Savnac course 8. If the current desired state already produces a zero diff, d05 is skipped. If there is a bounded explained delta, d05 becomes required.

### Gate 3 - Production target lock and semantic diff

Run d06 read-only against production Canvas. Resolve the exact Fall 2026 `COMSC-3013-1438` course ID from live evidence. Do not guess or reuse the Savnac course ID.

### Gate 4 - Production write

Run d07 only after d06 returns `GREEN TO WRITE` and Jeremy gives fresh execution-time authorization. No production write is authorized merely because this board exists.

### Gate 5 - Independent closeout

Run d08 as a separate read-only production verification. Then `009_e` performs final Foreman acceptance.

## Named non-blocking yellows

Physical platform support remains evidence-gated where not executed: WSL2, macOS, some container/image paths, and optional accelerator lanes. These do not justify pretending the required CPU/fallback path is missing.

## Dispatch rule

For current work, use this board and `sidecar/prompts/README.md`. Prompts/reports 001-008 remain historical provenance and must not be redispatched as if they are the current queue.

**The next executable Architecture unit after d02 acceptance is `009_d_03_validate_current_main_compiler.md`.**
