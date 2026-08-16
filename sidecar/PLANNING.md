# Computer Architecture — Deployment Planning Board

**Course:** COMSC-3013 Computer Architecture, Fall 2026  
**Repository:** `jeremy-evert/computer_architecture`  
**Status:** active deployment planning  
**Source of truth:** Git. Savnac is the inspection/dogfood surface; production Canvas is a later deployment target.

This file is the project-local workbench for getting the course from planning to a high-quality, inspectable, deployable Fall 2026 course. Durable course decisions belong outside `sidecar/`; agent work orders, unresolved questions, and execution reports belong inside it.

## Mission

Build a Computer Architecture course that helps students understand a computer as a connected stack rather than as a vocabulary list:

**human intent → programs → compiler/toolchain → ISA → datapath/control → memory → operating-system support → parallel hardware → modern accelerators and systems.**

Students should leave able to inspect a real machine, explain what they observe, test a claim with evidence, and defend at least one meaningful architecture tradeoff.

The course should aggressively mine the best open/freely accessible Computer Architecture teaching in the world and then synthesize it into one coherent SWOSU experience.

## Pinned Fall 2026 decisions

These are planning constraints, not suggestions.

1. **Official modality remains online/asynchronous.** Jeremy's M/W/F 2:00 PM rhythm is a planning cadence, not a Banner meeting time.
2. **Week 1 is universal human orientation**, matching CS1/CS2/DSCT:
   - Monday: **Survive the semester**.
   - Wednesday: **Thrive in the degree**.
   - Friday: **Enjoy the career**.
   - No Computer Architecture technical content is required in Week 1.
3. **Week 2 is AI Lab Training.** Students learn how to use AI as a systems-investigation partner without treating generated claims as evidence.
4. **Week 3 is Containers & Repeatability.** The course establishes a reproducible lab capsule/environment that can travel across machines.
5. **Week 4 is Linux Command Line Introduction.** Students learn the shell as an instrument for observing the machine, not as a detached sysadmin unit.
6. **Weeks 5–14 are the Computer Architecture core.** They are built from strong open courses, primary references, open tools, course-created materials, and real-machine experiments.
7. **Week 15 is Thanksgiving/travel and intentionally asynchronous/lightweight.**
8. **Week 16 is Machine Learning + Farkle with a Computer Architecture capstone feel.**
9. **Week 17 is reflection and demonstration.** Students explain what they learned and show genuine Computer Architecture understanding.
10. **No commercial textbook or zyBooks purchase is required.** Books and zyBooks may guide course authors and remain optional student references.
11. **No paid AI subscription is required.**
12. **No premium AI command-line agent is required.** Codex, Claude Code, and similar tools may be demonstrated and supported as optional advanced workflows only.
13. **The free/accessible required path has the same grading ceiling as any premium-tool path.**
14. **No specialized GPU hardware is required.** CPU-only completion is mandatory; GPU/accelerator access is optional enrichment.
15. **RISC-V is the planning-leading teaching ISA**, based on pedagogical fit, open specifications, and tooling rather than commercial-textbook availability.

## Required-materials doctrine

The ideal required student-material cost for this course is **$0** beyond normal computer/university access.

The course should be complete using:

- openly accessible readings and primary references;
- course-created explanation and scaffolding;
- open-source/free compilers, debuggers, simulators/emulators, and system tools;
- the reproducible lab capsule;
- a no-cost or otherwise course-accessible AI path where AI is expected.

A commercial resource is allowed to improve the instructor's understanding. It is not allowed to become a hidden student dependency.

A premium AI tool is allowed to make a workflow slicker. It is not allowed to become a prerequisite or an assessment advantage.

## Accepted 17-week curriculum

