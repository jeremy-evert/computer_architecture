# Computer Architecture - Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Repository:** `jeremy-evert/computer_architecture`  
**Status:** active build; Prompts 001-002 complete; Prompt 003 not started  
**Source of truth:** Git. Savnac is the inspection/dogfood surface; production Canvas is a later deployment target.

## Mission

Build an online Computer Architecture course that helps students understand a computer as a connected, measurable system rather than a vocabulary list.

The course movement is:

**build the investigator -> build the machine -> open the machine -> stress the machine -> make the architecture decision -> wind down and reflect**

## Pinned Fall 2026 decisions

1. Official modality is online/asynchronous.
2. Jeremy's M/W/F 2 PM rhythm is production/release cadence, not attendance.
3. **Monday:** AI Fluency + lecture/digest/deck + instructor recording.
4. **Wednesday:** Professional Minds + investigation/sensory lab.
5. **Friday:** Professional Minds + Explain/Defend evidence + optional instructor Stack Showcase.
6. Jeremy may visibly use his full real stack in recordings. Student reproduction of that paid/frontier/local stack is not required.
7. Week 1 = universal Success Foundations; no Architecture gate.
8. Week 2 = AI Lab Training.
9. Week 3 = Containers & Repeatability.
10. Week 4 = Linux as a Machine Telescope.
11. **Weeks 5-14 are the entire Architecture technical runway.**
12. Machine Dossier begins Week 5 and freezes Week 14.
13. Sensory-lab doctrine: **predict -> perturb -> run -> measure -> visualize -> explain -> revise.**
14. Python/matplotlib is the planned visualization instrument.
15. LaTeX/PDF is the planned dossier publishing instrument, scaffolded rather than taught as a side course.
16. Checkpoints = Weeks 6, 9, 14.
17. Week 14 is the technical finale and final Machine Dossier defense.
18. Week 15 = Thanksgiving asynchronous wind-down; no new Architecture theory/dossier layer.
19. Week 16 = shared Farkle + ML application/fun; not Checkpoint 4 or a hidden Architecture capstone.
20. Week 17 = reflection; no new technical material.
21. No required commercial textbook/zyBooks.
22. No required paid AI.
23. No required premium AI CLI/agent.
24. No specialized GPU requirement; CPU-only path.
25. RISC-V is planning-leading.
26. Grading structure is accepted in `docs/grading-model.md`; due/late/drop mechanics still need operational closure.

## Durable planning sources

Read these before authoring:

- `README.md`
- `planning/fall-2026-course-design.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/fall-2026-spine.md`
- `planning/open-source-resource-canon.md`
- `planning/open-source-resource-map.csv`
- `planning/week-NN.md`
- `docs/grading-model.md`
- `sidecar/reports/001_reconcile_course_source_chassis.md`
- `sidecar/reports/002_build_open_source_architecture_canon.md`

The week files are thin planning shells. Do not confuse named intentions with authored/validated lessons.

## Accepted 17-week curriculum

| Week | Theme | Central question / role |
|---|---|---|
| 1 | Success Foundations | How do I survive, thrive, and enjoy the path? No Architecture gate. |
| 2 | AI Lab Training | How can AI help investigate without becoming evidence? |
| 3 | Containers & Repeatability | How can another machine/person reproduce the experiment? |
| 4 | Linux as a Machine Telescope | How do I ask the machine what it is doing? |
| 5 | Build the Machine | What should I build for this workload and why? Machine Dossier v0. |
| 6 | Bits Become Instructions | What must software/hardware agree on? Checkpoint 1. |
| 7 | Crack Open the CPU | What has to happen for one instruction to execute? |
| 8 | Make It Fast Without Breaking It | Why do overlap/dependencies change latency/throughput? |
| 9 | Follow the Program Down | Can I connect the layers without hand-waving? Checkpoint 2. |
| 10 | Make the Memory Hierarchy Hurt | What do latency, bandwidth, locality, and cache cliffs feel like? |
| 11 | The Useful Lie of Memory | What hardware mechanisms create software-visible memory/process abstractions? |
| 12 | More Cores, More Problems | When does cooperation/communication destroy scaling? |
| 13 | Different Machines for Different Work | When does workload shape justify specialization? |
| 14 | Sit in the Architect's Chair | What would I build now, and what evidence changed my mind? Checkpoint 3; freeze dossier. |
| 15 | Thanksgiving Wind-Down | Curate/catch up only. |
| 16 | Farkle + ML | Shared applied fun; Architecture echo only. |
| 17 | Reflection | What can I explain now that I could not explain in August? |

## Machine Dossier doctrine

See `planning/machine-dossier.md`.

The dossier has:

- **Machine Map:** parts, capabilities, interfaces, cost, hierarchy, workload.
- **Sensitivity Profile:** measured response to changed latency, bandwidth, working set, synchronization, worker count, data movement, and specialization.

It is active only during Weeks 5-14.

## Instructor recording doctrine

Architecture's online modality creates room for a deliberate three-artifact rhythm instead of fake live-class substitutions.

### Monday lecture package

Target artifacts:

- concise digest/source;
- deck;
- lecture plan;
- recorded walkthrough;
- AI Fluency integration.

Jeremy can have real AI tools visible while reasoning. Model disagreement and verification can become part of the lesson.

### Wednesday lab package

Target artifacts:

- lab handout/source;
- canonical instructor run;
- data receipt;
- plotting scaffold;
- troubleshooting/fallback.

### Friday Stack Showcase

Target artifacts:

- short instructor showcase plan;
- authentic machine/tool/workflow;
- explicit connection back to the week's concept;
- student Explain/Defend receipt.

The showcase should be fun and real. It should not become required access to Jeremy's environment.

## Workstreams

### A. Reconcile durable source - **COMPLETE**

- [x] CS-family planning chassis established.
- [x] Machine Dossier/sensory-lab doctrine captured.
- [x] M/W/F online recording model captured.
- [x] Week 14 technical ending / Week 15-17 wind-down captured.
- [x] grading structure captured.
- [x] Prompt 001 reconciliation/validation pass completed; report in `sidecar/reports/001_reconcile_course_source_chassis.md`.

### B. Build open-source Architecture canon - **COMPLETE**

- [x] Research every week/topic.
- [x] Check accessibility/licensing and distinguish public access from reuse permission.
- [x] Build GREEN/YELLOW/RED map.
- [x] Identify course-created bridges needed.
- [x] Pair conceptual + measurement sources for sensory labs.
- [x] Establish dated Week 5/14 current PC/component pricing/spec evidence strategy.
- [x] Record source burden, strengths, limitations, permanence risk, and lab support in `planning/open-source-resource-map.csv`.

### C. Build student laboratory - **READY / NOT STARTED**

- [ ] Reproducible container/runtime.
- [ ] compiler/binutils/debugger/RISC-V path.
- [ ] `archprobe` or equivalent structured machine snapshot.
- [ ] common experiment runner/data format.
- [ ] Python/matplotlib plot helpers.
- [ ] LaTeX/PDF dossier build.
- [ ] memory sensory experiment capability.
- [ ] multicore/communication-latency experiment capability.
- [ ] Windows/WSL2/Linux/macOS/fallback validation as feasible.
- [ ] health/smoke test.

Prompt 003 is intentionally **not started** merely because Prompt 002 is complete.

### D. Author Weeks 1-4

- [ ] shared Week 1;
- [ ] AI Lab;
- [ ] repeatability lab;
- [ ] Linux observation lab;
- [ ] keep Architecture content out of Week 1.

### E. Author Weeks 5-14

For each week:

- [ ] AI Fluency integration;
- [ ] lecture digest;
- [ ] deck;
- [ ] recording plan;
- [ ] Professional Minds integration;
- [ ] open/reference map;
- [ ] runnable sensory/inspect/build/measure lab;
- [ ] data/plot scaffold where useful;
- [ ] Machine Dossier handoff;
- [ ] Explain/Defend receipt;
- [ ] Stack Showcase plan;
- [ ] rubric/check criteria;
- [ ] fallback/accessibility;
- [ ] execution validation.

### F. Build Week 16 + Week 17

- [ ] reuse shared Farkle + ML assets;
- [ ] CPU-only humane Week 16;
- [ ] Architecture echo only, no Checkpoint 4;
- [ ] Week 17 evidence-backed reflection using frozen dossier;
- [ ] no new technical theory after Week 14.

### G. Operationalize grading

- [x] weights/categories/checkpoint cadence accepted.
- [ ] due/late policy.
- [ ] drop-lowest mechanics.
- [ ] revision/resubmission mechanics.
- [ ] Canvas assignment groups/object mapping.
- [ ] institutional dead-days/calendar check.

### H. Savnac / deployment

- [ ] reuse Course Foundry / Imprint;
- [ ] compile current Git source;
- [ ] imprint only source-ready objects;
- [ ] read back professor/student navigation;
- [ ] verify grading groups when implemented;
- [ ] verify idempotence;
- [ ] production Canvas remains out of scope until explicitly authorized.

## Queue

1. **COMPLETE - Prompt 001: reconcile/validate current chassis**
2. **COMPLETE - Prompt 002: build open-source Architecture canon**
3. **READY / NOT STARTED - Prompt 003: build reproducible Architecture laboratory**
4. **WAITING ON 003 - Prompt 004: author Weeks 5-14 technical core**
5. **LATER - Prompt 005: shared Farkle + ML Week 16 experience**
6. **LATER - Prompt 006: imprint/read back in Savnac**

## Deployment gates

### Gate 0 - Truth - **PASS**

One current story in Git; legacy reports marked historical; no stale Week 16 capstone or paid-resource doctrine in current source.

### Gate 1 - Open content sufficiency - **PASS AT AUTHORING-CANON LEVEL**

Every required week has a credible no-paywall source strategy, explicit course-owned bridges, and honest access/reuse classification. Individual links still require week-level validation at publication time.

### Gate 2 - Lab works - **NOT STARTED**

Fresh supported machine can inspect, measure, emit data, plot, and build a minimal dossier PDF.

### Gate 3 - Weeks are real

Week is green only when lecture/deck, lab, evidence, references, fallback, and validation exist.

### Gate 4 - Savnac dogfood

Rendered course matches Git and is navigable without duplicate/stale objects.

### Gate 5 - Production readiness

Only after Jeremy dogfoods Savnac and grading mechanics are fully operationalized.

## Planning principle

**Build the scientist. Build the machine. Make the machine argue with the model. Plot the argument. Explain the smoke. Then make the architecture decision.**
