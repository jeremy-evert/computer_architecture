# Sidecar Prompt 004 - Author Weeks 5-14 of the Computer Architecture core

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** research -> dispatch bounded week work -> author -> execute labs -> review -> report

## Mission

Build the **entire technical Architecture runway: Weeks 5-14**.

These ten weeks must feel like one planned investigation, not ten textbook chapters.

Students enter Week 5 already able to use AI skeptically, reproduce an experiment, and interrogate Linux. They then build a Machine Dossier, stress one machine/workload story from multiple angles, and finish Week 14 able to defend a design decision from evidence.

**Week 14 is the technical finale.** Do not launch a hidden Week 16 Architecture capstone.

## Preconditions

Read:

- `AGENTS.md`
- `README.md`
- `planning/fall-2026-course-design.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/fall-2026-spine.md`
- `planning/week-05.md` through `planning/week-14.md`
- `docs/grading-model.md`
- `sidecar/PLANNING.md`
- Prompt 002 canon report when available
- Prompt 003 laboratory report when available

Prompt 002's canon and Prompt 003's lab are shared contracts. Do not claim sources/labs are ready until they are actually validated.

## Common weekly production contract

Each Week 5-14 should eventually contain:

### Monday - Think / Frame / Lecture

- shared AI Fluency lens;
- central architecture question;
- concise course-owned digest;
- LaTeX/Markdown source;
- Beamer/slide deck;
- instructor recording plan;
- prediction/hypothesis.

The recording may visibly use Jeremy's real AI/tool stack. Students are not required to reproduce it.

### Wednesday - Investigate / Break / Measure

- shared Professional Minds topic;
- hands-on sensory lab / trace / bounded build;
- supported environment instructions;
- machine-readable evidence where possible;
- standard experiment grammar: predict -> perturb -> run -> measure -> visualize -> explain -> revise.

### Friday - Explain / Defend / Stack Showcase

- shared Professional Minds topic;
- bounded individual evidence receipt;
- figure/table/trace when useful;
- one authentic professor Stack Showcase plan demonstrating where the idea leads.

## Accepted Week 5-14 spine

### Week 5 - Build the Machine

**Question:** What should I build for this workload, what does each part buy me, and how should I compare choices?

Required DNA:

- PCPartPicker-style compatibility build;
- workload/fun build;
- Dollars-Per comparisons;
- storage/memory hierarchy from cache outward;
- student-designed machine + observable machine;
- `archprobe` snapshot when available;
- Machine Dossier v0.

Do not reduce this to component identification.

### Week 6 - Bits Become Instructions

**Question:** What must software and hardware agree on for a program to run?

Coverage:

- binary/hex;
- signed/two's-complement;
- overflow;
- floating-point approximation at appropriate depth;
- bytes/endianness where useful;
- RISC-V registers/instructions/encodings;
- source -> assembly -> machine-visible state;
- ABI/calling convention only to useful depth.

Use the same small program/values from Week 5 where practical.

**Checkpoint 1:** light evidence chain across several layers.

### Week 7 - Crack Open the CPU

**Question:** What has to exist inside the CPU for one instruction to execute correctly?

Coverage:

- stored-program idea;
- PC/register file/ALU/memory;
- muxes/control;
- bounded single-cycle datapath/control;
- trace/build one instruction.

### Week 8 - Make It Fast Without Breaking It

**Question:** Why does overlap improve performance, and why does it create new problems?

Coverage:

- latency vs throughput;
- CPU-time/CPI basics;
- pipeline stages;
- data/control/structural hazards;
- forwarding/stalls/flushes;
- branch effects;
- sensory performance experiment;
- first matplotlib sensitivity plot.

### Week 9 - Follow the Program Down

**Question:** Can I follow one small program through the stack without hand-waving?

Short Fall Break integration week.

Reuse Weeks 5-8 artifacts rather than adding major new theory.

**Checkpoint 2:** source -> representation -> ISA -> processor/performance evidence.

### Week 10 - Make the Memory Hierarchy Hurt

**Question:** Why do we need layers of memory, and what does crossing a layer feel like?

Coverage/experience:

- temporal/spatial locality;
- cache lines/blocks;
- mapping/associativity/replacement at useful depth;
- hits/misses/AMAT;
- pointer chase vs streaming or equivalent;
- varying working-set size;
- latency vs bandwidth;
- measured cache/locality cliffs;
- plot(s) added to Sensitivity Profile;
- revisit Dollars-Per and Time-Per.