| Week | Theme | Student-facing central question |
|---|---|---|
| 1 | **Success Foundations** | How do I survive this semester, thrive in this degree, and enjoy the career I am building toward? |
| 2 | **AI Lab Training** | How can AI help me investigate a machine without becoming my source of truth? |
| 3 | **Containers & Repeatability** | How do I make a systems experiment run the same way twice and on another computer? |
| 4 | **Linux Command Line as a Machine Telescope** | How do I ask the operating system what this computer is and what it is doing? |
| 5 | **Bits Become Meaning: Representation, Logic, Arithmetic** | How can the same bits become numbers, instructions, and decisions? |
| 6 | **The Hardware/Software Contract: ISA + RISC-V** | What must software and hardware agree on for a program to run? |
| 7 | **Build a CPU: Datapath + Control** | What physical path does one instruction take through a processor? |
| 8 | **Pipelining, Hazards, and Performance** | Why is doing several things at once faster and harder? |
| 9 | **Integration Checkpoint: From Source to CPU** | Can I follow one small program through the stack without hand-waving? |
| 10 | **Memory Hierarchy + Caches** | Why can memory be both huge and fast only by using layers? |
| 11 | **Virtual Memory, Protection, I/O, and OS Support** | What hardware does an operating system need to create the world my process sees? |
| 12 | **Multicore, Coherence, Synchronization** | What breaks when several cores can touch the same world at once? |
| 13 | **Vectors, GPUs, and ML Accelerators** | Why do some workloads want a different kind of machine? |
| 14 | **Architectures in the Wild: Tradeoffs + Capstone Launch** | If every design is a compromise, how do I defend one architecture choice with evidence? |
| 15 | **Asynchronous Capstone Preflight / Thanksgiving** | What evidence do I have, and what do I still need before I make a claim? |
| 16 | **Farkle + Machine Learning Architecture Capstone** | What does a real workload reveal about the machine underneath it? |
| 17 | **Reflection + Show Me You Understand a Machine** | What do I understand now that I could not explain in August? |

## Weekly chassis after Week 1

- **Monday — Frame:** machine question, concise course-created framing, open/reference menu, prediction/hypothesis.
- **Wednesday — Inspect / Build / Measure:** lab, trace, simulator, shell experiment, or bounded build.
- **Friday — Explain / Defend:** evidence-backed explanation, correction, show-and-tell, or synthesis checkpoint.

The M/W/F pattern is a planning/release rhythm for an asynchronous course, not an attendance rule.

## Research-informed architecture backbone

The starting research set includes:

- UC Berkeley CS61C;
- Cornell CS3410;
- MIT 6.004 Computation Structures;
- Nand2Tetris;
- University of Cambridge Computer Architecture materials;
- RISC-V International specifications;
- official compiler/binutils/debugger documentation;
- official simulator/emulator and OS documentation where useful.

Foreman Prompt 002 owns the broader search and should build a **week-by-week open-source canon**, not merely reuse this initial shortlist.

Commercial books such as Patterson/Hennessy may still be consulted by instructors. They are reference material, not curriculum infrastructure.

## Semester laboratory doctrine

### AI Investigation Notebook

From Week 2 forward, students repeatedly record:

1. question/hypothesis;
2. context supplied to AI/tool;
3. command/code/model/tool used;
4. observation/measurement;
5. evidence artifact;
6. conclusion;
7. what changed after verification.

AI can suggest commands, explanations, hypotheses, and debugging paths. It cannot serve as the evidence that its own claim is correct.

The notebook is provider-neutral. No paid plan or CLI agent is required.

### Reproducible Lab Capsule

Week 3 establishes a versioned environment reused later. Candidate capabilities include:

- compiler/binutils;
- debugger;
- binary inspection;
- profiling/timing;
- RISC-V compiler/assembler;
- emulator/simulator;
- lightweight course scripts/data.

The environment must support a CPU-only path.

### Linux as evidence, not trivia

Week 4 teaches the shell through architecture questions. Exact commands must be validated on the selected lab environment before publication.

## Open-source course-authoring strategy

For every required concept, decide deliberately which of three shapes is best:

### GREEN — Link directly

An excellent, stable, accessible open source already teaches the concept well enough for our students.

### YELLOW — Link + course scaffold

The open material is technically strong but fragmented, dense, or assumes background our students may not have. Create a short course-owned bridge, guide, example, or diagram around it.

### RED — Author it ourselves

The available material does not fit. Build the explanation/lab/trace ourselves, backed by primary references and expert sources.

A RED is productive information. It tells us where the course itself needs to become the textbook.

## Workstreams

### A. Reconcile durable course source

- [ ] Establish week-file chassis.
- [ ] Make the zero-cost/open-source doctrine visible everywhere source consumers need it.
- [ ] Preserve historical commercial-resource provenance without presenting it as required.

### B. Build the open-source Architecture canon

- [ ] Research every week/topic broadly.
- [ ] Check accessibility and licensing/reuse status.
- [ ] Build GREEN/YELLOW/RED map.
- [ ] Identify course-created explanations/diagrams/labs needed.
- [ ] Hand clean source recommendations to week authors.

