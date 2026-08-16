# Sidecar Prompt 004 — Author Weeks 5–14 of the Computer Architecture core

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** research → dispatch bounded week work → author → execute labs → review → report

## Mission

Build the heart of COMSC-3013: ten coherent, evidence-driven weeks of Computer Architecture that are informed by excellent courses and primary references around the world, but shaped into one SWOSU course rather than a pile of borrowed topics.

This prompt owns **Weeks 5–14 only**. Do not hand the entire ten-week task to one worker. Foreman should dispatch bounded work, preferably one week per worker or another comparably small scope, then integrate and independently verify each result.

## Preconditions

Read before authoring:

- `AGENTS.md`
- `planning/fall-2026-spine.md`
- `planning/fall-2026-course-design.md`
- `sidecar/PLANNING.md`
- `sidecar/questions/*.md`
- `sidecar/reports/001_reconcile_course_source_chassis.md` when available
- `sidecar/reports/003_build_reproducible_architecture_lab.md` when available
- the current week-file schema established by Prompt 001

If Prompt 003 is not yet complete, research and prose planning may proceed, but do not claim a lab is ready until it has actually been executed in the supported environment.

## Benchmark sources

Use high-quality current/open sources and primary references as the research spine. At minimum consult the most relevant portions of:

- UC Berkeley CS61C, Spring/Summer 2026;
- Cornell CS3410, Spring 2026;
- MIT 6.004 Computation Structures;
- Nand2Tetris;
- University of Cambridge Introduction to Computer Architecture;
- RISC-V International ratified ISA specifications if RISC-V remains the course ISA;
- Patterson/Hennessy and the selected zyBooks product once Question 002 is resolved.

Additional strong sources are welcome when they improve a specific week: official architecture manuals, compiler/binutils documentation, OS/kernel documentation, accelerator documentation, academic teaching material, or reputable open textbooks.

Prefer primary and openly usable sources. Do not copy proprietary zyBooks prose, exercises, diagrams, or answer material into the repository. Synthesize, adapt legally, cite/link, and create our own student experiences.

## Accepted Week 5–14 spine

Do not reopen the semester sequence casually. Improve each week inside this accepted structure:

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

If Question 002 is unresolved, author against the planning-leading RISC-V path while keeping vendor-specific section mapping separate and reversible.

### Week 7 — Build a CPU: Datapath + Control

**Central question:** What path does one instruction take through a processor?

Target concepts:

- stored-program model;
- PC, register file, ALU, memory;
- muxes/control signals;
- instruction decode;
- single-cycle datapath/control;
- trace or bounded build of a small CPU.

Use Nand2Tetris/MIT/Berkeley/Cornell ideas as inspiration, but choose a scope appropriate for one week.

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

Students should take a bounded program and connect several layers:

source → compiler/toolchain artifact → assembly/instruction → machine representation → datapath/pipeline execution.

The primary purpose is diagnosis and revision of shaky mental models.

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

Students should reason across several tradeoffs:

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
2. **instructor/student framing**
   - concise explanation of why the week matters;
   - vocabulary/mental model without encyclopedic dumping.
3. **reference map**
   - sources actually used;
   - links/citations where appropriate;
   - zyBooks mapping if the final product has been chosen, otherwise a clearly marked placeholder.
4. **inspect/build/measure experience**
   - runnable trace/lab/build/simulator task;
   - exact supported-environment instructions;
   - expected evidence artifact;
   - failure/fallback guidance.
5. **explanation/defense checkpoint**
   - a bounded student artifact that forces them to interpret evidence rather than paste output.
6. **assessment criteria**
   - unweighted rubric/check criteria tied to the week's objectives;
   - no invented course points/weights.
7. **validation evidence**
   - run the lab/activity where executable;
   - record commands/results or a receipt;
   - links checked;
   - accessibility/fallback path reviewed.

## Authoring principles

### Teach one connected machine

Avoid the feeling that Week 5's binary, Week 6's ISA, Week 7's CPU, and Week 10's cache live in separate universes. Reuse small programs, traces, diagrams, and the same lab environment so students keep peeling back layers of one machine story.

### Evidence before eloquence

Whenever possible, students should be able to point to a trace, binary, timing, simulator state, `/proc` observation, disassembly, or measured workload behavior.

### AI is allowed to help, not to self-validate

Carry forward the Week 2 investigation doctrine. AI can help students generate hypotheses and explanations, but a model's answer is not evidence for itself.

### Bounded builds beat giant projects

Steal the spirit of Nand2Tetris and strong architecture labs without trying to compress an entire hardware-design course into COMSC-3013. A small ALU/datapath/CPU trace that students truly understand is worth more than a half-finished grand machine.

### Keep the online course humane

- no required specialized hardware;
- CPU-only route;
- clear setup checks;
- alternate observation data/traces when local hardware prevents a particular measurement;
- reasonable workload for a 3-credit course.

## Dispatch guidance

Foreman should create bounded worker tickets or branches. Recommended granularity:

- one worker/week for Weeks 5–14, or
- at most one tightly coupled pair, such as Weeks 7–8 or Weeks 10–11, when sharing implementation makes that objectively safer.

Do not let ten parallel workers invent ten incompatible lab formats. Prompt 001's week schema and Prompt 003's lab capsule are shared contracts.

Integrate sequentially where files overlap.

## Explicit non-goals

- no production Canvas writes;
- no zyBooks vendor mutation;
- no grading weights/point totals/late policy;
- no requirement that students own GPUs/FPGAs/Raspberry Pis;
- no wholesale copying of another university's assignments;
- no giant custom CPU simulator unless existing tools demonstrably cannot meet the course need.

## Required report

Write:

`sidecar/reports/004_author_weeks_05_14_architecture_core.md`

Include a readiness matrix for Weeks 5–14 showing:

- worker/commit;
- references used;
- lab/activity created;
- actual execution validation;
- evidence/checkpoint present;
- accessibility/fallback state;
- zyBooks mapping status;
- remaining YELLOWs.

Also list any reusable material that should be promoted to `swosu_cs_curriculum` or another shared repository rather than living Architecture-only.

## Foreman acceptance

Foreman independently samples and executes the work. A week is accepted only if:

1. the technical explanation is accurate;
2. the activity materially demonstrates the week's architecture idea;
3. the instructions work in the supported lab environment;
4. the student must interpret evidence rather than merely submit output;
5. the week fits the course arc and does not duplicate/reteach neighboring weeks badly;
6. sources are attributable and legally used;
7. unresolved grading/vendor decisions were not fabricated.

## Done when

Weeks 5–14 are no longer placeholders. Each is a coherent, research-backed, runnable, evidence-driven learning experience that connects to the semester laboratory and passes Foreman review.
