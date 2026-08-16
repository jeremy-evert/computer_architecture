# Computer Architecture — Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Repository:** `jeremy-evert/computer_architecture`  
**Status:** active deployment planning  
**Source of truth:** Git. Savnac is the inspection/dogfood surface; production Canvas is a later deployment target.

This file is the project-local workbench for getting the course from a thin planning spine to a high-quality, inspectable, deployable Fall 2026 course. Durable course decisions belong outside `sidecar/`; agent work orders, unresolved questions, and execution reports belong inside it.

## Mission

Build a Computer Architecture course that helps students understand a computer as a connected stack rather than as a vocabulary list:

**human intent → programs → compiler/toolchain → ISA → datapath/control → memory → operating-system support → parallel hardware → modern accelerators and systems.**

Students should leave able to inspect a real machine, explain what they observe, test a claim with evidence, and defend at least one meaningful architecture tradeoff.

The course should borrow aggressively from the best openly available architecture teaching in the world while remaining coherent, humane, reproducible, and appropriate for SWOSU students.

## Pinned Fall 2026 decisions

These are planning constraints, not suggestions.

1. **Official modality remains online/asynchronous.** Jeremy's M/W/F 2:00 PM rhythm is a planning cadence, not a Banner meeting time.
2. **Week 1 is universal human orientation**, matching CS1/CS2/DSCT:
   - Monday: **Survive the semester** — get the most out of the class and semester.
   - Wednesday: **Thrive in the degree** — degree plan, progress, resources, choices.
   - Friday: **Enjoy the career** — career habits, resume/CV/GitHub/LinkedIn/internships and building a life worth aiming at.
   - No Computer Architecture technical content is required in Week 1.
3. **Week 2 is AI Lab Training.** Students learn how to use AI as a systems-investigation partner without treating generated claims as evidence. The previously established Professional Minds Week 2 pair, *Make It Stick* and *Mindset*, can remain as brief cross-course touchpoints without stealing the week's technical center.
4. **Week 3 is Containers and Repeatability.** The course establishes a reproducible lab capsule/environment that can travel across machines.
5. **Week 4 is Linux Command Line Introduction.** Students learn the shell as an instrument for observing the machine, not as a detached sysadmin unit.
6. **Weeks 5–14 are the Computer Architecture core.** They should be built from strong open courses, primary references, Patterson/Hennessy, and real-machine experiments rather than simply marching chapter-by-chapter through one textbook.
7. **Week 15 is Thanksgiving/travel and intentionally asynchronous/lightweight.** No fragile instructor-dependent activity and no large new conceptual load.
8. **Week 16 is Machine Learning + Farkle with a Computer Architecture capstone feel.** The goal is synthesis: a workload, measurements, architecture reasoning, reproducibility, and a defensible explanation.
9. **Week 17 is reflection and demonstration.** Students explain what they learned, what mattered, what challenged/rewarded them, and show that they genuinely understand something about computer architecture.
10. **Stay with zyBooks for Computer Architecture**, but do not treat the currently recorded MIPS 6e product as pedagogically sacred. Jeremy previously said MIPS itself is not important and wants to stay with zyBooks; a RISC-V path emerged as the leading direction. Exact product/edition and grading role remain separate decisions in `sidecar/questions/`.

## What the repository already gets right

- Durable official-vs-working-cadence separation already exists in `course_metadata.yaml`.
- A 17-week planning spine and course-design document already exist.
- The sidecar convention already exists and correctly separates course truth from workbench/process truth.
- The repo correctly treats Git as source of truth and Savnac/Canvas as generated inspection/deployment surfaces.
- The current course design already values Linux/WSL, Git, binary inspection, debugging, containers, measured evidence, and AI verification.

## What needs to change

The existing semester spine is still largely a six-chapter textbook distribution. That no longer matches the pinned course shape above. The new design should be **curriculum-first**:

- Weeks 1–4 build the human and laboratory operating system for the semester.
- Weeks 5–14 cover the architecture concepts students most need.
- zyBooks becomes one content/practice layer mapped onto that spine after the final ISA/product choice.
- Every architecture week should make the machine observable through a trace, experiment, measurement, diagram, simulator, compiler artifact, or other piece of evidence.

## Research-informed architecture backbone

The following open/current curricula strongly support the backbone we want:

