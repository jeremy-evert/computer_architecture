# Sidecar Prompt 004 — Author Weeks 5–14 of the Computer Architecture core

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** research → dispatch bounded week work → author → execute labs → review → report

## Mission

Build the heart of COMSC-3013: ten coherent, evidence-driven weeks of Computer Architecture informed by excellent open courses, primary references, open-source tools, and the best technical material available, shaped into one SWOSU course rather than a pile of borrowed topics.

**The required student path must be complete without a commercial textbook, zyBooks, a paid AI subscription, a premium AI CLI agent, or specialized GPU hardware.**

This prompt owns **Weeks 5–14 only**. Do not hand the entire ten-week task to one worker. Foreman should dispatch bounded work, preferably one week per worker or another comparably small scope, then integrate and independently verify each result.

## Preconditions

Read before authoring:

- `AGENTS.md`
- `planning/fall-2026-spine.md`
- `planning/fall-2026-course-design.md`
- `sidecar/PLANNING.md`
- `sidecar/questions/*.md`
- `sidecar/reports/001_reconcile_course_source_chassis.md` when available
- `sidecar/reports/002_build_open_source_architecture_canon.md` when available
- `sidecar/reports/003_build_reproducible_architecture_lab.md` when available
- the current week-file schema established by Prompt 001

Prompt 002's canon and Prompt 003's lab platform are shared contracts. If either is not yet complete, research/prose planning may proceed, but do not claim a source path or executable lab is ready until it has actually been checked.

## Source doctrine

Use high-quality **open/freely accessible sources and primary references** as the student-facing research spine.

At minimum consider the relevant portions of:

- UC Berkeley CS61C;
- Cornell CS3410;
- MIT 6.004 Computation Structures;
- Nand2Tetris;
- University of Cambridge Computer Architecture materials;
- RISC-V International ratified ISA specifications;
- official compiler/binutils/GDB documentation;
- official simulator/emulator documentation;
- primary OS/kernel/system documentation when pedagogically appropriate.

Prompt 002 should expand this set substantially.

Commercial books such as Patterson/Hennessy may be consulted by course authors for coverage checks, instructor understanding, or optional reference suggestions. Do **not** copy proprietary prose, exercises, diagrams, answer material, or create a student dependency on them.

When open material is too fragmented or dense, author the missing explanation/scaffold in this repository. The course itself should become the coherent learning surface.

## Accepted Week 5–14 spine

### Week 5 — Bits Become Meaning: Representation, Logic, Arithmetic

**Central question:** How can the same bits become numbers, instructions, and decisions?

Coverage should include the most useful subset of:

- binary and hexadecimal;
- unsigned/signed integers and two's complement;
- overflow;
- floating-point representation and approximation;
- Boolean logic;
- combinational structures / ALU-level reasoning.

The student should manipulate and observe real representations, not only solve conversion worksheets.

### Week 6 — The Hardware/Software Contract: ISA + RISC-V

**Central question:** What must software and hardware agree on for a program to run?

Target concepts:

- registers and memory;
- instruction formats/encodings;
- arithmetic/data movement/control flow;
- procedures and calling convention;
- source → assembly → machine-code relationship;
- assembler/linker/loader/compiler boundaries where useful.

Author against the RISC-V teaching path unless later technical evidence demonstrates a better open path. Vendor-specific textbook mapping is not part of this course contract.

### Week 7 — Build a CPU: Datapath + Control

**Central question:** What path does one instruction take through a processor?

Target concepts:

- stored-program model;
- PC, register file, ALU, memory;
- muxes/control signals;
- instruction decode;
- single-cycle datapath/control;
- trace or bounded build of a small CPU.

Use the spirit of Nand2Tetris/MIT/Berkeley/Cornell where helpful, but create a scope appropriate for one week.

### Week 8 — Pipelining, Hazards, and Performance

**Central question:** Why is doing several things at once faster and harder?

Target concepts:

- latency vs throughput;
- CPI and basic performance equations;
- pipeline stages;
- structural/data/control hazards;
- forwarding, stalls, flushing;
- branch effects;
- branch prediction/superscalar concepts only when they sharpen rather than crowd the week.

Students should trace timing and connect the trace to a performance claim.

### Week 9 — Integration Checkpoint: From Source to CPU

**Central question:** Can I follow one small program through the stack without hand-waving?

This is a short Fall Break week. Introduce little or no major new theory.

Students should take a bounded course-owned program and connect:

source → compiler/toolchain artifact → assembly/instruction → machine representation → datapath/pipeline execution.

The purpose is diagnosis and revision of shaky mental models.

### Week 10 — Memory Hierarchy + Caches

**Central question:** Why can memory be both huge and fast only by using layers?

Target concepts:

- temporal/spatial locality;
- cache blocks/lines;
- mapping/associativity/replacement at an appropriate level;
- hits/misses;
- basic AMAT/performance reasoning;
- measured locality/cache behavior where practical.

### Week 11 — Virtual Memory, Protection, I/O, and OS Support

**Central question:** What hardware does an operating system need to create the world a process sees?

Target concepts:

- virtual vs physical addresses;
- page tables/TLB at an introductory level;
- protection/privilege;
- traps/exceptions/syscalls;
- interrupts;
- basic memory-mapped or device I/O ideas;
- how these mechanisms support process abstractions.

Avoid turning the week into a full operating-systems course.

### Week 12 — Multicore, Coherence, Synchronization

