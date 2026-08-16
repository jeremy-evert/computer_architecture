# COMSC-3013 Open-Source / Free Resource Canon

**Status:** ACCEPTED AUTHORING CANON - 2026-08-16  
**Purpose:** durable source strategy for Fall 2026 Computer Architecture  
**Required-student path:** no commercial textbook, no zyBooks, no paid AI, no specialized hardware

## Canon decision

Computer Architecture will **not** replace one commercial textbook with one free textbook.

The course will use a deliberately curated mosaic:

1. **primary/open specifications** for what is actually true;
2. **openly licensed university/OER material** where adaptation is legally and pedagogically useful;
3. **public university course notes/practicals** as link-first learning and instructor benchmarks when reuse rights are not broad;
4. **official open-source tool documentation** for commands and interfaces;
5. **course-owned explanations, diagrams, traces, sensory labs, plotting scaffolds, and Machine Dossier prompts** to make the pieces coherent for SWOSU students.

This is a feature, not a compromise. The course itself is the coherent textbook and laboratory guide.

## Source-use labels

- **ADAPT** - reuse/adaptation is supported by an identified license; preserve required attribution/license terms.
- **LINK** - public/free consumption is useful, but do not copy/adapt the instructional content into our course unless a compatible license is later verified.
- **PRIMARY** - official specification/documentation; quote sparingly, link freely, and write our own student explanation around it.
- **TOOL** - official tool documentation or open-source software; use according to its software/documentation license.
- **CURRENT EVIDENCE** - time-sensitive vendor/market/spec evidence that must be date-stamped rather than baked into permanent doctrine.

## Anchor sources

