# COMSC-3013 Computer Architecture — Fall 2026 Course Design

## Course promise

Computer Architecture should answer a question students have been carrying around since they first wrote code:

> **What is the machine actually doing underneath my program, and why was it built that way?**

The course treats a computer as a connected stack rather than a museum of isolated terms. Students move repeatedly between software intent, toolchain artifacts, an instruction set, processor implementation, memory, operating-system support, parallel hardware, and modern accelerators.

The official Fall 2026 section is online/asynchronous. Jeremy's Monday / Wednesday / Friday 2:00 PM cadence is an instructor planning and content-release rhythm, not an official meeting requirement.

## Design goals

By the end of the course, a successful student should be able to:

1. **Explain the abstraction stack** from a high-level program through machine instructions and the processor/memory system that executes them.
2. **Represent and reason about data quantitatively**, including binary/hex, signed integers, floating point, performance measurements, and basic logic/arithmetic structures.
3. **Read and trace a modern ISA**, with RISC-V as the planning-leading teaching ISA unless the final zyBooks adoption decision selects another supported path.
4. **Trace an instruction through a processor**, explaining datapath, control, pipelining, hazards, and basic performance consequences.
5. **Explain the memory hierarchy**, caches, virtual memory, protection, and the hardware mechanisms that support operating-system abstractions.
6. **Reason about parallel hardware**, including multicore/coherence/synchronization and why vector/GPU/accelerator architectures fit some workloads better than others.
7. **Inspect a real machine with evidence**, using Linux, compiler/toolchain output, debugging, profiling, simulators/emulators, and measured behavior.
8. **Use AI skeptically and productively**, treating models as investigation partners whose claims must be tested rather than as authorities.
9. **Reproduce a systems experiment** in a controlled environment and explain why reproducibility matters.
10. **Defend an architecture claim or tradeoff** with observations, measurements, diagrams, traces, or primary/reference evidence.

## Four-part semester arc

### Part I — Become capable of investigating a machine (Weeks 1–4)

The first month is deliberately not a miniature architecture textbook sprint.

- **Week 1 — Success Foundations:** survive the semester, thrive in the degree, enjoy the career. Universal human orientation; no architecture technical gate.
- **Week 2 — AI Lab Training:** learn the investigation/verification workflow used throughout the semester. AI can propose; evidence decides.
- **Week 3 — Containers & Repeatability:** establish a reproducible lab capsule/environment before later experiments depend on it.
- **Week 4 — Linux Command Line:** learn to ask the operating system and toolchain what the machine actually is and what it is doing.

By Week 5, students should already have a repeatable method for asking a machine a question, gathering evidence, and correcting a weak explanation.

### Part II — Understand the machine from bits to memory (Weeks 5–11)

- representation, logic, arithmetic;
- ISA and RISC-V;
- datapath and control;
- pipelining/hazards/performance;
- source-to-CPU integration;
- caches/memory hierarchy;
- virtual memory, protection, I/O, exceptions/interrupts, and OS support.

The recurring move is **predict → inspect/build → measure/trace → explain → revise**.

### Part III — Understand modern parallel machines (Weeks 12–14)

- multicore, coherence, synchronization and speedup;
- SIMD/vector/GPU execution and ML accelerators;
- real-world architecture tradeoffs including performance, power/energy, cost, programmability, security and workload fit.

Week 14 launches the capstone so students enter Thanksgiving with a question and measurement plan rather than a pile of new theory.

### Part IV — Synthesize and explain (Weeks 15–17)

- **Week 15:** lightweight asynchronous capstone preflight during Jeremy's Thanksgiving travel week.
- **Week 16:** Farkle + machine-learning architecture capstone. Students use a reproducible workload to gather evidence and connect multiple layers of the course.
- **Week 17:** reflection plus an evidence-backed demonstration that the student genuinely understands at least one meaningful piece of computer architecture.

## Weekly learning chassis

After the universal Week 1, the asynchronous course can use a stable M/W/F planning rhythm:

### Monday — Frame

- one central machine question;
- concise instructor framing;
- selected reference/reading menu;
- prediction or hypothesis before the student sees the answer.

### Wednesday — Inspect / Build / Measure

- runnable experiment, trace, simulator, shell investigation, or bounded build;
- explicit instructions for the supported lab environment;
- evidence captured in the student's investigation notebook.

### Friday — Explain / Defend

- short evidence-backed explanation, correction, show-and-tell, or synthesis artifact;
- when AI helped, the student distinguishes the model's suggestion from the evidence that validated or rejected it.

This rhythm is a course-design pattern, not synchronous attendance doctrine.

## The laboratory is the connective tissue

### AI investigation notebook

Beginning in Week 2, students should repeatedly record:

1. question/hypothesis;
2. context supplied to the AI/tool;
3. command/code/model/tool used;
4. observation/measurement;
5. evidence artifact;
6. conclusion;
7. revision after verification.

This gives the course a durable anti-hand-waving habit: explanations become stronger when students can point to what they actually observed.

### Reproducible lab capsule

Week 3 establishes the environment later labs reuse. The final implementation should be tested before publication, but the target capabilities include:

- compiler and binutils/toolchain;
- debugger;
- binary inspection/disassembly;
- timing/profiling;
- RISC-V compiler/assembler and simulator/emulator if the RISC-V plan is finalized;
- small course-owned scripts/data/examples.