### C. Build the student lab platform

- [ ] Inventory candidate RISC-V and machine-inspection tools.
- [ ] Build/prototype the containerized lab capsule.
- [ ] Verify Windows + WSL2, Linux, macOS, and fallback paths where feasible.
- [ ] Produce a small smoke test that proves compile/run/disassemble/debug/measure.
- [ ] Make setup failure visible and diagnosable before Week 5.

### D. Author Weeks 1–4

- [ ] Source Week 1 from shared universal kickoff materials.
- [ ] Author provider-neutral AI Lab Training.
- [ ] Author Containers & Repeatability as a learning experience.
- [ ] Author Linux CLI around evidence-gathering tasks.

### E. Author Weeks 5–14

For each week:

- [ ] central question;
- [ ] learning objectives;
- [ ] course-created framing sufficient without a textbook;
- [ ] open/reference readings;
- [ ] runnable/buildable inspect activity;
- [ ] evidence artifact;
- [ ] accessibility/fallback path;
- [ ] rubric/check criteria;
- [ ] execution validation.

### F. Build Week 16 capstone + Week 17 reflection

- [ ] Define the Farkle/ML workload.
- [ ] Guarantee CPU-only completion.
- [ ] Make GPU comparison optional.
- [ ] Make premium AI/CLI use optional.
- [ ] Require reproducibility through the Week 3 lab capsule.
- [ ] Require multi-layer architecture reasoning.
- [ ] Build Week 17 demonstration/reflection.

### G. Build assessment/grading contract

- [ ] Decide weekly evidence/lab grading shape.
- [ ] Decide capstone weight/role.
- [ ] Decide Week 17 assessment form.
- [ ] Decide due/late policy.
- [ ] Confirm free-tool students can attain the same grading ceiling.

### H. Savnac / deployment

- [ ] Reuse Course Foundry / Imprint.
- [ ] Compile current Git source into desired course state.
- [ ] Imprint into existing Architecture Savnac course after identity verification.
- [ ] Read rendered course back and test professor/student navigation.
- [ ] Check immediate re-run/idempotence behavior.
- [ ] Keep production SWOSU Canvas writes out of scope until explicitly authorized.

## Foreman queue

Project-local work orders live under `sidecar/prompts/` and return reports under `sidecar/reports/`.

Recommended sequence:

1. **Prompt 001 — Source chassis reconciliation**
2. **Prompt 002 — Build open-source Architecture canon**
3. **Prompt 003 — Build reproducible lab platform**
4. **Prompt 004 — Author Weeks 5–14 Architecture core**
5. **Prompt 005 — Build Farkle/ML capstone**
6. **Prompt 006 — Imprint/read back in Savnac**

Prompts 002 and 003 can proceed in parallel after the chassis is understood. Prompt 004 should consume their accepted outputs.

## Deployment gates

### Gate 0 — Truth

- official course facts accurate;
- pinned week structure represented in Git;
- zero-cost required-materials policy represented explicitly;
- unresolved policy recorded rather than guessed.

### Gate 1 — Open content sufficiency

Every required week has a credible no-paywall learning path. Missing content is explicitly queued for course authoring.

### Gate 2 — Lab works

A clean supported machine can execute the lab smoke test without secrets, paid CLI tooling, or specialized student hardware.

### Gate 3 — Weeks are real

A week is green only when framing, open references, activity, evidence instructions, criteria, and validation exist.

### Gate 4 — Savnac dogfood

- course compiles from Git;
- Savnac renders it coherently;
- professor/student path works;
- no duplicate/stale objects appear on immediate re-run.

### Gate 5 — Production readiness

Only after Jeremy has dogfooded the course in Savnac should the project prepare a bounded production Canvas deployment plan.

## Open questions

The remaining genuine Jeremy question is primarily the assessment/grading contract in `sidecar/questions/003_assessment_and_grading_contract.md`.

Do **not** reopen:

- textbook purchase requirement;
- zyBooks requirement;
- paid AI requirement;
- paid AI CLI requirement;
- specialized GPU requirement.

Those have been decided: **none are required.**

## Planning principle

**Build the laboratory, build the open canon, teach students to see through both, then peel the machine apart one layer at a time.**

By Week 5, students should be able to ask a machine a question and gather evidence. From there the course keeps returning to the same satisfying move: peel back one more layer, measure what is really there, and explain why it was designed that way.