| ID | Source | Role | Access / reuse posture | Best weeks |
|---|---|---|---|---|
| RV-SPEC | RISC-V Ratified Specifications Library, `https://docs.riscv.org/reference/home/index.html` | Normative ISA/privileged/vector truth | **PRIMARY + ADAPT. CC BY 4.0.** January 2026 ratified library is the stable reference. | 6, 11, 13 |
| RV-SRC | RISC-V ISA Manual source, `https://github.com/riscv/riscv-isa-manual` | Specification source and attributable diagrams/text where useful | **ADAPT. CC BY 4.0.** | 6, 11, 13 |
| MIT-6004 | MIT OCW 6.004 Computation Structures, `https://ocw.mit.edu/courses/6-004-computation-structures-spring-2017/` | Structural thinking: gates -> ISA -> CPU -> pipeline -> VM -> parallelism | **ADAPT with care. MIT OCW is CC BY-NC-SA 4.0.** Attribution and ShareAlike apply to adapted OCW material. | 6-13 |
| MIT-6004-LABS | MIT 6.004 labs, `https://ocw.mit.edu/courses/6-004-computation-structures-spring-2009/pages/labs/` | Instructor benchmark for bounded build/trace experiences | **ADAPT with care. CC BY-NC-SA 4.0.** Do not wholesale transplant assignments; extract design ideas and author SWOSU-native labs. | 7, 11 |
| B61C-NOTES | UC Berkeley CS61C 2026 Course Notes, `https://notes.cs61c.org/` | Excellent modern explanations of representation, RISC-V, CPU, pipeline, caches, performance, VM | **LINK ONLY for course adaptation. CC BY-NC-ND 4.0.** Free consumption is allowed; derivatives are not. | 6-11 |
| B61C-2026 | UC Berkeley CS61C Spring/Summer 2026 course schedule/site, `https://cs61c.org/sp26/` / `https://cs61c.org/su26/` | Coverage/sequencing benchmark and public links | **LINK.** Reuse rights for each artifact vary; do not assume. | 6-13 |
| CORNELL-3410 | Cornell CS3410 Spring 2026, `https://www.cs.cornell.edu/courses/cs3410/2026sp/` | Strong modern systems/architecture sequence with text notes and labs | **LINK.** Public access; no broad reuse license identified in this pass. | 6, 7, 10-12 |
| CORNELL-INFRA | Cornell CS3410 infrastructure, `https://courses.cs.cornell.edu/cs3410/2026sp/course/infra.html` | Evidence that Docker + GCC + QEMU is a first-class RISC-V course path | **LINK / INSTRUCTOR BENCHMARK.** Do not clone their container blindly. | 3, 6 |
| CAM-ARCH | Cambridge Introduction to Computer Architecture 2025-26, `https://www.cl.cam.ac.uk/teaching/2526/IntComArch/` | Coverage benchmark: RISC-V, pipeline, caches, OS support, multicore, GPUs | **LINK.** Public syllabus; some detailed handouts are Cambridge-domain restricted. | 6-13 |
| CAM-CLARVI | Cambridge ECAD+Architecture RISC-V practical, `https://www.cl.cam.ac.uk/teaching/2526/ECAD%2BArch/riscvtutorial.html` | Small RV32I processor + Spike + cycle-accurate simulation benchmark | **LINK / INSTRUCTOR BENCHMARK.** | 6-8 |
| NAND-PROJ | Nand2Tetris projects, `https://www.nand2tetris.org/` | Build-the-machine inspiration; especially Boolean logic and Project 5 CPU/Computer | **LINK for instructional text/projects unless reuse rights are separately verified.** | 7 |
| NAND-SIM | Nand2Tetris simulator source, `https://github.com/nand2tetris/nand2tetris_simulator` | Open hardware-simulation tooling reference | **TOOL. GPL v2 or later.** | 7 |
| LINUX-PROC | Linux kernel `/proc` documentation, `https://docs.kernel.org/filesystems/proc.html` | Primary source for machine/process/memory observation | **PRIMARY / LINK.** | 4, 5, 11 |
| GDB | GNU GDB documentation, `https://sourceware.org/gdb/current/onlinedocs/` | Registers, memory, stepping, state inspection | **TOOL / PRIMARY.** | 4, 6, 9 |
| BINUTILS | GNU Binutils/readelf documentation, `https://sourceware.org/binutils/docs/binutils/readelf.html` | ELF/binary inspection and toolchain evidence | **TOOL / PRIMARY.** | 4, 6, 9 |
| GCC-RV | GCC RISC-V options, `https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html` | Compiler target/ABI truth | **TOOL / PRIMARY.** | 6, 9, 13 |
| QEMU | QEMU user/RISC-V documentation, `https://qemu.readthedocs.io/en/master/user/` and `https://qemu.readthedocs.io/en/master/system/target-riscv.html` | Cross-architecture execution and RISC-V emulation | **TOOL. QEMU/manual are GPL-family; use/link per project license.** | 3, 6, 11 |
| DOCKER | Docker official concepts/get-started docs, `https://docs.docker.com/get-started/` | Container/image concepts and supported setup | **TOOL / LINK.** Course should remain runtime-neutral where practical. | 3 |
| MPL | Matplotlib official docs, `https://matplotlib.org/stable/` | Standard plotting instrument for measurement evidence | **TOOL / LINK.** Course owns its plotting helpers. | 5, 8, 10, 12-14 |
| TECTONIC | Tectonic official docs, `https://tectonic-typesetting.github.io/book/` | Reproducible/small-footprint LaTeX -> PDF path | **TOOL. Tectonic code is MIT licensed; bundled TeX components carry their own licenses.** | 5-14 |
| OPENMP | OpenMP specifications/examples, `https://www.openmp.org/specifications/` | Portable shared-memory parallelism reference | **PRIMARY / LINK.** | 12 |
| OPENMPI | Open MPI documentation, `https://docs.open-mpi.org/en/v5.0.x/` | Optional local/multi-process communication/scaling instrument | **TOOL / LINK.** Local multi-process jobs are officially supported. | 12 |
| CUDA | NVIDIA CUDA Programming Guide, `https://docs.nvidia.com/cuda/cuda-programming-guide/` | Official SIMT/GPU/memory/data-movement explanation | **PRIMARY / LINK.** Vendor documentation; not required for CPU-only students. | 13 |

## Current-price and real-machine evidence policy

### Week 5 and Week 14 are date-stamped by design

Prices, product availability, cache sizes, core counts, memory capacities, SSD prices, GPU pricing, and cloud/storage pricing change. The course must **not** embed one August 2026 shopping table as timeless truth.

For a live Machine Dossier build:

