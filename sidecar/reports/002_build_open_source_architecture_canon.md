# Sidecar Report 002 - Build the open-source Computer Architecture canon

**Status:** COMPLETE  
**Date:** 2026-08-16  
**Executed by:** ChatGPT under Jeremy's course-design authority  
**Prompt:** `sidecar/prompts/002_build_open_source_architecture_canon.md`

## Why this work mattered

Prompt 001 made the course structurally coherent. Prompt 002 makes it source-coherent.

The course now has a distinctive design that must survive beyond the conversation that created it:

- Weeks 1-4 build the investigator;
- Weeks 5-14 are the entire Architecture technical runway;
- the Machine Dossier is the persistent artifact;
- important architecture adjectives should acquire meaning through controlled experience;
- Python/matplotlib makes behavior visible;
- LaTeX/PDF makes evidence durable;
- Week 14 is the technical finale;
- Weeks 15-17 deliberately wind down.

Without Prompt 002, later authors could easily drift back toward one textbook, a pile of famous links, copied public course material with unclear reuse rights, or labs whose measurements were disconnected from trustworthy conceptual sources.

Prompt 002 therefore serves as the **memory-transfer and source-selection layer** between design and construction.

## Result in one sentence

Computer Architecture will use a **mosaic canon**: primary specifications for truth, carefully selected open/public teaching sources for explanation and benchmarking, official tool documentation for interfaces, and SWOSU-owned connective tissue/labs as the coherent student surface.

No single free textbook was selected as the course spine. That is deliberate.

## Durable outputs

Created/refined:

- `planning/open-source-resource-canon.md`
- `planning/open-source-resource-map.csv`
- this report

The CSV now records, for each source:

- access;
- reuse/license posture;
- weeks served;
- truth role;
- student role;
- estimated burden;
- strengths;
- limitations;
- permanence risk;
- direct sensory/lab support.

That makes it usable as an authoring contract rather than a bookmark list.

# Answers to the ten Prompt 002 questions

## 1. What is the strongest truth source for each technical concept?

Use primary/official material wherever practical:

- RISC-V Ratified Specifications + ABI for ISA, privileged mechanisms, vector extensions, calling convention/ELF truth;
- Linux kernel documentation for `/proc` and observable process/memory state;
- GNU GDB/Binutils/GCC documentation for debugger, binary, compiler and target-option truth;
- QEMU documentation for emulation behavior;
- OpenMP specification/examples for shared-memory parallelism;
- Open MPI documentation if MPI is retained as a communication instrument;
- current NVIDIA CUDA Programming Guide for vendor-specific SIMT/GPU memory/data-movement truth.

Primary sources are the **verification layer**, not automatically the student teaching layer.

## 2. What should a student actually read/use?

The student-facing source should be the smallest thing that helps answer the week's machine question.

Preferred student shapes:

- course-owned digest first;
- bounded official reference excerpts/links when the official material is readable;
- Berkeley CS61C 2026 notes as excellent link-only reinforcement;
- selected Cornell CS3410 2026 notes/resources when their prerequisite assumptions fit;
- MIT OCW excerpts/adaptations only where licensing obligations are deliberately honored;
- course-owned reference cards and traces when no external source matches our scope.

A source can be authoritative and still be a poor first teaching surface.

## 3. Which public sources are adaptable versus link-first?

### Adaptable with explicit license handling

- **RISC-V specifications/manual source:** CC BY 4.0.
- **MIT OpenCourseWare:** CC BY-NC-SA 4.0 under OCW terms. Attribution, noncommercial use and ShareAlike obligations apply to adaptations.
- open-source tool code only when its exact software license and redistribution consequences are intentionally accepted.

### Link-first

- **Berkeley CS61C 2026 notes:** CC BY-NC-ND 4.0. Free consumption, but no derivatives.
- **Cornell CS3410 2026:** excellent public material; no broad reuse license identified in this pass.
- **Cambridge 2025-26 Architecture / ECAD practicals:** public pages are excellent benchmarks, but some course handouts are institution-restricted and public visibility is not treated as adaptation permission.
- **Nand2Tetris instructional project pages:** link/use as inspiration unless compatible content rights are separately verified; simulator source has its own GPL license.
- vendor documentation such as NVIDIA CUDA: official technical reference, link/cite rather than remix into a vendor-derived textbook.