- **UC Berkeley CS61C, Spring/Summer 2026 — Great Ideas in Computer Architecture**: number representation, C/memory, RISC-V, compiler/assembler/linker/loader, synchronous digital systems, single-cycle CPU, pipelining, caches, performance, parallelism, and virtual memory.  
  <https://cs61c.org/sp26/>  
  <https://cs61c.org/su26/>
- **Cornell CS3410, Spring 2026 — Computer System Organization and Programming**: C, 64-bit RISC-V, CPU simulation, caches, processes/system calls, parallelism, and a Docker-based reproducible course environment.  
  <https://www.cs.cornell.edu/courses/cs3410/2026sp/>  
  <https://www.cs.cornell.edu/courses/cs3410/2026sp/course/infra.html>
- **MIT 6.004 Computation Structures**: logic, state, finite-state machines, ISA, CPU implementation, caches, virtual memory, OS mechanisms, interrupts, pipelining, and parallel processing, with a build-the-machine ethos.  
  <https://ocw.mit.edu/courses/6-004-computation-structures-spring-2017/>
- **Nand2Tetris**: free/open project sequence from Boolean logic and arithmetic through machine language, CPU/computer construction, assembler, VM, compiler, and OS. It is especially valuable as a source of bounded build/trace experiences.  
  <https://www.nand2tetris.org/course>
- **University of Cambridge — Introduction to Computer Architecture**: RISC-V, processor design, pipelining, caches, OS support, SoCs/DRAM, multicore/coherence, GPUs, and future directions.  
  <https://www.cst.cam.ac.uk/teaching/2425/IntComArch>
- **RISC-V International ratified specifications**: primary-source ISA reference for any RISC-V teaching path.  
  <https://docs.riscv.org/reference/home/index.html>

The point is not to clone any one course. The point is that very different strong courses keep converging on the same conceptual spine. We should use that convergence as evidence.

## Proposed 17-week curriculum spine

| Week | Dates | Theme | Student-facing central question | Evidence / lab shape |
|---|---|---|---|---|
| 1 | Aug 17–21 | **Success Foundations** | How do I survive this semester, thrive in this degree, and enjoy the career I am building toward? | Human orientation artifacts only; no architecture technical gate. |
| 2 | Aug 24–28 | **AI Lab Training** | How can AI help me investigate a machine without becoming my source of truth? | AI-assisted observation + verification notebook; compare model claims against commands/docs/measurements. |
| 3 | Aug 31–Sep 4 | **Containers & Repeatability** | How do I make a systems experiment run the same way twice and on another computer? | Launch/build the semester lab capsule; record environment; reproduce a small experiment. |
| 4 | Sep 8–11 | **Linux Command Line as a Machine Telescope** | How do I ask the operating system what this computer actually is and what it is doing? | Shell scavenger hunt using files/processes/system/hardware/binary inspection; short Labor Day week. |
| 5 | Sep 14–18 | **Bits Become Meaning: Representation, Logic, Arithmetic** | How can the same bits become numbers, instructions, and decisions? | Binary/two's-complement/IEEE-754 experiments; Boolean logic and a small ALU/build trace. |
| 6 | Sep 21–25 | **The Hardware/Software Contract: ISA + RISC-V** | What must software and hardware agree on for a program to run? | Compile/disassemble/step small RISC-V examples; registers, memory, control flow, calling convention, encoding. |
| 7 | Sep 28–Oct 2 | **Build a CPU: Datapath + Control** | What physical path does one instruction take through a processor? | Trace or build a small single-cycle CPU/datapath; connect logic to instruction execution. |
| 8 | Oct 5–9 | **Pipelining, Hazards, and Performance** | Why is doing several things at once faster and harder? | Pipeline trace; hazards/forwarding/stalls; CPI/latency/throughput experiment; branch prediction as extension. |
| 9 | Oct 12–14 | **Integration Checkpoint: From Source to CPU** | Can I follow one small program through the stack without hand-waving? | Short Fall Break week; source → assembly → instruction → datapath/pipeline evidence narrative. No major new theory. |
| 10 | Oct 19–23 | **Memory Hierarchy + Caches** | Why can memory be both huge and fast only by pretending? | Locality/cache experiment; cache mapping and miss analysis; measured timing where practical. |
| 11 | Oct 26–30 | **Virtual Memory, Protection, I/O, and OS Support** | What hardware does an operating system need in order to safely create the world my process sees? | Inspect process address space/page behavior; exceptions/syscalls/interrupts/I/O trace; connect abstraction to hardware support. |
| 12 | Nov 2–6 | **Multicore, Coherence, Synchronization** | What breaks when several cores can touch the same world at once? | Small parallel experiment; speedup/Amdahl reasoning; false sharing/coherence/synchronization case trace. |
| 13 | Nov 9–13 | **Vectors, GPUs, and ML Accelerators** | Why do some workloads want a different kind of machine? | Compare scalar/SIMD/GPU or accelerator execution; inspect workload shape and bottlenecks; CPU-only path required, GPU extension optional. |
| 14 | Nov 16–20 | **Architectures in the Wild: Tradeoffs and Capstone Launch** | If every design is a compromise, how do I defend one architecture choice with evidence? | Compare real CPUs/SoCs/GPUs/accelerators; performance/power/energy/cost/security/future directions; capstone proposal and measurement plan. |
| 15 | Nov 23–27 | **Asynchronous Capstone Preflight / Thanksgiving** | What evidence do I already have, and what do I still need before I make a claim? | Lightweight, self-contained preflight; no major new concept and no instructor-dependent live event. |
| 16 | Nov 30–Dec 4 | **Farkle + Machine Learning Architecture Capstone** | What does a real workload reveal about the machine underneath it? | Reproducible Farkle/ML workload; profile/measure/inspect; connect results to ISA/CPU/memory/parallelism/accelerator ideas; defend a design or performance claim. |
| 17 | Dec 7–11 | **Reflection + Show Me You Understand a Machine** | What do I understand now that I could not explain in August? | Reflection plus evidence-backed demonstration/explanation of at least one architecture concept or tradeoff. |

