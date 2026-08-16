# Sidecar Prompt 002 — Build the open-source Computer Architecture canon

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** research → licensing/access check → week mapping → gap analysis → report

## Mission

Assemble the best open/freely accessible source set we can find for COMSC-3013 so the course can teach its entire required curriculum **without a commercial textbook or zyBooks dependency**.

This is not a link-dump exercise. Build a deliberately curated canon that tells later week authors:

- what students can read/watch/use for free;
- which source is strongest for each concept;
- what license/access constraints apply;
- what we should create ourselves because the available open material is weak, fragmented, inaccessible, or pedagogically wrong for this course.

The output should make it realistic for the course itself to become the textbook.

## Read first

- `course_metadata.yaml`
- `README.md`
- `planning/fall-2026-spine.md`
- `planning/fall-2026-course-design.md`
- `sidecar/PLANNING.md`
- `sidecar/questions/001_zybooks_decision_for_architecture.md`
- `sidecar/questions/002_zybooks_isa_product_and_course_role.md`
- current week-source chassis after Prompt 001 lands

## Pinned doctrine

Do not reopen these decisions:

- no required commercial textbook;
- no required zyBooks purchase;
- no required paid AI subscription;
- no required Codex, Claude Code, or premium command-line agent;
- students using the free/accessible path must be able to complete the same required work and earn the same grade;
- commercial books may still guide instructors or be offered as optional references;
- RISC-V is the planning-leading teaching ISA unless technical evidence later shows a better open teaching path.

## Research standard

Search broadly, but prefer sources in roughly this order:

1. **primary specifications / official documentation**;
2. **openly licensed textbooks and educational resources**;
3. **current university course materials published for public use**;
4. **open-source project documentation and tutorials**;
5. **high-quality technical articles/videos** when they fill a real pedagogical gap.

Do not assume that "publicly viewable" means "freely reusable." Record the licensing/use status when it matters.

Do not copy proprietary textbook or zyBooks content into the repository.

## Starting benchmark set

At minimum inspect the useful portions of:

- UC Berkeley CS61C;
- Cornell CS3410;
- MIT 6.004 Computation Structures;
- Nand2Tetris;
- University of Cambridge Computer Architecture materials;
- RISC-V International specifications and learning resources;
- official GNU/binutils/GDB documentation where relevant;
- QEMU / selected simulator documentation where relevant;
- Linux kernel or other primary OS documentation for Week 11 topics where pedagogically suitable.

Then look beyond these. The mission is "best available open course," not "repackage six famous links."

## Required week-by-week mapping

Build the canon against the accepted course spine.

### Week 2 — AI Lab Training

Find provider-neutral, freely accessible material on:

- effective context gathering;
- verification and epistemic discipline;
- command/code review before execution;
- distinguishing model output from evidence.

Do not require a particular paid AI product.

### Week 3 — Containers & Repeatability

Find open material explaining:

- reproducible environments;
- containers/images/runtime concepts;
- practical student-safe container workflows.

### Week 4 — Linux Command Line

Find concise open references/tutorials for the exact command set selected by Prompt 003, prioritizing material that supports observation of the machine.

### Week 5 — Representation, Logic, Arithmetic

Cover:

- binary/hex;
- two's complement;
- overflow;
- IEEE-754 at the right depth;
- Boolean logic;
- combinational logic / ALU ideas.

### Week 6 — RISC-V ISA

Prioritize primary/open RISC-V material plus excellent teaching explanations for:

- registers;
- instruction formats;
- arithmetic/data movement;
- branches/jumps;
- procedures/calling convention;
- machine encoding;
- assembler/linker/loader/compiler relationship where useful.

### Week 7 — Datapath + Control

Find material that lets students understand or build/trace:

- PC;
- register file;
- ALU;
- memory;
- muxes;
- control signals;
- single-cycle datapath.

### Week 8 — Pipelining + Performance

Cover:

- latency/throughput/CPI;
- pipeline stages;
- hazards;
- forwarding/stalls/flushes;
- branch effects.

### Week 9 — Source-to-CPU Integration