The online course must provide a **CPU-only completion path**. GPUs and specialized hardware can be meaningful extensions, especially in Weeks 13 and 16, but successful course completion cannot depend on owning them.

### Linux as an observation instrument

The command line recurs because it exposes evidence about files, binaries, processes, CPU/memory, execution and the operating system. Commands are taught in service of machine questions, not as a memorization checklist.

## Content-source doctrine

### Curriculum first; zyBooks supports it

The operational Fall 2026 MIPS 6e zyBook remains truthfully recorded in `course_metadata.yaml` until a different product is actually adopted.

Jeremy's later planning direction is to **stay with zyBooks but not preserve MIPS merely for historical continuity**. RISC-V is currently the strongest pedagogical candidate because it has a modern open ISA specification and aligns with several current architecture courses.

The final zyBook product/edition and whether zyBooks activities are required/graded remain explicit questions. Once resolved, map the chosen sections onto the accepted week spine rather than rebuilding the spine around chapter order.

### Open-course benchmark set

Course authoring should actively mine strong sources for explanations, exercises, labs, diagrams and sequencing ideas, then rewrite/adapt legally and pedagogically for this course rather than copying blindly.

Primary benchmark set:

- UC Berkeley CS61C, 2026 — representation, RISC-V, translation, digital systems, CPU, pipelines, caches, performance, parallelism, virtual memory.
- Cornell CS3410, 2026 — C/RISC-V, CPU simulation, caches/processes/system calls, parallelism, Docker infrastructure.
- MIT 6.004 Computation Structures — logic/state through CPU, caches, VM/OS mechanisms, interrupts, pipelines and parallel systems.
- Nand2Tetris — modular build-the-machine experiences from logic/ALU through CPU/computer and software hierarchy.
- Cambridge Introduction to Computer Architecture — RISC-V, processor design, pipelines, caches, OS support, SoCs/DRAM, multicore/coherence, GPUs.
- RISC-V International specifications — primary reference for the ISA if adopted.

The benchmark is deliberately broader than Patterson/Hennessy. The textbook is important; it is not the whole course.

## Week 5–14 architecture map

| Week | Architecture focus | What students should be able to do |
|---|---|---|
| 5 | Representation, logic, arithmetic | Move between bits/hex/values, explain signed and floating-point limits, reason about Boolean/ALU building blocks. |
| 6 | ISA + RISC-V | Read/trace small assembly, explain registers/memory/control flow/calls, connect source to encoded instructions. |
| 7 | Datapath + control | Trace an instruction through a single-cycle processor and explain how control selects machine actions. |
| 8 | Pipelining + performance | Explain pipeline speedup and hazards, calculate/measure basic performance, reason about stalls/forwarding/control effects. |
| 9 | Source-to-CPU integration | Follow one bounded program through several layers of the stack and repair gaps in the explanation. |
| 10 | Memory hierarchy + caches | Explain locality/cache organization and connect hit/miss behavior to measured performance. |
| 11 | VM + OS support + I/O | Explain translation/protection and how exceptions/syscalls/interrupts/I/O connect hardware to OS abstractions. |
| 12 | Multicore + coherence | Reason about speedup, synchronization, false sharing and the need for coherence/consistency mechanisms. |
| 13 | Vector/GPU/accelerators | Match workload structure to architecture style and explain why throughput-oriented hardware differs from a general CPU. |
| 14 | Real architecture tradeoffs | Compare real machines and defend a design/workload choice using measurable constraints and tradeoffs. |

## Week 16 capstone design intent

The Farkle + ML capstone should feel like the entire course suddenly clicks into one workload.

A strong version lets students:

- run a provided, reproducible Farkle/ML workload;
- inspect what the code/toolchain produces;
- profile or measure CPU behavior and memory effects;
- optionally compare a GPU/accelerator path where available;
- connect at least several of: representation, ISA, datapath/pipeline, cache/memory, parallelism, GPU/accelerator behavior;
- make one architecture/performance claim;
- defend that claim with evidence rather than merely narrating output.

The capstone should be bounded enough to finish in Week 16 and flexible enough to succeed without specialized local hardware.

## Assessment philosophy pending a grading decision

The course should prefer **evidence of understanding** over invisible completion. That can be implemented through weekly evidence labs, explanations, zyBooks practice, a capstone and the Week 17 demonstration, but weights/points/due-date mechanics are not invented here.

The grading contract must be settled in `sidecar/questions/` and then promoted into durable course documentation before production deployment.

## Deployment readiness rule

A week is not ready because its title exists in a map.

A technical week is ready when it has:

- a clear central question and objectives;
- student-facing framing;
- selected references/readings;
- a tested activity in the supported environment;
- an explicit evidence artifact/submission;
- fallback/accessibility instructions;
- rubric/check criteria;
- validated links/tool commands;
- a clean path through Savnac when rendered.

Git remains the authoritative course source. Savnac is the dogfood and inspection surface. Production Canvas deployment comes only after the course can be inspected coherently and Jeremy has had a chance to walk through it.

## Open decisions

Do not let these block unrelated authoring, but do not guess them:

- exact zyBooks ISA/product/edition;
- zyBooks required/graded role;
- grading weights and due/late mechanics;
- final supported simulator/emulator/toolchain after prototype testing;
- exact Week 17 assessment format.