## Weekly course chassis after Week 1

The M/W/F cadence can stay useful even though the course is asynchronous:

- **Monday — Frame the machine question.** Short instructor framing + reading/reference menu + prediction/hypothesis.
- **Wednesday — Inspect/build/measure.** The week's lab, trace, simulator, command-line experiment, or design exercise.
- **Friday — Explain/defend.** Evidence-backed explanation, revision, show-and-tell, or small synthesis checkpoint.

This is a planning/release rhythm, not a synchronous attendance requirement.

## Semester laboratory doctrine

The laboratory experience should compound rather than reset every week.

### AI Lab Notebook

From Week 2 forward, students keep a compact investigation record:

1. question/hypothesis;
2. context supplied to AI/tool;
3. command/code/model/tool used;
4. observation or measurement;
5. evidence artifact;
6. conclusion;
7. what changed after verification.

AI can suggest commands, explanations, hypotheses, and debugging paths. It cannot serve as the evidence that its own claim is correct.

### Reproducible Lab Capsule

Week 3 should establish a versioned containerized environment that later labs can reuse. The environment should aim to contain, once the final toolchain is chosen:

- compiler/binutils;
- debugger;
- binary inspection tools;
- profiling/timing tools;
- RISC-V assembler/compiler/emulator or simulator path;
- lightweight scripts/data used by course labs.

The student experience must have a CPU-only path. GPU hardware can enrich later work but cannot be required for successful completion of the online course.

### Linux as evidence, not trivia

Week 4 should teach the shell by asking architecture questions. Candidate commands/tools include `pwd`, `ls`, `cd`, `cat`, `less`, `grep`, `find`, pipes/redirection, `file`, `xxd`/`od`, `uname`, `lscpu`, `free`, `df`, `ps`, `top`, `/proc`, compiler output, and `objdump`/equivalent. Exact supported commands should be validated on the chosen lab image before publication.

## ZyBooks direction

Current `course_metadata.yaml` records the operational Fall 2026 MIPS 6e zyBook. That should remain truthful until a replacement is actually adopted.

The **planning direction**, based on Jeremy's prior course-development decisions, is:

- keep zyBooks in Computer Architecture;
- do not preserve MIPS merely because the current course record points to it;
- prefer a modern teaching ISA, with RISC-V currently the strongest candidate because it aligns with current Berkeley/Cornell/Cambridge teaching and has an open primary specification;
- map zyBook sections to the curriculum **after** the week spine is accepted, rather than letting the book dictate the week order.

See `sidecar/questions/002_zybooks_isa_product_and_course_role.md` once created.

## Workstreams

### A. Reconcile durable course source

- [ ] Rewrite the Fall 2026 spine around the pinned Week 1–17 shape.
- [ ] Rewrite the durable course-design rationale and learning outcomes.
- [ ] Remove stale claims that the semester is driven by MIPS chapter order.
- [ ] Keep official metadata factual until an actual zyBooks product change is made.