1. students choose a dated observation window;
2. a PC-part aggregation/builder such as PCPartPicker may be used as the shopping/workflow surface;
3. architecture/spec claims should be verified against the component manufacturer's official product/specification page where practical;
4. purchase price evidence comes from the actual retailer/aggregator visible at that time and is captured with date/source;
5. students separate **observed market price** from **architectural property**;
6. Week 14 may use a fresh snapshot so market drift itself is not confused with learning.

### Do not fake retail economics for on-die cache

L1/L2/L3 cache is not normally purchased as a separable retail storage product, so a literal retail `$ / GB` number for cache would create false precision.

The historical **Dollars Per** instinct remains excellent, but the course should teach two different economic questions:

- **retail capacity economics** for RAM / NVMe / SSD / HDD / cloud or network storage, where price-per-capacity is meaningful;
- **architectural scarcity/tradeoff economics** for registers/cache/on-die structures, where silicon area, access latency, power, associativity, locality, and total chip/package cost matter more than a fake shelf price per byte.

That distinction is itself an important Week 5 learning outcome.

## Week-by-week canon and gap decision

### Week 1 - Success Foundations

**Classification: GREEN via shared SWOSU curriculum.**

Architecture authors should not create a separate open-resource canon for Week 1. Reuse the universal kickoff source already shared across CS1/CS2/DSCT.

### Week 2 - AI Laboratory Training

**Classification: YELLOW / course-owned core.**

The provider-neutral epistemic workflow is part of the shared AI Fluency curriculum, not a vendor tutorial.

Course-owned bridge must teach:

- claim/question framing;
- context gathering;
- AI suggestion vs evidence;
- verification against commands/spec/docs/measurements;
- revision after evidence.

External AI-provider documentation may be optional examples, never the required truth layer.

### Week 3 - Containers & Repeatability

**Classification: YELLOW.**

Use Docker's official image/container concepts and Cornell's 2026 infrastructure as evidence that a containerized RISC-V course can be ordinary teaching infrastructure.

Course-owned bridge is required because:

- students may use Docker, Podman, WSL2, or a fallback path;
- we care about reproducibility, not Docker trivia;
- exact commands must match Prompt 003's tested environment.

### Week 4 - Linux as a Machine Telescope

**Classification: YELLOW.**

Primary references:

- Linux kernel `/proc` docs;
- GNU GDB;
- GNU Binutils/readelf;
- standard command man pages in the selected environment.

Course-owned deliverable: a small **Machine Telescope reference card** organized by questions, not commands:

- What CPU/ISA am I on?
- How much memory does the system/process see?
- What is this file/binary?
- What processes are running?
- What mappings/state can I inspect?

### Week 5 - Build the Machine

**Classification: RED / course-owned.**

No single durable open source provides the lesson we want.

External evidence is deliberately heterogeneous and current:

- PC-building/compatibility surface;
- official CPU/motherboard/RAM/storage/GPU specs;
- dated retailer/market prices;
- system observation from the student's actual machine;
- later Prompt 003 `archprobe` output.

Course-owned lecture/lab must teach:

- compatibility and interfaces;
- workload fit;
- bottleneck thinking;
- capacity/cost hierarchy;
- latency vs bandwidth as different axes;
- retail Dollars-Per vs architectural scarcity;
- how to date and cite current hardware evidence.

**Do not turn this into shopping trivia.**

### Week 6 - Bits Become Instructions

**Classification: YELLOW with GREEN primary truth.**

Primary truth:

- RISC-V January 2026 ratified specification, CC BY 4.0;
- GCC RISC-V options/ABI docs;
- GDB/Binutils/QEMU docs.

Student-friendly references:

- Berkeley 2026 notes (**link only; ND license**);
- Cornell 2026 RISC-V notes (**link only unless license changes**);
- Cambridge RISC-V practical as instructor benchmark.

Course-owned bridge:

**value -> representation -> source operation -> RISC-V instruction -> encoding/register/memory state -> observed result**

Keep floating-point arithmetic at intuitive/observational depth here; representation formats can recur in Week 13 as architecture choices.

### Week 7 - Crack Open the CPU

**Classification: YELLOW.**

Strong ingredients:

- MIT 6.004, remixable CC BY-NC-SA;
- Nand2Tetris build-the-computer spirit;
- Berkeley single-cycle CPU notes, link only;
- Cornell CPU simulator idea, link only;
- Cambridge Clarvi as a small real RV32I implementation benchmark.