## 4. Where is the open landscape too fragmented or wrong for this course?

Three weeks are deliberately **RED / course-owned**:

- **Week 5 - Build the Machine:** our PC build + Machine Dossier + Dollars-Per + architectural-scarcity combination is distinctive and time-sensitive.
- **Week 9 - Follow the Program Down:** integration fails if students must stitch together five unrelated external explanations. One course-owned specimen must travel through the layers.
- **Week 14 - Sit in the Architect's Chair:** no reading can substitute for synthesis of the student's own dossier, measurements, workload and current market/spec evidence.

Most other technical weeks are **YELLOW**: strong sources exist, but SWOSU needs a bounded bridge and sensory lab.

## 5. What source pair supports each sensory lab?

| Phenomenon | Concept/truth layer | Experience/tool layer | SWOSU-owned work |
|---|---|---|---|
| latency vs throughput | MIT/Berkeley/Cambridge pipeline material | compiler/timing or pipeline model | Week 8 controlled experiment + plot |
| dependent vs independent work | pipeline/performance sources | bounded timing/trace harness | Week 8 specimen |
| memory latency vs bandwidth | MIT/Berkeley/Cornell cache material | native timing + machine topology | Week 10 pointer-chase + stream harness |
| cache/locality cliffs | cache/locality sources | working-set sweep | Week 10 normalized runner + plot |
| VM/process abstraction | RISC-V privileged + MIT/Cornell/Berkeley VM | Linux `/proc`/maps/fault observation | Week 11 guided observation |
| shared-memory scaling | Cornell/Berkeley + OpenMP | OpenMP/native CPU runner | Week 12 scaling workloads |
| communication sensitivity | Cornell parallelism + Open MPI | optional MPI plus required non-root delay model | Week 12 chatty-vs-chunky harness |
| specialization/data movement | RISC-V V + CUDA official guide | scalar/vector CPU; GPU optional | Week 13 common workload comparison |

The rule is now explicit: **conceptual source + observable source + our experiment**.

## 6. How do Weeks 5 and 14 use current specs/prices responsibly?

Hardware prices and product availability are **current evidence**, not curriculum truth.

Required pattern:

1. date-stamp the observation;
2. use a builder/aggregator such as PCPartPicker as the convenient workflow surface, with equivalent alternatives permitted;
3. verify architecture/spec claims against the manufacturer's official product/spec page where practical;
4. capture the actual retailer/aggregator price observed at that time;
5. distinguish architectural property from market price;
6. refresh the market snapshot in Week 14 rather than pretending the Week 5 price remains current.

The durable lesson is how to reason from workload, constraint and evidence. The shopping table is intentionally ephemeral.

## 7. How do we preserve Dollars-Per without fake cache economics?

The historical Dollars-Per instinct survives, but it becomes more sophisticated.

### Literal retail capacity economics

Use `$ / GB` or `$ / TB` where a capacity is actually purchased separately:

- RAM;
- NVMe/SATA SSD;
- HDD;
- cloud/network storage when meaningful and clearly scoped.

### Architectural scarcity economics

Do **not** fabricate a retail `$ / GB` for L1/L2/L3 cache.

On-die cache is not normally sold as separable storage. Teach the scarcity tradeoff through:

- silicon area;
- access latency;
- power/energy;
- locality;
- associativity/organization;
- capacity;
- total chip/package/design cost.

This is not a retreat from the original exercise. It makes the original exercise intellectually honest.

## 8. Which sources support continuity rather than weekly resets?

The canon supports one continuing machine story:

- Week 5 current component/vendor evidence establishes the machine;
- Week 6 RISC-V + toolchain references explain its software/hardware contract;
- Weeks 7-8 MIT/Berkeley/Cornell/Cambridge ingredients help open the CPU and performance story;
- Week 9 uses external sources only to verify the one SWOSU integration specimen;
- Weeks 10-11 use the same program/data-access story while moving from physical hierarchy to software-visible abstraction;
- Weeks 12-13 use one workload family while moving from general parallelism to specialization;
- Week 14 returns to the Week 5 machine.

No source is allowed to become more important than continuity.

## 9. What should we author ourselves?

The course-owned build list is now explicit:

