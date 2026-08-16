# Sidecar Prompt 002 - Build the open-source Computer Architecture canon

**Status:** COMPLETE - 2026-08-16  
**Owner:** ChatGPT / current helm  
**Mode executed:** research -> licensing/access check -> week mapping -> sensory-lab support -> gap analysis -> report

**Accepted outputs:**

- `planning/open-source-resource-canon.md`
- `planning/open-source-resource-map.csv`
- `sidecar/reports/002_build_open_source_architecture_canon.md`

## Why we needed Prompt 002

Prompt 001 made the course structurally coherent. Prompt 002 makes it **source-coherent**.

The design conversation produced a rich mental model of the course: Weeks 1-4 build the investigator; Weeks 5-14 open and stress the machine; the Machine Dossier carries evidence forward; important architecture adjectives should be attached to experiences; Python/matplotlib makes behavior visible; LaTeX turns evidence into a durable technical artifact; Week 14 is the technical finale; Weeks 15-17 wind down.

That design memory cannot remain only in Jeremy and ChatGPT's conversation history. Before implementation accelerates, the source implications must exist in Git so later authoring does not drift back toward:

- one textbook silently becoming the curriculum;
- a pile of famous links with no pedagogical hierarchy;
- technically correct sources that are too dense for our students;
- public material being copied as though public meant openly licensed;
- sensory labs being invented without trustworthy conceptual or measurement references;
- volatile hardware prices/specifications being treated as timeless facts;
- multiple authors independently researching the same topic and producing incompatible source stacks.

Prompt 002 is the **memory-transfer and source-selection pass** between course design and construction.

Its job was not to make a bibliography. Its job was to decide **what we trust for truth, what students should actually consume, what we may legally adapt, what remains link-first, and what we deliberately author ourselves**.

## Questions Prompt 002 had to answer

1. **What is the strongest truth source for each technical concept?**
2. **What source should a student actually read/watch/use, rather than merely what an expert instructor respects?**
3. **Which public sources are legally adaptable, and which must remain link-first references?**
4. **Where is the open landscape too fragmented, advanced, vendor-shaped, or pedagogically wrong for this course?**
5. **What source pair supports each sensory lab?** One explains the mechanism; another supports the measurement/tool path.
6. **How do Weeks 5 and 14 use current specifications and prices without baking temporary market facts into permanent doctrine?**
7. **How do we preserve Dollars-Per without fabricating fake economics for on-die cache?**
8. **Which sources support one continuous machine story rather than resetting context every week?**
9. **What should become durable course-owned explanation, diagrams, traces, cards, datasets, plotting helpers, and lab guides?**
10. **What can Prompt 003 and Prompt 004 now treat as settled so they can build instead of re-researching?**

The accepted report answers all ten explicitly.

## Mission that was executed

Build the strongest open/freely accessible source set for COMSC-3013 so the required course can stand on its own **without a commercial textbook or zyBooks dependency**.

The required canon had to tell later authors:

- what students can use for free;
- which primary/open source is strongest for truth;
- what license/access constraints apply;
- what supports each sensory experiment;
- how to handle current Week 5/14 specification and market evidence;
- what SWOSU should author because external material does not fit.

The governing idea is now durable:

> **The course itself is the coherent textbook and laboratory guide. External sources deepen, verify, and enrich it.**

## Settled source hierarchy

Use sources in this order of purpose, not as a popularity ranking:

1. **Primary specifications / official documentation** for truth.
2. **Openly licensed OER/university material** when legal adaptation actually improves the course.
3. **Current public university course materials** as student links or instructor benchmarks when reuse rights are narrower or unclear.
4. **Official open-source tool documentation** for commands/interfaces.
5. **Course-owned explanation and laboratory material** to make the pieces coherent for SWOSU students.

Publicly viewable does **not** mean openly reusable.

## Pinned doctrine preserved

Do not reopen:

- no required commercial textbook or zyBooks;
- no required paid AI subscription or premium CLI agent;
- no required GPU/FPGA/Raspberry Pi;
- CPU-only required path;
- free/accessible path has the same grading ceiling;
- RISC-V is planning-leading;
- Weeks 5-14 are the complete technical runway;
- Machine Dossier begins Week 5 and freezes Week 14;
- Week 16 is shared Farkle + ML application/fun, not an Architecture capstone or Checkpoint 4.

## Accepted canon shape

The course does **not** replace one commercial textbook with one free textbook.

It uses a mosaic:

