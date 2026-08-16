# Prompt 004 authoritative execution report - Weeks 5-14 Architecture core

**Status:** COMPLETE WITH NAMED PHYSICAL/RELEASE YELLOWS  
**Date:** 2026-08-16  
**Scope:** Prompt 004_a through 004_n

## Helm verdict

Weeks 5-14 are now an authored, continuity-audited, evidence-producing Computer Architecture technical core.

The campaign achieved the parent charter's intended movement:

> **Build a machine. Open it. Follow software down into it. Make its constraints hurt. Discover what the workload actually cares about. Then sit in the architect's chair and make the call.**

The remaining YELLOWs are physical-platform, recording, and final deployment checks. They are not unresolved Week 5-14 curriculum design.

## Campaign status

| Prompt | Status | Durable result |
|---|---|---|
| 004_a | IMPLEMENTED / PASS | shared `weeks/` authoring grammar, validated Beamer + notes workbench |
| 004_b | IMPLEMENTED WITH NAMED YELLOWS | Week 5 machine/workload/$1,500/Dossier v0 |
| 004_c | IMPLEMENTED WITH NAMED YELLOWS | Week 6 representation/RV32I + Checkpoint 1 |
| 004_d | IMPLEMENTED WITH NAMED YELLOWS | Week 7 bounded datapath/control trace |
| 004_e | IMPLEMENTED WITH NAMED YELLOWS | Week 8 dependency/overlap sensory plot |
| 004_f | IMPLEMENTED WITH NAMED YELLOWS | Week 9 source-to-machine Checkpoint 2; Fall Break protected |
| 004_g | IMPLEMENTED WITH NAMED YELLOWS | Week 10 memory hierarchy sensory lab |
| 004_h | IMPLEMENTED WITH NAMED YELLOWS | Week 11 VM/protection/process bridge |
| 004_i | IMPLEMENTED WITH NAMED YELLOWS | Week 12 scaling + Chatterbox/Freight Train |
| 004_j | IMPLEMENTED WITH NAMED YELLOWS | Week 13 specialization/vector evidence |
| 004_k | IMPLEMENTED WITH NAMED YELLOWS | Week 14 architecture verdict + Checkpoint 3 + freeze |
| 004_l | IMPLEMENTED / PASS | continuity map + fallback-seam repairs |
| 004_m | IMPLEMENTED WITH PHYSICAL-MACHINE YELLOWS | fresh authored Linux execution + support matrix/runbook |
| 004_n | IMPLEMENTED / PASS | helm acceptance + status reconciliation |

## Shared authoring architecture

The current teaching truth is `weeks/week-05/` through `weeks/week-14/`.

Every technical week uses the common package:

```text
README.md
monday.md
monday.tex
wednesday.md
friday.md
references.md
_instructor.md
_validation.md
```

Weeks 6, 9, and 14 additionally use `checkpoint.md`.

The recurring argument is:

> **Monday builds the model. Wednesday makes the machine argue with it. Friday explains the smoke.**

The experimental grammar remains:

> **Predict -> Perturb -> Run -> Measure -> Visualize -> Explain -> Revise.**

## Week readiness matrix

| Week | Technical role | Implementation judgment |
|---|---|---|
| 5 | Build the Machine / Dossier v0 | IMPLEMENTED WITH RELEASE YELLOWS |
| 6 | Bits Become Instructions / CP1 | IMPLEMENTED WITH RELEASE YELLOWS |
| 7 | Crack Open the CPU | IMPLEMENTED WITH RELEASE YELLOWS |
| 8 | Make It Fast Without Breaking It | IMPLEMENTED WITH RELEASE YELLOWS |
| 9 | Follow the Program Down / CP2 | IMPLEMENTED WITH RELEASE YELLOWS |
| 10 | Make the Memory Hierarchy Hurt | IMPLEMENTED WITH RELEASE YELLOWS |
| 11 | The Useful Lie of Memory | IMPLEMENTED WITH RELEASE YELLOWS |
| 12 | More Cores, More Problems | IMPLEMENTED WITH RELEASE YELLOWS |
| 13 | Different Machines for Different Work | IMPLEMENTED WITH RELEASE YELLOWS |
| 14 | Sit in the Architect's Chair / CP3 | IMPLEMENTED WITH RELEASE YELLOWS |

The word YELLOW does **not** mean the lesson is a draft. It means the lesson is implemented while a named release/platform/recording proof remains.

## Continuity acceptance

`planning/technical-core-continuity.md` records the exact persistent handoffs.

Helm review confirms:

- Week 5's machine/workload/$1,500 constraint returns in Week 14;
- `transform()` persists through Weeks 6-9;
- Week 10's physical-memory behavior grows into Week 11's translation/protection story;
- Week 12's workload-shape/scaling story grows into Week 13 specialization;
- metrics mature instead of merely accumulating;
- Week 9 carries no hidden Friday Fall Break burden;
- Week 14 is the technical hard stop.