Course-owned bridge needed because our student should not have to translate among Beta, Hack, Berkeley's presentation, Cornell's simulator, and Clarvi unaided.

Author one deliberately bounded **RISC-V-flavored CPU path** that makes PC, register file, ALU, memory, decode/mux/control necessary.

Goal: build/trace enough that the pieces acquire meaning. Do not import an HDL course.

### Week 8 - Make It Fast Without Breaking It

**Classification: YELLOW.**

Use:

- Berkeley pipeline/performance notes (link only);
- MIT pipeline material (adaptable under OCW terms);
- Cambridge Clarvi/pipeline performance exercises as instructor benchmark.

Course-owned sensory lab:

- dependent vs independent operations;
- latency vs throughput;
- pipeline overlap;
- hazards/stalls/forwarding;
- CPI/CPU-time reasoning;
- first standard matplotlib sensitivity curve.

### Week 9 - Follow the Program Down

**Classification: RED / course-owned integration checkpoint.**

External sources verify individual layers; the actual learning object must be ours.

One tiny program/data story should travel through:

**source -> compiler/toolchain -> representation -> RISC-V -> processor/pipeline evidence**

Do not assign five unrelated readings and call their conjunction integration.

### Week 10 - Make the Memory Hierarchy Hurt

**Classification: YELLOW.**

Concept references:

- Berkeley caches notes (link only);
- Cornell caches notes (link only);
- MIT cache material (adaptable under OCW terms).

Course-owned sensory lab is non-negotiable:

- pointer-chase/dependent access to make latency visible;
- streaming access to make bandwidth visible;
- controlled working-set growth to reveal hierarchy cliffs;
- CSV/JSON receipts;
- matplotlib plot with measured transition regions;
- cautious interpretation because real cache/prefetch/TLB behavior is messy.

The student's plot matters more than a memorized nanosecond table.

### Week 11 - The Useful Lie of Memory

**Classification: YELLOW.**

Primary/strong references:

- Linux kernel `/proc` and process mapping docs;
- RISC-V privileged architecture;
- MIT VM/system-interface material;
- Cornell processes/syscalls/interrupts/VM notes;
- Berkeley VM notes (link only).

Course-owned bridge should connect observable process behavior to:

- virtual vs physical addressing;
- page tables/TLB;
- protection/privilege;
- page faults;
- traps/syscalls/interrupts;
- devices/I/O.

Avoid a full OS survey.

### Week 12 - More Cores, More Problems

**Classification: YELLOW.**

Strong references:

- Cornell 2026 synchronization/atomics/parallelism/performance;
- Berkeley parallelism/Amdahl material;
- OpenMP official specification/examples;
- Open MPI official docs if the MPI route survives Prompt 003.

Open MPI officially supports launching multiple MPI processes on one workstation/laptop, so MPI can be an optional/portable **communication-cost instrument** without requiring a cluster.

Course-owned sensory lab should compare at least two workload shapes:

- substantial local/independent work between coordination points;
- deliberately chatty or synchronization-heavy work.

Perturb:

- worker count;
- synchronization frequency;
- communication delay using a non-root course harness;
- workload grain size.

Measure and plot runtime/speedup. Teach **computation-to-communication ratio**, not "MPI syntax week."

### Week 13 - Different Machines for Different Work

**Classification: YELLOW.**

Primary/strong references:

- RISC-V V extension, CC BY 4.0;
- current NVIDIA CUDA Programming Guide for SIMT, memory spaces, and data movement;
- Cambridge GPU coverage benchmark;
- OpenMP device/vector concepts where useful.

Required course path remains CPU-only.

Course-owned experiment should preserve one workload and compare organizations/implementations such as scalar vs vectorized/parallel CPU, with GPU as optional evidence where available.

Important concepts:

- SIMD/vector vs SIMT;
- throughput-oriented design;
- memory bandwidth;
- setup/transfer/data-movement cost;
- workload shape;
- FP32/FP16/BF16/int8 as architecture/data choices when useful.

### Week 14 - Sit in the Architect's Chair

**Classification: RED / course-owned synthesis.**

Students return to the Week 5 machine and use **fresh, date-stamped current evidence** plus their own measurements.