- RISC-V specifications/ABI for normative architecture truth;
- MIT OCW where licensed adaptation is useful;
- Berkeley CS61C 2026 as excellent link-only contemporary teaching reinforcement;
- Cornell CS3410 2026 as a current integrated architecture/systems and infrastructure benchmark;
- Cambridge 2025-26 as a strong RISC-V-to-GPU coverage/practical benchmark;
- Nand2Tetris for build-the-machine pedagogical DNA without replacing RISC-V with Hack;
- Linux/GNU/QEMU/OpenMP/Open MPI/Matplotlib/Tectonic/CUDA official material for tool and mechanism truth;
- SWOSU-owned bridges and sensory labs as the main student experience.

See `planning/open-source-resource-map.csv` for source-by-source access, role, burden, strengths, limitations, permanence risk, and lab support.

## Week/gap decisions

- **GREEN:** Weeks 1, 15, 16, 17 because shared/course-owned source already defines the needed experience and no new Architecture reading spine is required.
- **RED:** Weeks 5, 9, 14 because the core learning object must be ours: Machine Dossier/build economics, source-to-CPU integration specimen, and final architecture judgment.
- **YELLOW:** Weeks 2-4 and 6-13 because strong sources exist but SWOSU-owned synthesis/scaffolding/labs are required.

A RED is an authoring instruction, not a failure.

## Sensory-lab source rule

For every major experimental adjective, later authors must identify:

1. a conceptual/truth source;
2. a measurement/tool source;
3. the SWOSU-owned controlled experiment that connects them.

Priority phenomena:

- latency vs throughput;
- dependent vs independent work;
- cache/locality cliffs;
- memory latency vs bandwidth;
- VM/process abstraction;
- worker-count/scaling behavior;
- communication/synchronization cost;
- setup/data-movement cost vs steady-state throughput.

## Week 5 / Week 14 current evidence rule

Prices and product specifications are time-sensitive evidence.

- date-stamp the observation;
- use PCPartPicker or an equivalent builder/aggregator as a convenient workflow surface, not architecture truth;
- verify material architecture/spec claims against official manufacturer sources where practical;
- capture actual observed market price separately from architectural properties;
- refresh Week 14 evidence instead of pretending Week 5 prices remain current.

### Dollars-Per correction

Literal retail price-per-capacity is useful for separately purchased RAM, SSD/NVMe, HDD, and appropriately scoped cloud/storage services.

Do **not** fabricate a retail `$ / GB` for L1/L2/L3 cache. On-die cache economics are taught through architectural scarcity: silicon area, latency, power, locality, organization/associativity, capacity, and total design/package cost.

## Course-owned pieces now explicitly required

1. weekly central-question / Week-at-a-Glance pages;
2. Monday lecture digests/decks;
3. Machine Telescope reference card;
4. Machine Dossier guide/schema;
5. Build-the-Machine / Dollars-Per + architectural-scarcity guide;
6. bounded RISC-V bridge/reference card;
7. one consistent SWOSU RISC-V datapath/trace model;
8. pipeline timing visualizer/worksheet;
9. Week 9 source-to-CPU specimen;
10. Memory Sensory Lab guide;
11. VM/OS mechanism bridge;
12. Parallel Sensory Lab guide;
13. specialization/data-movement guide with CPU-only base path;
14. Week 14 architecture-decision brief;
15. plot-reading / measurement-hygiene micro-guide.

## Downstream contract

### Prompt 003 may treat as settled

- RISC-V curriculum choice;
- official tool docs as truth layer;
- a containerized GCC + QEMU path is pedagogically legitimate but must be independently implemented/tested;
- machine-readable measurement receipts are preferred;
- matplotlib is the plotting instrument;
- Tectonic is a strong PDF-build candidate pending technical validation;
- OpenMP is the first-line shared-memory candidate;
- MPI is optional and survives only if setup friction is justified by learning value;
- non-root communication-delay capability is required whether or not MPI is chosen.

### Prompt 004 may treat as settled

- no independent textbook hunt per week;
- use the canon/map for source selection;
- write course-owned explanation wherever the gap map says RED/YELLOW;
- Berkeley is link-only;
- MIT adaptation requires deliberate CC BY-NC-SA compliance;
- primary specs verify claims but are not automatically student readings;
- sensory labs need conceptual + measurement support;
- Week 5/14 market evidence is dated;
- Week 14 ends the technical course.

## Completion

The detailed research findings, licensing decisions, current-source verification, GREEN/YELLOW/RED matrix, sensory-lab map, permanence risks, shared-curriculum candidates, and downstream handoff live in:

`sidecar/reports/002_build_open_source_architecture_canon.md`

**Prompt 002 is complete.**

Completion of this prompt does **not** authorize starting Prompt 003. The next workstream begins only when Jeremy and ChatGPT deliberately pick it up.
