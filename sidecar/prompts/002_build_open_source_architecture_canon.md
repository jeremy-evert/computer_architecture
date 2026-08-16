# Sidecar Prompt 002 - Build the open-source Computer Architecture canon

**Status:** OPEN - active focused pass  
**Owner:** ChatGPT / current helm  
**Mode:** research -> licensing/access check -> week mapping -> sensory-lab support -> gap analysis -> report

## Why we need Prompt 002

Prompt 001 made the course structurally coherent. Prompt 002 makes it **source-coherent**.

The design conversation has produced a rich mental model of the course: Weeks 1-4 build the investigator; Weeks 5-14 open and stress the machine; the Machine Dossier carries evidence forward; important architecture adjectives should be attached to experiences; Python/matplotlib makes behavior visible; LaTeX turns the evidence into a durable technical artifact; Week 14 is the technical finale; Weeks 15-17 wind down.

That design memory cannot remain only in Jeremy and ChatGPT's conversation history. Before implementation accelerates, we need to dump the source implications into durable Git truth so later authoring does not drift back toward:

- one textbook silently becoming the curriculum;
- a pile of famous links with no pedagogical hierarchy;
- technically correct sources that are too dense for our students;
- public material being copied as though public meant openly licensed;
- sensory labs being invented without trustworthy conceptual or measurement references;
- volatile hardware prices/specifications being treated as timeless facts;
- ten workers independently researching the same topic and producing ten incompatible source stacks.

Prompt 002 is therefore the **memory-transfer and source-selection pass** between course design and course construction.

It should leave Prompt 003 and Prompt 004 able to focus. Prompt 003 should be able to build one lab platform without reopening the curriculum research question. Prompt 004 should be able to author Weeks 5-14 without going on a fresh textbook hunt every week.

The intended outcome is not a bibliography. It is a set of explicit decisions about **what we trust for truth, what we give directly to students, what we may legally adapt, what we only link, and what we deliberately author ourselves**.

## Questions Prompt 002 must answer

1. **What is the strongest truth source for each technical concept?**
2. **What source should a student actually read/watch/use, rather than merely what an expert instructor respects?**
3. **Which public sources are legally adaptable, and which must remain link-first references?**
4. **Where is the open landscape too fragmented, advanced, vendor-shaped, or pedagogically wrong for this course?** Those are authoring instructions, not failures.
5. **What source pair supports each sensory lab?** One source should explain the mechanism; another should support the measurement/tool path that makes it observable.
6. **How do Weeks 5 and 14 use current hardware specifications and prices without baking temporary market facts into permanent course doctrine?**
7. **How do we preserve the historical Dollars-Per instinct without fabricating fake economics for on-die cache?**
8. **Which sources support one continuous machine story across sister weeks and checkpoints instead of resetting context every Monday?**
9. **What should become durable course-owned explanation, diagrams, traces, reference cards, datasets, plotting helpers, and lab guides?**
10. **What can Prompt 003 and Prompt 004 now treat as settled so they can build instead of re-researching?**

If this prompt cannot answer those questions clearly, it is not done.

## Mission

Assemble the strongest open/freely accessible source set for COMSC-3013 so the required course can stand on its own **without a commercial textbook or zyBooks dependency**.

This is not a link dump. Build a curated canon that tells later authors:

- what students can read/watch/use for free;
- which primary/open source is strongest for each concept;
- what license/access constraints apply;
- what source can support each planned sensory experiment;
- what current specification/price data can responsibly support Week 5 and Week 14 machine-design economics;
- what we should author ourselves because the open landscape is fragmented, overly advanced, fragile, or pedagogically wrong for this course.

The goal is that **the course itself is the coherent textbook and laboratory guide**; external sources deepen and verify it.

## Read first

- `course_metadata.yaml`
- `README.md`
- `planning/fall-2026-course-design.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/fall-2026-spine.md`
- `planning/week-02.md` through `planning/week-14.md`
- `docs/grading-model.md`
- `sidecar/PLANNING.md`
- `sidecar/reports/001_reconcile_course_source_chassis.md`
- `sidecar/questions/001_zybooks_decision_for_architecture.md`
- `sidecar/questions/002_zybooks_isa_product_and_course_role.md`

## Pinned doctrine

Do not reopen:

- no required commercial textbook;
- no required zyBooks purchase;
- no required paid AI subscription;
- no required premium AI command-line agent;
- no required GPU/FPGA/Raspberry Pi;
- CPU-only required path;
- free/accessible path has the same grading ceiling;
- RISC-V is the planning-leading teaching ISA;
- Weeks 5-14 are the complete Architecture technical runway;
- Machine Dossier begins Week 5 and freezes Week 14;
- Week 16 is shared Farkle + ML application/fun, not an Architecture capstone or Checkpoint 4.

## Research standard

Prefer sources in roughly this order:

1. **primary specifications / official documentation**;
2. **openly licensed textbooks and educational resources**;
3. **current university course materials published for public use**;
4. **open-source project documentation and tutorials**;
5. **high-quality technical articles/videos** only where they fill a real pedagogical gap.

For technical claims, prefer primary/official evidence when practical.

Do not assume publicly viewable means openly licensed/reusable. Record access and licensing separately.

Do not copy proprietary textbook/zyBooks prose, exercises, diagrams, or answer material.

## Starting benchmark set

At minimum inspect relevant portions of:

- RISC-V International specifications/learning resources;
- UC Berkeley CS61C;
- Cornell CS3410;
- MIT 6.004 / Computation Structures;
- Nand2Tetris;
- University of Cambridge Computer Architecture materials;
- official GCC/LLVM/binutils/GDB documentation as appropriate;
- official QEMU / selected simulator documentation;
- Linux/kernel/man-page or other primary OS documentation for Week 4/11;
- official Python/matplotlib documentation for the plotting scaffold;
- official/open publishing documentation for the selected LaTeX/PDF path;
- official hardware/vendor specification pages where Week 5/14 comparison needs real contemporary machine facts.

Then look beyond this set. Famous is not the same thing as useful.

## Required week-by-week mapping

### Week 2 - AI Laboratory Training

Find provider-neutral/open material supporting:

- context gathering;
- technical-question framing;
- verification/epistemic discipline;
- command/code review before execution;
- distinguishing generated explanation from evidence.

No paid provider can own the required path.

### Week 3 - Containers & Repeatability

Find concise open material on:

- image/container/runtime concepts;
- reproducible environments;
- version/environment receipts;
- safe beginner container workflows.

### Week 4 - Linux as a Machine Telescope

Find strong references for the exact observation tools Prompt 003 validates, such as:

- `uname`, `lscpu`, `/proc`, `free`, `ps`;
- `file`, `xxd`/`od`;
- compiler/binutils/disassembly tools.

The source set should support **asking the machine questions**, not a generic Linux certification syllabus.

### Week 5 - Build the Machine

This is the **Machine Dossier start**, not the old representation week.

Research/support:

- PC compatibility and interfaces;
- workload-driven component selection;
- CPU/motherboard/socket/chipset relationships at useful depth;
- RAM compatibility/capacity/channel considerations;
- storage interfaces and classes;
- GPU/accelerator fit where relevant;
- power/form-factor/thermal constraints at introductory depth;
- cache -> RAM -> NVMe/SSD/HDD -> network/cloud hierarchy;
- capacity/cost comparisons;
- latency and bandwidth order-of-magnitude context;
- the limits of naive Dollars-Per metrics.

Build a **source/date strategy for prices**. Prices are time-sensitive evidence, not permanent textbook constants. Prefer current vendor/retailer/PC-part sources for the student exercise, clearly date-stamped, while durable course prose teaches the reasoning independent of one day's price.

Identify what can be responsibly sourced for L1/L2/L3 cost/economic discussion. If direct literal $/GB for on-die cache would create false precision, recommend a better pedagogical treatment rather than fabricating a market price.

### Week 6 - Bits Become Instructions

Cover:

- binary/hex;
- fixed-width unsigned/signed integers and two's complement;
- overflow;
- floating-point approximation at useful depth;
- bytes/endianness where useful;
- RISC-V registers/instructions/encodings;
- source -> assembly -> machine-visible state;
- calling convention/ABI only as needed to interpret compiler output.

Week 5's machine/value story should flow into Week 6 rather than resetting context.

### Week 7 - Crack Open the CPU

Find material supporting a bounded teaching model of:

- stored-program execution;
- PC;
- register file;
- ALU;
- instruction/data memory;
- muxes/control signals;
- decode;
- single-cycle datapath/control.

Prefer something students can trace/build rather than a diagram to memorize.

### Week 8 - Make It Fast Without Breaking It

Cover:

- latency versus throughput;
- CPU time / CPI basics;
- pipeline stages;
- structural/data/control hazards;
- forwarding/stalls/flushes;
- branch effects;
- dependent versus independent work.

Find sources that support a **sensory performance experiment** and an interpretable first matplotlib curve.

### Week 9 - Follow the Program Down

Prefer one coherent course-owned small program that can travel through:

**source -> representation -> compiler/toolchain -> RISC-V instruction -> processor/performance evidence**

Use external sources for verification, not as five disconnected fragments students must stitch together.

### Week 10 - Make the Memory Hierarchy Hurt

Cover:

- temporal/spatial locality;
- cache lines/blocks;
- mapping/associativity/replacement at appropriate depth;
- hit/miss behavior and AMAT;
- latency versus bandwidth;
- pointer-chase/dependent access;
- streaming/bulk access;
- varying working-set size;
- measured cache/locality cliffs.

Find both conceptual sources and evidence/tool references suitable for the sensory lab.

### Week 11 - The Useful Lie of Memory

Cover introductory:

- virtual versus physical addresses;
- page tables/TLB;
- privilege/protection;
- page faults;
- traps/exceptions/syscalls;
- interrupts;
- device/I/O paths.

Prefer sources that let students connect an observable process/software abstraction to underlying mechanism. Do not turn this into a full OS course.

### Week 12 - More Cores, More Problems

Cover:

- thread/data parallelism;
- speedup and Amdahl's Law;
- shared memory;
- synchronization;
- false sharing;
- cache coherence;
- computation-to-communication ratio;
- communication/synchronization latency;
- why adding workers may stop helping.

Find sources/tool docs that support a CPU-accessible scaling experiment. MPI may be included if Prompt 003 proves the path humane; MPI itself is not the learning objective.

### Week 13 - Different Machines for Different Work

Cover:

- SIMD/vector processing;
- GPU/SIMT execution;
- latency-oriented versus throughput-oriented design;
- memory/bandwidth/data movement;
- setup/transfer overhead;
- accelerator/tensor/ML workload shapes;
- CPU versus specialized execution tradeoffs;
- representation formats such as FP32/FP16/BF16/int8 where they materially clarify hardware tradeoffs.

Required path remains CPU-accessible. GPU material can enrich, not gate.

### Week 14 - Sit in the Architect's Chair

Identify primary/open/current sources useful for comparing real architectures and revisiting the Week 5 build across:

- performance;
- latency/throughput;
- memory/bandwidth;
- cost;
- power/energy where responsibly supported;
- programmability;
- specialization;
- reliability/security where useful;
- workload fit.

This week ends Architecture instruction. It does **not** launch a Week 16 capstone.

### Weeks 15-17 - Wind down / shared application / reflection

Find only light supporting material needed for:

- Week 15 curation/catch-up;
- Week 16 shared Farkle + ML experience;
- Week 17 evidence-backed reflection.

Do not introduce a new Architecture reading arc, new dossier layer, or hidden capstone.

## Sensory-lab source requirement

For each major experimental adjective, identify both:

1. a conceptual source explaining the mechanism;
2. a measurement/tool/source path that can make the phenomenon observable.

Priority examples:

- latency vs bandwidth;
- dependent vs independent work;
- cache/locality cliffs;
- sequential vs random storage behavior;
- worker-count/scaling behavior;
- communication/synchronization cost;
- data-movement/setup cost vs steady-state throughput.

## Required source record

For each source record capture:

- title;
- author/institution/project;
- URL/reference;
- topics/weeks served;
- format;
- access status;
- license/reuse status when identifiable;
- student-facing vs instructor-background role;
- estimated burden;
- strengths;
- limitations;
- permanence risk;
- whether it directly supports a planned lab/measurement.

## Gap classification

For each week/concept classify:

- **GREEN - excellent open student-facing source exists**;
- **YELLOW - useful sources exist but course-owned synthesis/scaffolding is needed**;
- **RED - author it ourselves** because the available material does not fit this course/student population.

A RED is productive information.

## Durable outputs

Create:

- `planning/open-source-resource-canon.md`
- `planning/open-source-resource-map.csv`
- `sidecar/reports/002_build_open_source_architecture_canon.md`

The durable canon/map should be course-author-facing planning truth, not a pile of raw search notes.

## Course-created textbook strategy

Recommend exactly which pieces should become durable course-owned material, such as:

- short lecture/digest chapters;
- diagrams/concept maps;
- worked traces;
- command reference cards;
- RISC-V examples;
- CPU/pipeline/cache visualizations;
- PC-build/Dollars-Per guidance;
- sensory-lab walkthroughs;
- interpretation examples showing how to read a plot without overclaiming.

Do not reproduce a 700-page textbook. Write the bridges our course actually needs.

## AI tooling boundary

Optional AI/agent documentation may appear as enrichment. No required source path can depend on paid AI/CLI features.

## Required report

`sidecar/reports/002_build_open_source_architecture_canon.md` must include:

- sources researched;
- week-by-week canon;
- licensing/access notes;
- GREEN/YELLOW/RED matrix;
- sensory-lab support map;
- Week 5 current-price/spec sourcing strategy;
- course-created material recommendations;
- fragile-link/permanence risks;
- reusable material candidates for shared curriculum repos;
- concrete handoff instructions for Prompt 003/004.

## Acceptance

Accept only when:

1. every required Architecture week has a plausible no-paywall learning path;
2. sources are technically strong and appropriate, not merely famous;
3. licensing/access distinctions are honest;
4. Week 5/14 current-spec/price evidence is dated and not treated as permanent doctrine;
5. sensory labs have conceptual + measurement support;
6. commercial resources remain optional;
7. paid AI/CLI and specialized hardware remain optional;
8. gaps are handed to course authors explicitly.

## Done when

The course has a durable, evidence-backed open-source canon and a precise authoring gap map that can feed the common laboratory and Weeks 5-14 production without reopening settled curriculum decisions.