### Week 11 - The Useful Lie of Memory

**Question:** What hardware mechanisms create the memory/process world software thinks it sees?

Coverage:

- virtual vs physical addresses;
- page tables/TLB;
- protection/privilege;
- page faults;
- traps/exceptions/syscalls;
- interrupts;
- I/O/device path at introductory depth;
- sequential/random or storage/I/O observation where practical.

Do not turn this into a full OS course.

### Week 12 - More Cores, More Problems

**Question:** When does adding workers help, and when does cooperation cost more than it buys?

Coverage/experience:

- Amdahl;
- thread/data parallelism;
- shared memory;
- synchronization;
- cache coherence;
- false sharing;
- communication-to-computation ratio;
- workload with substantial local work versus deliberately chatty/dependent work;
- controlled added communication/synchronization delay where possible;
- scaling plot.

MPI may be used when Prompt 003 proves a humane path. MPI itself is not the learning objective.

### Week 13 - Different Machines for Different Work

**Question:** When does the workload justify a different kind of machine?

Coverage:

- SIMD/vector;
- GPU/SIMT;
- throughput orientation;
- data movement/bandwidth;
- accelerators/tensor/ML shapes;
- setup/transfer cost;
- CPU-only required comparison path;
- optional GPU/accelerator path.

### Week 14 - Sit in the Architect's Chair

**Question:** Given a workload and budget, what should I build now, and what evidence changed my mind?

Students return to the Week 5 design and defend changed or retained choices.

Use:

- performance;
- latency/throughput;
- memory/bandwidth;
- cost;
- power/energy where responsibly supported;
- programmability;
- specialization;
- security/reliability where appropriate;
- workload fit.

**Checkpoint 3:** final Machine Dossier redesign/defense.

**Freeze the dossier here. Architecture instruction ends here.**

## Machine Dossier rule

Do not create ten disconnected assignments.

Every week should ask whether the dossier should:

- add evidence;
- revise a claim;
- add a plot/trace;
- correct a naive metric;
- preserve a design choice with stronger evidence;
- or simply provide persistent context.

Do not force a dossier connection when it would be artificial.

## Sensory-lab rule

If students are expected to use an important word such as latency, bandwidth, locality, throughput, scalable, bottlenecked, or communication-heavy, try to attach it to a controlled experience.

The student should make a prediction before seeing the result.

## Source doctrine

Required path uses open/freely accessible sources and course-created material.

Use primary/official sources for technical claims where appropriate.

Commercial books may guide instructors but may not become a hidden dependency or copied source.

## Assessment contract

Use `docs/grading-model.md`.

Workers may author points/rubric criteria **within the accepted category structure only where the grading source explicitly allows it**, but must not invent due/late/drop mechanics.

Checkpoint cadence is frozen: Weeks 6, 9, 14.

## Dispatch guidance

Prefer one worker per week or one tightly coupled sister pair.

Do not let workers invent incompatible:

- lab runners;
- data formats;
- plotting conventions;
- dossier locations;
- lecture/deck formats;
- evidence receipts.

Prompt 003's lab and the planning contracts are shared infrastructure.

## Explicit non-goals

- no production Canvas writes;
- no commercial vendor dependency;
- no required paid AI/CLI;
- no required GPU/FPGA/Raspberry Pi;
- no Week 16 Architecture capstone;
- no giant custom CPU simulator without a demonstrated need.

## Required report

Write:

`sidecar/reports/004_author_weeks_05_14_architecture_core.md`

Include a readiness matrix for Weeks 5-14:

- lecture digest/deck/recording plan;
- AI Fluency integration;
- Professional Minds integration;
- student-facing open references;
- sensory lab/activity;
- actual execution validation;
- plot/visualization where relevant;
- Machine Dossier handoff;
- Friday Stack Showcase plan;
- evidence/rubric;
- fallback/accessibility;
- worker/commit;
- remaining YELLOWs.

## Foreman acceptance

A week is accepted only if:

1. technical explanation is accurate;
2. required learning path has no paywall;
3. the experiment materially exposes the week's architecture idea;
4. instructions run in the supported lab;
5. evidence requires interpretation;
6. the week connects to the persistent machine story;
7. lecture/lab/showcase roles are obvious;
8. premium tooling is optional;
9. Week 14 ends the technical arc.

## Done when

Weeks 5-14 form one coherent, runnable, evidence-driven Architecture investigation culminating in the frozen Week 14 Machine Dossier.
