# Sidecar Report 002 - Build the open-source Computer Architecture canon

**Status:** COMPLETE  
**Date:** 2026-08-16  
**Executed by:** ChatGPT under Jeremy's course-design authority

## Result

The course now has a durable source strategy rather than an implicit textbook substitute.

Created:

- `planning/open-source-resource-canon.md`
- `planning/open-source-resource-map.csv`

The accepted model is a **mosaic canon**:

1. primary specifications for truth;
2. openly licensed OER where adaptation is useful;
3. public university resources as link-first sources when reuse rights are narrower/unclear;
4. official open-source tool documentation;
5. course-owned explanations/labs/plots/dossier material as the coherent student surface.

No single free textbook was found or selected as the course spine. This is deliberate.

## Strongest sources found

### RISC-V International

`https://docs.riscv.org/reference/home/index.html`

The ratified specification library identifies the current stable Unprivileged and Privileged ISA release as **v20260120 (January 2026)**.

The specification source at `https://github.com/riscv/riscv-isa-manual` is licensed **CC BY 4.0**, making it the cleanest primary/reference/adaptation source in the canon.

**Decision:** GREEN as normative truth; YELLOW as direct student teaching because the spec is intentionally more detailed than our one-week ISA experience.

### MIT OpenCourseWare 6.004 Computation Structures

`https://ocw.mit.edu/courses/6-004-computation-structures-spring-2017/`

Strong structural coverage from gates/logic through ISA/processor, caches/VM, pipelines and parallelism. MIT OCW materials are distributed under **CC BY-NC-SA 4.0** under the OCW terms.

**Decision:** strongest adaptable OER ingredient, especially for Weeks 7-13. Adapt selectively and preserve attribution/license obligations; do not clone an entire MIT course.

### UC Berkeley CS61C 2026

`https://notes.cs61c.org/`

Spring 2026 notes provide unusually strong current coverage of representation, RISC-V, instruction formats, synchronous digital systems, single-cycle CPU, pipelining, caches, performance programming and virtual memory.

The notes explicitly use **CC BY-NC-ND 4.0**.

**Decision:** excellent free student link/reference, **not an adaptation source**. Course authors may cite/link; do not remix or derive our lecture text/figures from those notes.

### Cornell CS3410 Spring 2026

`https://www.cs.cornell.edu/courses/cs3410/2026sp/`

Current sequence covers numbers, C, float, gates/state, CPU, RISC-V, calling conventions, caches, processes/syscalls/interrupts, VM, threads/synchronization/atomics, parallelism and performance.

Its infrastructure page documents a real Docker + GCC + QEMU RISC-V student path and explicitly supports Windows (including WSL), macOS and Linux.

No broad course-content reuse license was identified in this pass.

**Decision:** excellent link-first student/instructor benchmark. Do not copy assignments/notes unless a compatible license is later verified.

### Cambridge Introduction to Computer Architecture / ECAD + Architecture 2025-26

Current public syllabus covers RISC-V, processor design, pipelining, caches, OS support, SoCs/DRAM, multicore/coherence and GPUs. The public RISC-V practical uses a small RV32I processor (Clarvi), Spike ISA simulation and cycle-accurate hardware simulation.

Detailed handouts are partly Cambridge-domain restricted; public material does not automatically grant adaptation rights.

**Decision:** strong coverage/practical benchmark, link-first.

### Nand2Tetris

Project 5 explicitly constructs Memory, CPU and the complete Hack computer. The simulator source repository identifies GPL v2-or-later licensing.

**Decision:** preserve the build-the-machine instinct and optionally use compatible tooling, but do not import the Hack ISA/course project as our RISC-V curriculum. Public instructional pages are link/inspiration unless their content license is separately verified.

## Official tool/reference layer

The canon also records primary/official docs for:

- Linux kernel `/proc`;
- GDB;
- GNU Binutils/readelf;
- GCC RISC-V options;
- QEMU user/RISC-V emulation;
- Docker concepts/setup;
- Matplotlib;
- Tectonic;
- OpenMP;
- Open MPI;
- NVIDIA CUDA.

### Specific lab-platform implications

- Cornell demonstrates a realistic Docker + RISC-V GCC + QEMU course path.
- QEMU officially supports user-mode cross-architecture execution and RISC-V system emulation.
- Tectonic is a self-contained modern TeX/LaTeX engine and is MIT-licensed; it is a strong candidate for the dossier-PDF build but still requires Prompt 003 validation.
- Open MPI officially supports multi-process jobs on a single workstation/laptop, making it a plausible Week 12 instrument without requiring a cluster. MPI remains optional until the lab-platform test proves it humane.
- OpenMP is a cleaner first-line shared-memory path for required multicore experiments.
- CUDA official docs provide current SIMT/memory/data-movement reference for Week 13, while the required lab path remains CPU-only.

## GREEN / YELLOW / RED gap map

