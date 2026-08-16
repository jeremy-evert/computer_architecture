# Computer Architecture — Fall 2026 17-Week Planning Spine

**Status: accepted semester spine; weekly content is still being authored.**

This document is the durable semester map for COMSC-3013 Fall 2026. It records what each week is for without pretending that every lesson, lab, rubric, due date, or Canvas object already exists.

The official course is online/asynchronous. Jeremy uses a Monday / Wednesday / Friday 2:00 PM rhythm for planning and content cadence only; it is not an official Banner meeting time. See `course_metadata.yaml`.

## Calendar

Fall 2026 runs Aug 17–Dec 11.

- Labor Day: Monday Sep 7 — no Monday work in Week 4.
- Fall Break begins Wednesday Oct 14 at 10 PM — no Friday work in Week 9.
- Thanksgiving begins Tuesday Nov 24 at 10 PM — Week 15 is intentionally lightweight/asynchronous.
- Finals: Dec 7–11 — Week 17.

## Design rules

The semester is **curriculum-first, not textbook-chapter-first**.

No commercial textbook or zyBooks purchase is required. The required content path must be complete using open/freely accessible references and course-created materials. Commercial texts may guide instructors or serve as optional references.

Likewise, no paid AI subscription or premium command-line agent is required. Students may use their AI provider/interface of choice where AI is permitted. Required AI-supported activities must have a no-cost or otherwise course-accessible path; Codex, Claude Code, and similar premium CLI tools are optional enrichment.

## Fall 2026 spine

| Week | Dates | Theme | Central question | Status / intent |
|---|---|---|---|---|
| 1 | Aug 17–21 | **Success Foundations** | How do I survive this semester, thrive in this degree, and enjoy the career I am building toward? | **Pinned.** Universal Week 1 shared with CS1/CS2/DSCT. Monday = semester/class success; Wednesday = degree success; Friday = career success. No Computer Architecture technical content required. |
| 2 | Aug 24–28 | **AI Lab Training** | How can AI help me investigate a machine without becoming my source of truth? | **Pinned.** Build the habits used all semester: gather context, ask useful questions, label AI/tool use, verify generated claims against commands/documentation/measurements, and keep an evidence notebook. No paid provider or CLI agent is required. |
| 3 | Aug 31–Sep 4 | **Containers & Repeatability** | How do I make a systems experiment run the same way twice and on another computer? | **Pinned.** Establish the semester's reproducible lab capsule. Students should run/reproduce a small experiment and understand why environment capture matters. |
| 4 | Sep 8–11 | **Linux Command Line as a Machine Telescope** | How do I ask the operating system what this computer is and what it is doing? | **Pinned.** Short Labor Day week. Shell/files/process/system/hardware/binary inspection as evidence gathering, not disconnected command memorization. |
| 5 | Sep 14–18 | **Bits Become Meaning: Representation, Logic, Arithmetic** | How can the same bits become numbers, instructions, and decisions? | Core. Binary/hex, signed representation, floating point, Boolean logic, combinational building blocks, ALU-level reasoning. Prefer a bounded build/trace experiment over worksheet-only coverage. |
| 6 | Sep 21–25 | **The Hardware/Software Contract: ISA + RISC-V** | What must software and hardware agree on for a program to run? | Core. Registers, memory, instructions, encodings, control flow, procedures/calling convention, source→assembly→machine translation. RISC-V is the planning-leading ISA because of its open specification and strong teaching/tool ecosystem, not because of a textbook dependency. |
| 7 | Sep 28–Oct 2 | **Build a CPU: Datapath + Control** | What path does one instruction take through a processor? | Core. Datapath, ALU/register file/memory/control, single-cycle implementation, stored-program/Von Neumann connection. Trace or build a small CPU rather than merely label a diagram. |
| 8 | Oct 5–9 | **Pipelining, Hazards, and Performance** | Why is doing several things at once faster and harder? | Core. Latency/throughput/CPI, pipeline stages, structural/data/control hazards, forwarding/stalls; branch prediction/superscalar ideas may be enrichment. |
| 9 | Oct 12–14 | **Integration Checkpoint: Source to CPU** | Can I follow one small program through the stack without hand-waving? | **Short Fall Break week.** No major new conceptual load. Student traces a bounded program from source/assembly through instructions and processor execution, revising weak explanations with evidence. |
| 10 | Oct 19–23 | **Memory Hierarchy + Caches** | Why can memory be both huge and fast only by using layers? | Core. Locality, cache mapping/associativity, hits/misses, AMAT/performance tradeoffs, measured locality experiment where practical. |
| 11 | Oct 26–30 | **Virtual Memory, Protection, I/O, and OS Support** | What hardware does an operating system need to create the world a process sees? | Core. Address translation, protection, exceptions/traps/syscalls, interrupts and basic I/O; connect process abstractions to hardware mechanisms. |
| 12 | Nov 2–6 | **Multicore, Coherence, Synchronization** | What breaks when several cores can touch the same world at once? | Core. Thread/data parallelism, Amdahl's Law, coherence, false sharing, synchronization and introductory memory-consistency reasoning. |
| 13 | Nov 9–13 | **Vectors, GPUs, and ML Accelerators** | Why do some workloads want a different kind of machine? | Core/modern systems. SIMD/vector ideas, GPU execution, throughput architecture, accelerator tradeoffs, relationship between ML workload shape and hardware. CPU-only completion path is required; GPU is enrichment, not a prerequisite. |
| 14 | Nov 16–20 | **Architectures in the Wild: Tradeoffs + Capstone Launch** | If every design is a compromise, how do I defend one architecture choice with evidence? | Synthesis. Compare real CPUs/SoCs/GPUs/accelerators using performance, power/energy, cost, programmability, security and workload fit. Launch Week 16 capstone with a measurement plan. |
| 15 | Nov 23–27 | **Asynchronous Capstone Preflight / Thanksgiving** | What evidence do I already have, and what do I still need before I make a claim? | **Pinned travel/Thanksgiving week.** Lightweight and self-contained. No major new theory, fragile live event, or instructor-dependent workflow. Work should prepare, not punish, the Week 16 capstone. |
| 16 | Nov 30–Dec 4 | **Farkle + Machine Learning Architecture Capstone** | What does a real workload reveal about the machine underneath it? | **Pinned.** Use a reproducible Farkle/ML workload to profile/measure/inspect and connect observations to multiple course layers: representation/ISA/CPU/memory/parallelism/accelerators. Students defend a design/performance claim with evidence. CPU-only completion path required; GPU comparison optional. |
| 17 | Dec 7–11 | **Reflection + Show Me You Understand a Machine** | What do I understand now that I could not explain in August? | **Pinned finals experience.** Reflection on learning/challenge/reward plus evidence-backed demonstration or explanation proving genuine understanding of at least one architecture concept/tradeoff. Exact assessment form remains a grading-design decision. |