1. Week-at-a-Glance / central-question page for each week.
2. Monday lecture digest/deck source.
3. Machine Telescope reference card organized by questions/evidence.
4. Machine Dossier guide/schema.
5. Build-the-Machine / Dollars-Per + architectural-scarcity guide.
6. Bounded RISC-V bridge/reference card.
7. One consistent SWOSU RISC-V datapath/trace model.
8. Pipeline timing visualizer/worksheet.
9. Week 9 source-to-CPU specimen.
10. Memory Sensory Lab guide + measurement hygiene.
11. VM/OS mechanism bridge from Linux evidence to architecture.
12. Parallel Sensory Lab guide emphasizing computation/communication ratio.
13. Specialization/data-movement guide with CPU-only base path and optional GPU extension.
14. Week 14 architecture-decision brief.
15. Tiny plot-reading guide: axes, units, repeated trials, noise, scale, correlation versus mechanism.

These RED/YELLOW bridges are where **the course becomes the textbook**.

## 10. What can Prompt 003 and Prompt 004 now treat as settled?

### Prompt 003 may treat as settled

- RISC-V remains the teaching ISA.
- A containerized/cross-platform GCC + QEMU path is pedagogically legitimate; Cornell 2026 is a current benchmark, not a template to copy.
- official tool docs are the truth layer.
- machine-readable receipts are preferred.
- matplotlib is the visualization instrument.
- Tectonic is a strong candidate for the PDF path, but implementation remains Prompt 003's decision after testing.
- OpenMP is the first-line shared-memory candidate.
- MPI is optional and justified only if its measured teaching value exceeds setup friction.
- a non-root communication-delay path is required whether or not MPI is used.

### Prompt 004 may treat as settled

- do not conduct another textbook search per week;
- use the durable canon/map to select references;
- required student explanation is course-owned where the canon says RED or YELLOW;
- Berkeley is link-only;
- MIT adaptations require deliberate CC BY-NC-SA handling;
- primary specs verify claims but are not automatically assigned as reading;
- every major sensory adjective needs conceptual + measurement support;
- Week 5/14 market evidence must be dated;
- Week 14 ends the technical course.

# Current-source verification notes

This pass verified the following against current official/public sources on 2026-08-16:

### RISC-V

The Ratified Specifications Library currently identifies **v20260120 (January 2026)** for the core Unprivileged and Privileged ISA libraries. RISC-V specification pages identify CC BY 4.0 licensing.

**Use:** normative truth, selectively adapted/reference material, not sole teaching surface.

### MIT OCW

MIT OCW's current terms identify CC BY-NC-SA 4.0 and explicitly permit noncommercial adaptation/remixing with attribution and ShareAlike.

**Use:** strongest broad adaptable university/OER ingredient in the canon.

### Berkeley CS61C

The 2026 notes explicitly identify CC BY-NC-ND 4.0, and the Spring/Summer 2026 course continues a modern RISC-V/CPU/pipeline/caches/parallelism/VM sequence.

**Use:** excellent student link/reference and contemporary course benchmark; no remixing.

### Cornell CS3410 Spring 2026

Current infrastructure documentation uses a Docker container containing the course's RISC-V compilation/execution stack and gives Windows/WSL, macOS and Linux paths. Their demonstrated flow compiles with GCC and runs the resulting RISC-V executable through QEMU.

**Use:** high-value implementation benchmark for Prompt 003; do not clone their course image or assignments without need/license review.

### Cambridge 2025-26

Current Introduction to Computer Architecture coverage includes RISC-V and a broader architecture sequence. The linked ECAD+Architecture practical uses the Clarvi simple RV32I processor, Spike ISA simulation and cycle-accurate simulation. Some course handouts are restricted to the Cambridge domain.

**Use:** coverage and practical benchmark, link-first.

### Nand2Tetris

Project 5 builds Memory, CPU and the complete Hack hardware platform.

**Use:** preserve the build-the-machine pedagogical instinct; do not substitute Hack for our RISC-V spine.

### Parallel tooling

Current OpenMP material provides the 6.0 specification plus current examples. Open MPI documentation explicitly describes multi-process MPI jobs on one laptop/workstation.

**Use:** OpenMP first-line required candidate; MPI optional communication instrument pending Prompt 003 testing.

### QEMU

Current QEMU documentation describes user-mode execution of binaries compiled for another CPU architecture and separate RISC-V system emulation.

**Use:** strong RISC-V execution tool candidate. Do not mistake emulator timing for real RISC-V hardware performance.