| Week | Classification | Why |
|---|---|---|
| 1 | GREEN | Reuse shared SWOSU Success Foundations. |
| 2 | YELLOW | Shared AI Fluency exists; Architecture-specific verification lab needs course-owned scaffold. |
| 3 | YELLOW | Excellent Docker/Cornell examples; runtime-neutral/reproducible SWOSU path must be ours. |
| 4 | YELLOW | Excellent primary tool docs; student Machine Telescope card must be ours. |
| 5 | **RED** | Machine Dossier + workload/compatibility/Dollars-Per/architectural scarcity is SWOSU-native and time-sensitive. |
| 6 | YELLOW | GREEN RISC-V primary truth; student bridge from values to instructions must be ours. |
| 7 | YELLOW | Excellent MIT/Nand/Berkeley/Cornell/Cambridge ingredients, but our bounded RISC-V CPU story must be coherent. |
| 8 | YELLOW | Concepts exist; sensory pipeline/performance experiment + plot is ours. |
| 9 | **RED** | Source-to-CPU integration only works if one course-owned specimen ties layers together. |
| 10 | YELLOW | Strong cache references; memory sensory lab + plots must be ours. |
| 11 | YELLOW | Strong VM/OS sources; observable Linux-to-architecture bridge must be ours. |
| 12 | YELLOW | Strong parallel sources/tooling; communication/synchronization sensory harness must be ours. |
| 13 | YELLOW | Strong RISC-V V/CUDA references; CPU-only comparative workload and transfer-cost story must be ours. |
| 14 | **RED** | Architecture judgment/redesign must consume each student's own dossier and current market/spec evidence. |
| 15 | GREEN | Wind-down only. |
| 16 | GREEN | Reuse shared Farkle + ML source; no Architecture capstone. |
| 17 | GREEN | Course-owned reflection using frozen evidence. |

## Week 5 current-price/spec strategy

A permanent hardware-price table is explicitly rejected.

Required pattern:

1. capture a dated shopping/build snapshot using a student-accessible PC-part/retailer surface;
2. verify architecture/specification claims against official manufacturer specs where practical;
3. record retailer/aggregator price as **observed market evidence**, not architecture truth;
4. refresh Week 14 rather than pretending Week 5 prices are current forever;
5. never require one vendor/store.

### Important correction to the historical Dollars-Per idea

Retail `$ / GB` is meaningful for separately purchased RAM/NVMe/SSD/HDD/cloud capacity.

It is misleading to assign L1/L2/L3 a fabricated retail price-per-byte because on-die cache is not normally sold independently. For cache/registers, teach **architectural scarcity** instead: silicon area, access latency, power, locality, associativity, capacity and total design/chip cost.

This distinction should become explicit Week 5 teaching material.

## Sensory-lab source support

Every major experimental adjective has both a conceptual and an instrumentation path:

| Phenomenon | Concept sources | Instrument path |
|---|---|---|
| latency vs throughput | MIT/Berkeley/Cambridge | course timing/pipeline harness + matplotlib |
| cache/locality cliffs | MIT/Berkeley/Cornell | native working-set/pointer-chase/stream experiment |
| VM/process illusion | MIT/Cornell/Berkeley + RISC-V privileged | Linux `/proc`/maps/fault observations |
| shared-memory scaling | Cornell/Berkeley + OpenMP | OpenMP/native CPU scaling harness |
| communication sensitivity | Cornell + Open MPI | non-root delay harness; MPI optional |
| specialization/data movement | RISC-V V + CUDA official docs | scalar/vector CPU required; GPU optional |

## Course-owned textbook/build list handed to Prompt 004

Author these rather than hunting for a magical external source:

1. weekly central-question / Week-at-a-Glance pages;
2. Monday lecture digests/decks;
3. Machine Telescope reference card;
4. Machine Dossier guide/schema;
5. Build-the-Machine / Dollars-Per + architectural-scarcity guide;
6. bounded RISC-V bridge/reference card;
7. one SWOSU RISC-V datapath/trace;
8. pipeline timing visualizer/worksheet;
9. Week 9 source-to-CPU specimen;
10. Memory Sensory Lab guide;
11. VM/OS mechanism bridge;
12. Parallel Sensory Lab guide;
13. specialization/data-movement guide;
14. Week 14 architecture-decision brief;
15. tiny plot-reading / measurement-hygiene guide.

## Licensing decisions

### Adaptable

- RISC-V spec/manual: CC BY 4.0.
- MIT OCW: CC BY-NC-SA 4.0 under OCW terms.
- open-source tool code only when the specific license/integration consequence is accepted.

### Link-first

- Berkeley 2026 notes: CC BY-NC-ND 4.0; **no derivatives**.
- Cornell course notes/labs: no broad reuse license identified; link.
- Cambridge pages/material: do not infer adaptation rights from public access.
- NVIDIA/vendor docs: official reference, link/cite.
- Nand2Tetris instructional content: link/inspiration unless compatible content license is verified; simulator code license is separate.

## Permanence / fragility risks

- semester-specific university course URLs may move or disappear;
- vendor product/spec pages and pricing are intentionally volatile;
- current tool documentation changes with releases;
- some Cambridge content is domain-restricted;
- Berkeley notes are actively developed and NoDerivatives.

Mitigation:

- durable course-owned explanation is primary student surface;
- primary specifications are used for truth;
- links are checked during week validation and before LMS imprint;
- source map records roles/licensing so a broken external source can be replaced without redesigning the course.

## Handoff

**Prompt 003 should now select and prove the actual lab/toolchain interfaces.**

**Prompt 004 should consume this canon rather than conducting an independent textbook hunt.**

The most important requirement for both is that the student experience remains one coherent machine story, not a tour of other universities' websites.