Prompt 004_l repaired missing fallback evidence rather than merely reporting it.

## Laboratory / execution acceptance

Prompt 004_m freshly executed the final authored Linux commands from current committed lab source.

GREEN on the executed Linux surface:

- `archlab doctor`;
- scoped `archprobe`;
- RV32I source-to-state path (`a0=18`, `a1=18`);
- Week 8 12M dependency workload + plot;
- Week 10 memory sweep + latency/bandwidth plots;
- Week 11 unprivileged page-size + `/proc/self/maps` observation;
- Week 12 4M scaling + communication + plots;
- Week 13 4M vector experiment + compiler vectorization evidence + plot;
- Week 14 five-figure Dossier PDF.

Authoritative receipt: `lab/validation/2026-08-16-authored-weeks-05-14-linux.json`.

The fresh run usefully disagreed with older Prompt 003 evidence:

- this surface produced an apparently superlinear short scaling result at four threads;
- this surface's vectorized build was slightly faster, while Prompt 003's earlier surface reported vectorization but slower runtime.

Those disagreements strengthen the course doctrine: numeric answers are scoped evidence, not universal constants.

## Fallback / equity acceptance

The required path remains:

- zero-cost;
- CPU-only;
- no required paid AI;
- no premium CLI agent;
- no required GPU/cluster/private network;
- no hardware-purchasing advantage;
- equal grading ceiling through course-provided fallback evidence.

Concrete fallback evidence now exists for:

- Week 5 machine observation;
- Weeks 6/9 RISC-V source/disassembly/state;
- Week 8 dependency;
- Week 10 memory;
- Week 11 process-map/VM reasoning;
- Week 12 scaling;
- Week 12 communication;
- Week 13 vectorization/timing.

## Source/licensing acceptance

Prompt 002's mosaic remains intact:

1. primary/official truth;
2. humane teaching/reinforcement sources under their actual reuse posture;
3. course-owned explanations/experiences.

Week authoring did not reopen the textbook hunt or introduce a required commercial source. Current primary RISC-V, Linux, OpenMP, and LLVM surfaces were reverified during the authoring campaign.

## Assessment acceptance

`docs/grading-model.md` remains authoritative and unchanged.

- weights still total 100%;
- technical center remains 60% (30% investigation + 10% Explain/Defend + 20% checkpoints);
- checkpoints are only Weeks 6, 9, and 14;
- Friday receipts require interpretation, limitation, and revision rather than raw output;
- no due/late/drop/resubmission mechanics were invented;
- Week 16 does not become Checkpoint 4.

Operational Canvas mechanics remain a later grading/deployment pass.

## Instructor/recording acceptance

Every technical week includes `_instructor.md` with a recording spine and Stack Showcase connection.

Instructor-only premium/frontier/local hardware can be shown, but it never becomes a student requirement. Final recordings and actual real-machine inventories remain publication work rather than authoring blockers.

## Platform matrix

See `lab/PLATFORM_SUPPORT.md`.

### GREEN

- executed Linux Experimental Chamber;
- honest container-visible Observatory scope;
- required CPU-only lab path;
- fallbacks and plotting;
- final authored multi-figure PDF build.

### YELLOW / WAITING FOR PHYSICAL EXECUTION

- real Windows/WSL2;
- real macOS if advertised;
- Docker/Podman Containerfile image build;
- final instructor hardware/showcase capture.

Exact physical test commands live in `lab/PLATFORM_VALIDATION_RUNBOOK.md`.

## What YELLOW blocks

- WSL2 YELLOW blocks advertising WSL2 as fully GREEN and final Windows support signoff.
- macOS YELLOW blocks advertising native macOS as fully GREEN.
- Containerfile YELLOW blocks claiming a validated image/runtime workflow.
- recording/showcase YELLOW blocks final media publication, not technical authoring.

These do **not** require reopening Prompt 004 curriculum decisions unless real execution exposes a course-contract failure.

## Semester boundary acceptance

The Machine Dossier freezes at Week 14.

- Week 15: wind-down/curation/professional pathway only;
- Week 16: shared Farkle + ML experience, not an Architecture capstone;
- Week 17: reflection from frozen evidence only.

## Final completion test

A diligent student now receives enough course-produced evidence to answer:

> **What would you build now, and what evidence changed or strengthened your mind?**

The answer can be defended from a living technical record containing market/spec evidence, disassembly/state, datapath reasoning, dependency performance, memory plots, process/translation evidence, scaling/communication plots, specialization evidence, and explicit tradeoffs.

**Prompt 004 therefore passes as COMPLETE WITH NAMED PHYSICAL/RELEASE YELLOWS.**

## Next work

Do not reopen 004 merely to execute an already-described physical platform check. Add the resulting validation receipt and promote the relevant platform row.

The next numbered course-build workstream is Prompt 005 (shared Week 16 Farkle + ML), while Weeks 1-4, Week 17, grading operational mechanics, and later Savnac dogfood remain separate outstanding course-deployment work.