### Tectonic / Matplotlib

Tectonic identifies its codebase as MIT-licensed, with other bundled TeX components under their respective open-source licenses. Matplotlib remains the standard official Python plotting surface.

**Use:** strong implementation candidates; course-owned wrappers keep syntax from becoming the assignment.

### CUDA

The current CUDA Programming Guide (updated May 2026 in the current documentation) directly covers SIMT execution, GPU memory spaces, coalesced access and host/device data movement.

**Use:** official Week 13 optional truth/reference layer. No GPU requirement.

# GREEN / YELLOW / RED week matrix

| Week | Class | Canon decision |
|---|---|---|
| 1 | GREEN | Shared SWOSU Success Foundations; do not fork. |
| 2 | YELLOW | Shared AI Fluency + Architecture-owned verification lab. |
| 3 | YELLOW | Official container docs + Cornell benchmark; SWOSU reproducibility path is ours. |
| 4 | YELLOW | Excellent primary tool docs; Machine Telescope card is ours. |
| 5 | **RED** | Machine Dossier + PC build + economics + current evidence must be SWOSU-owned. |
| 6 | YELLOW | GREEN RISC-V truth; student bridge from values to instructions is ours. |
| 7 | YELLOW | Strong ingredients; bounded coherent RISC-V CPU experience is ours. |
| 8 | YELLOW | Strong concepts; sensory performance experiment/plot is ours. |
| 9 | **RED** | One course-owned specimen must integrate the layers. |
| 10 | YELLOW | Strong cache sources; sensory memory harness/plot is ours. |
| 11 | YELLOW | Strong VM/OS sources; Linux-to-architecture bridge is ours. |
| 12 | YELLOW | Strong parallel sources; scaling/communication harness is ours. |
| 13 | YELLOW | Strong vector/GPU references; CPU-first comparison and data-movement story are ours. |
| 14 | **RED** | Student's own dossier + current evidence drives synthesis. |
| 15 | GREEN | Wind-down; no new technical source layer. |
| 16 | GREEN | Shared Farkle + ML package; no Architecture capstone. |
| 17 | GREEN | Course-owned evidence-backed reflection. |

# Licensing and permanence risks

## Reuse posture

The course must continue to separate:

- **free to read**;
- **licensed to adapt**;
- **open-source software code**;
- **official/vendor documentation**;
- **current market evidence**.

They are not interchangeable categories.

## Fragility

Higher-risk sources include:

- semester-specific university URLs;
- market/retailer prices;
- specific vendor product pages;
- current tool-version documentation;
- course pages that may later require institutional authentication.

Mitigation:

- course-owned explanations are the main student surface;
- primary specifications establish truth;
- external links are validation/enrichment rather than structural glue;
- every technical week validates its required links before LMS publication;
- source roles live in the CSV so a broken link can be replaced without redesigning the course.

# Reusable shared-curriculum candidates

These should be considered for promotion/reuse outside Architecture when implementation proves them stable:

- machine-readable investigation/evidence receipt schema;
- generic measurement hygiene + plot-reading micro-guide;
- matplotlib helper conventions;
- Tectonic/technical-report build scaffold if it proves portable;
- generic `archprobe`-style machine snapshot schema where useful across systems courses;
- non-root latency/delay experiment primitives;
- shared Farkle + ML package remains owned by the shared course-family source, not Architecture.

Architecture-specific items should remain here:

- Machine Dossier;
- PC-build/Dollars-Per brief;
- RISC-V datapath story;
- Week 9 integration specimen;
- Week 14 architect decision defense.

# Acceptance check

Prompt 002 acceptance conditions are satisfied:

1. every required Architecture week has a plausible no-paywall learning path;
2. sources are selected by role, not fame;
3. access and reuse rights are separated explicitly;
4. Week 5/14 current-spec/price evidence is date-stamped by doctrine;
5. every major sensory lab has conceptual + measurement support;
6. commercial resources remain optional;
7. paid AI/CLI and specialized hardware remain optional;
8. gaps are explicit authoring instructions;
9. Prompt 003/004 now have a bounded source contract and do not need to reopen curriculum research.

## Final handoff

**Prompt 002 is complete.**

Do not start Prompt 003 merely because this report exists. The next step begins only when Jeremy and ChatGPT deliberately pick it up.