### B. Build the student lab platform

- [ ] Inventory candidate RISC-V and machine-inspection tools.
- [ ] Build/prototype the containerized lab capsule.
- [ ] Verify Windows + WSL2, Linux, macOS, and remote/fallback paths where feasible.
- [ ] Produce a small smoke test that proves the environment can compile, run, disassemble, debug, and measure a representative program.
- [ ] Make setup failure visible and diagnosable before Week 5.

### C. Author Weeks 1–4

- [ ] Source Week 1 from the shared universal kickoff materials rather than cloning divergent copies.
- [ ] Author AI Lab Training and its verification notebook pattern.
- [ ] Author Containers & Repeatability as a student experience, not merely installation instructions.
- [ ] Author the Linux CLI introduction around evidence-gathering tasks.

### D. Author Weeks 5–14

For each week:

- [ ] central question;
- [ ] learning objectives;
- [ ] concise instructor framing;
- [ ] open/reference readings;
- [ ] zyBook mapping if/when product is settled;
- [ ] runnable/buildable inspect activity;
- [ ] evidence artifact;
- [ ] accessibility/fallback path;
- [ ] rubric/check criteria;
- [ ] verification that the lab runs in the supported environment.

### E. Build Week 16 capstone + Week 17 reflection

- [ ] Define the Farkle/ML workload and what architecture evidence students collect.
- [ ] Guarantee a CPU-only completion path.
- [ ] Make GPU/accelerator comparison an extension where hardware exists.
- [ ] Require reproducibility through the Week 3 lab capsule.
- [ ] Require students to connect observations back to multiple course layers.
- [ ] Build Week 17 reflection/demonstration so it measures understanding rather than nostalgia.

### F. Build assessment/grading contract

- [ ] Decide zyBooks required/graded role.
- [ ] Decide weekly evidence/lab grading shape.
- [ ] Decide capstone weight/role.
- [ ] Decide Week 17 assessment form.
- [ ] Author rubrics before full Canvas publication.

### G. Savnac / deployment

- [ ] Reuse Course Foundry / Imprint rather than creating a one-off deployment system.
- [ ] Compile current Git source into desired course state.
- [ ] Imprint into the existing Computer Architecture Savnac course after verifying its identity.
- [ ] Read the rendered course back and test professor/student navigation.
- [ ] Check immediate re-run/idempotence behavior.
- [ ] Keep production SWOSU Canvas writes out of scope until explicitly authorized.

## Foreman queue

Project-local work orders should live under `sidecar/prompts/` and return reports under `sidecar/reports/`.

Recommended sequence:

1. **Source chassis reconciliation** — turn this plan into durable week/course source without inventing unresolved grading/product choices.
2. **Reproducible lab platform** — research, prototype, smoke-test, and document the semester lab capsule.
3. **Weeks 5–14 curriculum build** — research-backed week files, labs, references, and acceptance checks.
4. **Farkle/ML capstone build** — create and validate the synthesis experience.
5. **Savnac imprint/read-back** — render the current source into Savnac only after enough source exists to be useful to inspect.

## Deployment gates

### Gate 0 — Truth

- official course facts accurate;
- pinned week structure represented in Git;
- unresolved decisions explicitly recorded rather than guessed.

### Gate 1 — Lab works

- a clean supported machine can execute the lab smoke test;
- instructions survive a fresh start;
- no secrets/manual professor-only steps are embedded in student setup.

### Gate 2 — Weeks are real

A week is not green because a title exists. It is green when its framing, references, activity, evidence, instructions, and validation all exist.

### Gate 3 — Savnac dogfood

- course compiles from Git;
- Savnac renders it coherently;
- professor/student path works;
- no duplicate/stale objects appear on immediate re-run.

### Gate 4 — Production readiness

Only after Jeremy has dogfooded the course in Savnac should the project prepare a bounded production Canvas deployment plan.

## Open questions

Do not block work that can proceed honestly. Record only decisions that actually need Jeremy.

Expected question files:

- zyBooks ISA/product and required/graded course role;
- grading/assessment contract;
- any lab execution/fallback decision that remains after the Foreman prototypes the best technical default.

## Planning principle

**Build the laboratory first, then teach students to see through it, then teach the machine.**

By Week 5, students should already have the habits and tools to ask a machine a question and gather evidence. From there the architecture course can keep returning to the same satisfying move: peel back one more layer, measure what is really there, and explain why it was designed that way.