**Central question:** What breaks when several cores can touch the same world at once?

Target concepts:

- thread/data parallelism;
- speedup and Amdahl's Law;
- shared memory;
- cache coherence;
- false sharing;
- synchronization;
- introductory memory-order/consistency ideas only as needed to explain observed behavior.

Include a small repeatable parallel experiment if the lab environment supports it.

### Week 13 — Vectors, GPUs, and ML Accelerators

**Central question:** Why do some workloads want a different kind of machine?

Target concepts:

- SIMD/vector processing;
- throughput vs latency orientation;
- GPU/SIMT concepts;
- memory/bandwidth considerations;
- accelerator specialization;
- matrix/tensor/ML workload shape;
- tradeoffs versus general-purpose CPU execution.

**CPU-only completion path is mandatory.** GPU access may produce an extension/comparison, not a gate.

### Week 14 — Architectures in the Wild: Tradeoffs + Capstone Launch

**Central question:** If every design is a compromise, how do I defend one architecture choice with evidence?

Use real contemporary architectures/SoCs/CPUs/GPUs/accelerators as evidence cases.

Students should reason across:

- performance;
- power/energy;
- cost;
- memory/bandwidth;
- programmability;
- specialization;
- security/reliability where appropriate;
- workload fit.

Launch Week 16's capstone here with a bounded question, hypothesis, and measurement plan.

## Required week artifact contract

Each authored technical week must contain enough source for a student-facing course, not merely professor notes.

At minimum produce or update:

1. **week plan**
   - dates/status;
   - central question;
   - learning objectives;
   - M/W/F asynchronous rhythm;
   - dependencies.
2. **course-owned framing**
   - concise explanation of why the week matters;
   - enough mental model/vocabulary that a commercial textbook is not required.
3. **open/reference map**
   - sources actually used;
   - links/citations;
   - access/license notes where relevant;
   - clear distinction between student-facing source and instructor-only background reference.
4. **inspect/build/measure experience**
   - runnable trace/lab/build/simulator task;
   - exact supported-environment instructions;
   - expected evidence artifact;
   - failure/fallback guidance.
5. **explanation/defense checkpoint**
   - bounded student artifact forcing interpretation of evidence rather than pasted output.
6. **assessment criteria**
   - unweighted rubric/check criteria tied to objectives;
   - no invented course points/weights.
7. **validation evidence**
   - run executable labs;
   - record commands/results or receipt;
   - check links;
   - review accessibility/fallback path.

## Authoring principles

### Teach one connected machine

Reuse small programs, traces, diagrams, and the same lab environment so students keep peeling back layers of one machine story.

### Evidence before eloquence

Whenever possible, students should point to a trace, binary, timing, simulator state, `/proc` observation, disassembly, or measured workload behavior.

### AI is allowed to help, not to self-validate

Carry forward Week 2 doctrine. AI can help generate hypotheses and explanations, but a model's answer is not evidence for itself.

No particular AI provider is required. No premium subscription or command-line agent is required. A worker authoring a lab must ensure the required path works without paid AI features.

### Bounded builds beat giant projects

Use the build-the-machine spirit without compressing an entire hardware-design degree into COMSC-3013. A small ALU/datapath/CPU experience students truly understand is worth more than a half-finished grand machine.

### Keep the online course humane

- no required commercial content;
- no required paid AI/CLI;
- no required specialized hardware;
- CPU-only route;
- clear setup checks;
- alternate observation data/traces when local hardware prevents a measurement;
- reasonable workload for a 3-credit course.

## Dispatch guidance

Foreman should create bounded worker tickets or branches. Recommended granularity:

- one worker/week for Weeks 5–14, or
- at most one tightly coupled pair when shared implementation makes that objectively safer.

Do not let ten workers invent ten incompatible lab formats. Prompt 001's week schema, Prompt 002's open canon, and Prompt 003's lab capsule are shared contracts.

## Explicit non-goals

- no production Canvas writes;
- no zyBooks/vendor mutation;
- no grading weights/point totals/late policy;
- no requirement that students own GPUs/FPGAs/Raspberry Pis;
- no requirement that students buy AI/CLI access;
- no wholesale copying of another university's assignments;
- no giant custom CPU simulator unless existing open tools demonstrably cannot meet the course need.

## Required report

Write:

`sidecar/reports/004_author_weeks_05_14_architecture_core.md`

Include a readiness matrix for Weeks 5–14 showing:

- worker/commit;
- open/student-facing references used;
- course-created content added;
- lab/activity created;
- actual execution validation;
- evidence/checkpoint present;
- accessibility/fallback state;
- remaining YELLOWs/REDs from the open canon;
- confirmation no paid-resource dependency was introduced.

Also list reusable material that should be promoted to `swosu_cs_curriculum` or another shared repository.

## Foreman acceptance

Foreman independently samples and executes the work. A week is accepted only if:

1. the technical explanation is accurate;
2. a student can learn the required content without a commercial textbook;
3. the activity materially demonstrates the week's architecture idea;
4. instructions work in the supported lab environment;
5. the student interprets evidence rather than merely submitting output;
6. the week fits the course arc;
7. sources are attributable and legally used;
8. no paid AI/CLI or specialized hardware dependency exists;
9. unresolved grading decisions were not fabricated.

## Done when

Weeks 5–14 are coherent, research-backed, runnable, evidence-driven learning experiences that stand on an open/zero-cost required path and pass Foreman review.