Find or construct a small coherent example that can travel through:

source → compiler/toolchain → assembly → encoding → CPU trace.

Prefer one course-owned example over forcing students to stitch five unrelated web pages together.

### Week 10 — Memory Hierarchy + Caches

Cover locality, cache organization, mapping/associativity, hits/misses, AMAT, and runnable/measurable examples.

### Week 11 — Virtual Memory, Protection, I/O, OS Support

Cover introductory:

- virtual/physical addresses;
- paging/TLB;
- privilege/protection;
- traps/exceptions/syscalls;
- interrupts/I/O.

### Week 12 — Multicore, Coherence, Synchronization

Cover:

- parallel speedup/Amdahl's Law;
- shared memory;
- synchronization;
- false sharing;
- coherence;
- introductory consistency ideas where needed.

### Week 13 — Vectors, GPUs, ML Accelerators

Find open/current material for:

- SIMD/vector processing;
- SIMT/GPU execution;
- bandwidth/throughput;
- accelerator specialization;
- ML workload/hardware relationship.

Required student path must remain CPU-accessible.

### Week 14 — Architectures in the Wild

Identify primary/open sources useful for comparing real modern CPUs/SoCs/GPUs/accelerators across:

- performance;
- power/energy;
- memory/bandwidth;
- cost/complexity;
- programmability;
- workload fit;
- security/reliability where useful.

Prefer vendor architecture manuals/specifications and reputable primary measurements over marketing summaries where possible.

### Weeks 15–17

Find only supporting reference material needed for capstone/reflection. Do not bury the synthesis experience under new reading.

## Required source classification

For each source record:

- title;
- author/institution/project;
- URL/reference;
- topics/weeks served;
- format (text/video/spec/tool/etc.);
- accessibility status;
- license/reuse status when identifiable;
- whether students should read it directly or instructors should use it to create course-owned explanation;
- estimated student burden;
- strengths;
- limitations;
- permanence risk (stable project/spec vs fragile personal page).

## Gap analysis

For each week classify required content as:

- **GREEN — excellent open student-facing source exists**;
- **YELLOW — useful sources exist but need course-created synthesis/scaffolding**;
- **RED — we should author this ourselves because the open landscape is insufficient for our students/course shape**.

A RED is not a failure. It is an authoring instruction.

## Course-created textbook strategy

Recommend which content should become durable course-owned material, such as:

- short chapter/lesson pages;
- diagrams;
- worked traces;
- command reference cards;
- RISC-V examples;
- CPU/pipeline/cache visualizations;
- lab walkthroughs;
- glossary/concept maps.

The goal is not to reproduce a 700-page textbook. The goal is to give students exactly enough coherent explanation that the external open sources enrich the course instead of holding it together with duct tape.

## AI tooling boundary

The canon may include documentation/tutorials for AI-assisted coding or command-line agents as **optional advanced material**.

Do not design required Week 2 or later content around a paid subscription. For every required AI use case, identify a provider-neutral/no-cost route or recommend a course-created workflow that does not depend on premium features.

## Required report

Write:

`sidecar/reports/002_build_open_source_architecture_canon.md`

Include:

- sources researched;
- week-by-week canon table;
- licensing/accessibility notes;
- GREEN/YELLOW/RED coverage matrix;
- recommended course-created material;
- fragile-link/permanence risks;
- reusable material that belongs in `swosu_cs_curriculum` or another shared repo;
- concrete handoff instructions for Prompt 004 week authors.

If useful, also create a durable course-facing resource map outside `sidecar/` once Foreman accepts the research.

## Foreman acceptance

Foreman verifies that:

1. every required Architecture week has a plausible no-paywall content path;
2. sources are technically strong and appropriate for students, not merely famous;
3. licensing/access distinctions are honest;
4. commercial resources are optional only;
5. paid AI/CLI tools are optional only;
6. gaps are explicitly handed to course authors rather than hidden behind weak links.

## Done when

The course has an evidence-backed open-source/reference canon and a clear list of what we must author ourselves to make COMSC-3013 fully teachable without requiring students to buy content or premium AI tooling.
