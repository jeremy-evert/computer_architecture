# Computer Architecture

Course repository for **COMSC-3013 - Computer Architecture**, Dr. Jeremy P. Evert's Fall 2026 section (`COMSC-3013-1438`).

The course is officially **online/asynchronous**. Jeremy designs and records it on a **Monday / Wednesday / Friday 2:00 PM working rhythm** for production discipline; that rhythm is not a Banner meeting time.

**Git is the source of truth.** Course Foundry / Imprint may compile this repository into Savnac or Canvas-facing objects, but the rendered LMS copy does not become the authoritative course source.

## Course identity in one sentence

Students spend Weeks 1-4 becoming capable investigators, then spend Weeks 5-14 repeatedly opening, measuring, stressing, and explaining one machine until architecture words such as latency, bandwidth, locality, throughput, scaling, and bottleneck have experimental meaning rather than textbook definitions.

Week 15 winds down asynchronously, Week 16 is the shared Farkle + Machine Learning experience, and Week 17 is reflection. Computer Architecture instruction **ends in Week 14**.

## The online M/W/F production rhythm

Architecture intentionally keeps the recognizable M/W/F family rhythm used across the Fall 2026 computing courses, but translates it for an asynchronous section:

- **Monday - Think / Frame / Lecture.** AI Fluency plus the week's central machine question and a course-owned lecture package. Jeremy records the deck and can visibly use his real AI/tool stack while reasoning through the material.
- **Wednesday - Investigate / Break / Measure.** Professional Minds plus the hands-on lab. Students make the machine behave differently and gather evidence.
- **Friday - Explain / Defend / Stack Showcase.** Professional Minds plus a short evidence receipt. Jeremy may record a real-stack demonstration showing where the week's ideas lead on his own systems.

The instructor stack may visibly include ChatGPT, Claude, Copilot, Gemini, Grok, Codex, Claude Code, aider, OpenClaw, local models, shell tools, profilers, debuggers, containers, and other current tools. **Visible instructor tooling is pedagogy, not a student requirement.** No student must purchase or reproduce Jeremy's stack to earn the same grade.

See [`planning/block-map.md`](planning/block-map.md) for the full 17-week M/W/F map.

## Fall 2026 course shape

1. **Week 1 - Success Foundations:** survive the semester, thrive in the degree, enjoy the career.
2. **Week 2 - AI Lab Training:** AI can propose; evidence decides.
3. **Week 3 - Containers & Repeatability:** build the reproducible laboratory.
4. **Week 4 - Linux as a Machine Telescope:** learn to ask the machine questions.
5. **Week 5 - Build the Machine:** PCPartPicker-style design, workload fit, compatibility, hierarchy, Dollars-Per, and the first Machine Dossier.
6. **Week 6 - Bits Become Instructions:** representation plus the RISC-V hardware/software contract; Checkpoint 1.
7. **Week 7 - Crack Open the CPU:** datapath and control.
8. **Week 8 - Make It Fast Without Breaking It:** pipeline, hazards, latency, throughput, CPI, and performance.
9. **Week 9 - Follow the Program Down:** integration Checkpoint 2.
10. **Week 10 - Make the Memory Hierarchy Hurt:** caches, locality, latency, bandwidth, and measured cliffs.
11. **Week 11 - The Useful Lie of Memory:** virtual memory, protection, I/O, traps, interrupts, and OS support.
12. **Week 12 - More Cores, More Problems:** scaling, synchronization, coherence, false sharing, and communication cost.
13. **Week 13 - Different Machines for Different Work:** vectors, GPUs, accelerators, data movement, and workload fit.
14. **Week 14 - Sit in the Architect's Chair:** redesign the Week 5 machine from evidence; freeze the Machine Dossier; Checkpoint 3.
15. **Week 15 - Async Wind-Down / Thanksgiving:** curate and catch up; no new architecture theory or dossier layer.
16. **Week 16 - Farkle + Machine Learning:** shared applied fun week; Architecture may echo naturally but this is not Checkpoint 4.
17. **Week 17 - Reflection:** no new technical content; use the frozen dossier as evidence of what changed.

## The persistent Architecture artifact

Weeks 5-14 revolve around a living **Machine Dossier** with two complementary views:

1. **Machine Map:** what the machine has, what it costs, what its pieces do, and what constraints/interfaces connect them.
2. **Sensitivity Profile:** what happens when latency, bandwidth, working-set size, synchronization, worker count, data movement, or another architectural constraint changes.

The dossier begins with a student-designed machine and an observable machine, then accumulates measurements, plots, explanations, corrections, and design decisions through Week 14.

The dossier is intended to compile into a clean technical PDF using a scaffolded LaTeX workflow and course-provided Python/matplotlib plotting helpers. Students are not expected to become LaTeX or data-visualization specialists; those tools exist to make experimental evidence legible.