No external reading can replace the actual synthesis:

- original choice;
- current choice;
- changed or deliberately unchanged;
- workload requirement;
- metric;
- evidence;
- accepted tradeoff.

Current official vendor specs are evidence inputs, not permanent prose.

**Week 14 ends Architecture technical instruction.**

### Week 15 - Thanksgiving Wind-Down

**Classification: GREEN / no new canon needed.**

Curate/catch up. No new Architecture source layer.

### Week 16 - Shared Farkle + ML

**Classification: GREEN via shared course-family source once that package is accepted.**

Architecture may echo through observation but should not create a new reading/profiling/capstone canon.

### Week 17 - Reflection

**Classification: GREEN / course-owned reflection prompt.**

Use the frozen dossier/evidence trail. No new technical source layer.

## Sensory-lab source matrix

| Phenomenon | Conceptual anchors | Measurement/tool anchors | Course-owned work required |
|---|---|---|---|
| latency vs throughput | Berkeley/MIT/Cambridge pipeline material | compiler/timing harness, pipeline model | Yes - Week 8 experiment + plot |
| memory latency vs bandwidth | Berkeley/Cornell/MIT caches | native C timing + machine snapshot | Yes - pointer chase + stream harness |
| cache/locality cliffs | Berkeley/Cornell/MIT caches | working-set sweep + cache topology | Yes - normalized runner + plot |
| VM/process abstraction | MIT/Cornell/Berkeley VM + RISC-V privileged | Linux `/proc`, mappings, faults where safe | Yes - guided observation path |
| multicore scaling | Cornell/Berkeley + OpenMP | OpenMP/native threads, timing runner | Yes - controlled scaling workloads |
| communication sensitivity | Cornell parallelism + Open MPI docs | optional MPI and/or course delay harness | Yes - non-root delay model mandatory |
| specialization/data movement | RISC-V V + CUDA official guide | scalar/vector CPU; optional GPU | Yes - CPU baseline and optional accelerator path |

## Course-owned textbook pieces to author

These are not gaps to apologize for. They are where this course becomes coherent.

1. **Week-at-a-Glance / central-question page** for each week.
2. **Monday lecture digest** that can compile into slides/recording notes.
3. **Machine Telescope card** organized by questions/evidence.
4. **Machine Dossier guide + schema**.
5. **Build-the-Machine / Dollars-Per guide**, including the retail-vs-architectural-economics distinction.
6. **RISC-V bridge chapter/reference card** scoped to the instructions/encodings actually used.
7. **SWOSU bounded datapath diagram/trace** using one consistent RISC-V story.
8. **Pipeline timing visualizer/worksheet** aligned with the sensory lab.
9. **Source-to-CPU integration specimen** for Week 9.
10. **Memory Sensory Lab guide** with measurement hygiene and plot interpretation.
11. **VM/OS mechanism bridge** that ties Linux evidence to architecture.
12. **Parallel Sensory Lab guide** emphasizing computation/communication ratio.
13. **Specialization/data-movement guide** with CPU-only baseline and optional GPU extension.
14. **Week 14 architecture-decision brief**.
15. **Plot-reading micro-guide:** axes, units, repeated trials, noise, misleading scales, correlation vs mechanism.

## Reuse / licensing rules for authors

### Safe adaptation candidates

- RISC-V specification source under CC BY 4.0, with attribution.
- MIT OCW material under CC BY-NC-SA 4.0, with attribution, noncommercial use, and ShareAlike requirements.
- GPL/MIT/BSD licensed tool code when its license and integration consequences are deliberately accepted.

### Link-first sources

- Berkeley CS61C 2026 notes: **CC BY-NC-ND 4.0 - do not adapt/remix.** Link or cite.
- Cornell CS3410 public notes/labs: link; no broad reuse license was identified in this pass.
- Cambridge public course/practical pages: link; do not assume public visibility grants adaptation rights.
- vendor documentation such as NVIDIA CUDA: link/cite as official technical reference.
- Nand2Tetris instructional project pages: link and use as inspiration unless a compatible content license is separately verified; simulator source has its own GPL license.

## Authoring rule

When a source is excellent but legally or pedagogically wrong to transplant, **write our own explanation from first principles and cite the source used to verify it.**

That is the default shape of this course.