## Recurring weekly rhythm after Week 1

Because the course is asynchronous, the M/W/F rhythm is a release/design pattern rather than an attendance rule:

- **Monday — Frame:** central machine question, concise instructor framing, open/reference reading menu, prediction or hypothesis.
- **Wednesday — Inspect / Build / Measure:** lab, trace, simulator, shell experiment, or design exercise.
- **Friday — Explain / Defend:** evidence-backed explanation, correction, show-and-tell, or synthesis checkpoint.

Every technical week should give students something observable. An AI answer, textbook paragraph, or lecture statement is not evidence by itself.

## Laboratory through-line

### Week 2 onward — AI investigation notebook

Students should repeatedly record:

1. question/hypothesis;
2. context and AI/tool use;
3. command/code/tool/model;
4. observation/measurement;
5. evidence artifact;
6. conclusion;
7. correction/revision after verification.

The notebook format is provider-neutral. Premium AI or command-line agents may be used optionally, but the course must not create a paid-tool advantage in required assessment.

### Week 3 onward — reproducible lab capsule

Later course tooling should run inside or cleanly alongside a versioned reproducible environment. Candidate capabilities include compiler/binutils, debugger, binary inspection, timing/profiling, and the final RISC-V simulator/toolchain path. Exact tools are validated before publication rather than guessed here.

### Week 4 onward — Linux as an observation layer

The shell recurs because it exposes machine state: files, binaries, processes, CPU/memory information, `/proc`, timing, disassembly and other evidence. Students should use it to answer architecture questions rather than memorize command trivia.

## Open curriculum evidence behind Weeks 5–14

The topic sequence is deliberately informed by strong open/current architecture curricula and primary references rather than invented in isolation:

- UC Berkeley CS61C: representation, C/memory, RISC-V, toolchain translation, digital systems, single-cycle CPU, pipelining, caches, performance, parallelism, virtual memory.
- Cornell CS3410: C, 64-bit RISC-V, CPU simulation, caches, processes/system calls, parallelism, reproducible Docker infrastructure.
- MIT 6.004 Computation Structures: logic/state, ISA, processor construction, memory hierarchy, VM/OS mechanisms, interrupts, pipelines and parallel systems.
- Nand2Tetris: bounded build-the-machine projects from logic/ALU through CPU/computer and the software hierarchy.
- Cambridge Introduction to Computer Architecture: RISC-V, processor design, pipelines, caches, OS support, SoCs/DRAM, multicore/coherence and GPUs.
- RISC-V International specifications: primary ISA reference.

Foreman should expand this into a week-by-week open-source/reference canon with licensing and accessibility checked. Commercial books may be consulted by course authors but are not required student sources.

## Explicitly still open

Do not fabricate these while authoring content:

- grading weights/point model and late/due-date mechanics;
- final supported simulator/emulator/toolchain after lab-platform testing;
- exact Week 17 assessment format.

These are no longer open:

- required commercial textbook/zyBooks: **none**;
- required paid AI subscription: **none**;
- required paid AI CLI agent: **none**;
- required specialized GPU hardware: **none**.