See [`planning/machine-dossier.md`](planning/machine-dossier.md).

## Laboratory doctrine

The course follows a strong sensory rule:

> **Do not ask students to use an important architecture adjective until the course has tried to make them experience the phenomenon it names.**

Examples:

- latency versus bandwidth;
- cache-friendly versus cache-hostile access;
- sequential versus random storage behavior;
- dependent versus independent work;
- scalable versus synchronization-bound parallel work;
- general-purpose versus specialized execution;
- setup/data-movement cost versus steady-state throughput.

The recurring experimental move is:

**predict -> perturb one constraint -> run -> measure -> visualize -> explain -> revise.**

Python/matplotlib is the standard visualization instrument. LaTeX is the report/publishing instrument. Linux, compilers, debuggers, disassemblers, profilers, simulators/emulators, and course scripts are observation instruments.

### Common laboratory substrate

The accepted substrate now lives in [`lab/`](lab/README.md).

It deliberately separates:

- **The Observatory:** inspect the machine/environment actually visible and label evidence scope honestly.
- **The Experimental Chamber:** use one reproducible command/receipt/plot/report contract for controlled experiments.

Stable interfaces are recorded in [`lab/CONTRACT.md`](lab/CONTRACT.md). The substrate currently includes bounded RISC-V execution, dependency/performance, memory, OpenMP scaling, controlled communication-delay, CPU vectorization/specialization specimens, matplotlib plotting, a LaTeX/PDF dossier scaffold, fallback evidence datasets, and an end-to-end health/smoke path.

The executed Linux substrate passed end to end. WSL2, container-image, and optional macOS support remain explicit YELLOWs until they are actually run. See [`sidecar/reports/003_build_reproducible_architecture_lab.md`](sidecar/reports/003_build_reproducible_architecture_lab.md).

## Planning grammar shared with CS1/CS2/DSCT

Computer Architecture intentionally preserves the recognizable family pattern without pretending an asynchronous course has live pair programming or show-and-tell:

- [`planning/fall-2026-course-design.md`](planning/fall-2026-course-design.md) - course promise, outcomes, doctrine, and semester design.
- [`planning/architecture-arc-map.md`](planning/architecture-arc-map.md) - why neighboring weeks belong together and where checkpoints close.
- [`planning/block-map.md`](planning/block-map.md) - full 17-week M/W/F production target map, including AI Fluency and Professional Minds.
- [`planning/machine-dossier.md`](planning/machine-dossier.md) - persistent artifact, sensory-lab, plotting, and reporting contract.
- [`planning/open-source-resource-canon.md`](planning/open-source-resource-canon.md) - accepted truth/teaching/reference source strategy.
- `planning/week-01.md` through `planning/week-17-finals.md` - thin per-week planning shells that future passes can deepen honestly.
- [`docs/grading-model.md`](docs/grading-model.md) - Architecture adaptation of the CS1 grading family.

## Required-materials doctrine

**The required course path should cost students $0 beyond ordinary access to a computer and university/course infrastructure.**

Students can complete every required learning activity using:

- openly available course readings and references;
- open-source or freely available development/simulation tools;
- the course's reproducible lab environment;
- a no-cost/accessible AI path when AI is expected;
- a CPU-only path for every required experiment.

Commercial textbooks, zyBooks, paid AI subscriptions, premium agents, and specialized GPU hardware may be useful optional accelerators or references. They are not prerequisites and may not raise the attainable grading ceiling.

## Textbooks, zyBooks, and the teaching ISA

No commercial textbook or zyBook is required for Fall 2026. Patterson/Hennessy and historical zyBooks material can remain instructor/reference provenance.

**RISC-V remains the planning-leading teaching ISA** because it fits the accepted course spine, has an open specification, and has strong contemporary teaching/tooling support. That choice is independent of any commercial textbook.

## Current readiness

The semester structure is now intentionally frozen enough for focused week authoring:

- the M/W/F online recording/delivery model is defined;
- AI Fluency and Professional Minds are mapped across the semester;
- the Machine Dossier and sensory-lab doctrine are defined;
- Weeks 5-14 are the complete technical Architecture runway;
- Week 14, not Week 16, is the technical finale;
- the Architecture grading structure is established, with due/late operational mechanics still to finalize;
- the open-source/free canon and licensing/source-use doctrine are established;
- the common Architecture laboratory substrate exists and has passed its executed Linux end-to-end smoke path;
- week files remain planning shells rather than fake-complete lessons;
- WSL2/container/macOS deployment validation, full Week 5-14 lecture/deck/lab authoring, grading operations, and Savnac rendering still need to be completed.

**Prompt 004 is now unblocked:** Weeks 5-14 can be authored against a real source canon and a real common laboratory contract instead of imagined infrastructure.

Active work is organized in [`sidecar/PLANNING.md`](sidecar/PLANNING.md) and [`sidecar/prompts/`](sidecar/prompts/).
