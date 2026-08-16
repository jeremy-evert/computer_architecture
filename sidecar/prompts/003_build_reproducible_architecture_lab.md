# Sidecar Prompt 003 - Build the reproducible Computer Architecture laboratory

**Status:** OPEN - READY TO EXECUTE, but not started by this writing pass  
**Owner:** current helm / future executor  
**Mode when executed:** inspect -> decide -> prototype -> break -> measure -> smoke-test -> document -> report  
**Depends on:** Prompt 001 reconciliation + Prompt 002 accepted source canon

> **This file is the work order. Writing or revising it does not authorize executing Prompt 003.**

---

## Why we need Prompt 003

Prompt 001 made the course structurally coherent.

Prompt 002 made the course source-coherent. It settled what we trust for truth, what students should actually consume, what may be adapted, what remains link-first, and what SWOSU must author itself.

Prompt 003 now has to make the course **experiment-coherent**.

The Computer Architecture design depends on students doing more than reading accurate explanations. The course repeatedly asks them to make a machine behave differently, collect evidence, visualize what changed, and revise their model of the machine.

That only works if the semester has one dependable laboratory contract.

Without Prompt 003, later week authors will be tempted to invent their own:

- compilers;
- containers;
- RISC-V simulators;
- timing scripts;
- CSV formats;
- plotting conventions;
- machine probes;
- LaTeX builds;
- network-delay tricks;
- platform assumptions;
- fallback paths.

Then the course becomes ten laboratories wearing one trench coat.

Prompt 003 prevents that.

It should turn the design memory from Jeremy and ChatGPT's Architecture conversation into a small, durable, boring-in-the-best-way **scientific instrument** that Weeks 3-14 can trust.

The intended student experience is not:

> install seventeen tools, learn Docker, learn matplotlib, learn LaTeX, fight PATH, then maybe think about architecture.

It is:

> **ask a machine question -> run one clear command -> receive evidence -> perturb one thing -> run again -> plot the difference -> explain the shape.**

The infrastructure should disappear behind the investigation.

---

## The central design problem: two worlds, one laboratory

A reproducible container is excellent at controlling software versions and experimental setup.

A container is **not** automatically an honest description of the student's physical machine.

It may hide, virtualize, rename, restrict, or distort:

- host CPU topology;
- cache visibility;
- memory totals;
- storage devices;
- GPU access;
- kernel interfaces;
- privileged performance counters;
- network behavior.

Therefore Prompt 003 must deliberately separate two roles.

### 1. The Observatory - inspect the real machine

The Observatory answers:

> **What machine am I actually using, and what can I responsibly observe about it?**

It should provide a course-owned host-side probe or equivalent path that captures machine facts without requiring administrator/root access.

This is where Week 4 observation and Week 5 Machine Dossier facts come from.

### 2. The Experimental Chamber - control the experiment

The Experimental Chamber answers:

> **How can another student run substantially the same architecture experiment with the same software/tool assumptions?**

It may be a container/runtime image or another reproducible environment, but it exists to control experiments, not impersonate the host hardware.

This is where RISC-V tooling, common timing harnesses, plotting, report generation, and portable controlled experiments live.

### The rule

**Never silently substitute container-visible facts for host-machine facts when that distinction changes the architectural claim.**

If the environment cannot observe something honestly, report the limitation instead of inventing confidence.

That distinction is part of the course's epistemic doctrine:

> **AI can propose. Tools can report. Evidence still has scope.**

---

## Questions Prompt 003 must answer

1. **What is the smallest common laboratory students can actually use without the infrastructure becoming the course?**
2. **What belongs in the host Observatory, and what belongs in the reproducible Experimental Chamber?**
3. **What facts about a real machine can we collect portably and honestly without privileged access?**
4. **What RISC-V compile/inspect/run path is simple enough for Week 6 but rich enough to support Weeks 7-9?**
5. **How do all experiments emit one consistent, machine-readable evidence format that plotting and the Machine Dossier can consume?**
6. **How do we make latency, bandwidth, locality, scaling, synchronization, and data movement observable rather than vocabulary words?**
7. **How do we deliberately perturb one architectural constraint without requiring root, a cluster, a GPU, or Jeremy's private network?**
8. **How do we make plots nearly automatic so students reason about curves instead of memorizing matplotlib syntax?**
9. **How do we make a professional-looking LaTeX/PDF dossier nearly automatic so students reason about evidence instead of fighting typesetting?**
10. **What happens when a student's machine does not expose a clean cache cliff, GPU, performance counter, or other desired phenomenon?**
11. **What is our Windows/WSL2, Linux, macOS, Docker, and Podman support truth, and what remains honestly untested?**
12. **How do we tell the difference between real architectural behavior and benchmark noise, scheduler noise, virtualization artifacts, compiler optimization, caching, or measurement error?**
13. **What interfaces can Prompt 004 treat as stable so every week does not invent another runner, plotter, data format, and dossier convention?**
14. **What is the health check that tells a student, instructor, or future worker whether the laboratory is actually ready?**

If the execution report cannot answer these clearly, Prompt 003 is not done.

---

## Mission

Build and validate one coherent **Computer Architecture Laboratory** supporting:

- Week 3 Containers & Repeatability;
- Week 4 Linux as a Machine Telescope;
- Weeks 5-14 Machine Dossier work;
- native machine inspection;
- C/native compilation and binary inspection;
- RISC-V compilation, disassembly, state inspection, and execution;
- controlled sensory experiments;
- structured measurement receipts;
- Python/matplotlib visualization;
- scaffolded LaTeX/PDF publication;
- CPU-only multicore/scaling work;
- controlled communication-latency experiments;
- optional richer instructor/GPU/MPI demonstrations without making them student dependencies.

The result should be a **laboratory substrate**, not ten fully authored weekly labs.

Prompt 004 will build the actual weeks on top of the interfaces proven here.

---

## Read first

### Course truth

- `AGENTS.md`
- `README.md`
- `course_metadata.yaml`
- `planning/fall-2026-course-design.md`
- `planning/fall-2026-spine.md`
- `planning/architecture-arc-map.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `planning/week-03.md` through `planning/week-14.md`
- `docs/grading-model.md`
- `sidecar/PLANNING.md`

### Prompt 001 / 002 contracts

- `sidecar/reports/001_reconcile_course_source_chassis.md`
- `sidecar/prompts/002_build_open_source_architecture_canon.md`
- `sidecar/reports/002_build_open_source_architecture_canon.md`
- `planning/open-source-resource-canon.md`
- `planning/open-source-resource-map.csv`

### Shared infrastructure

Inspect sibling/shared repositories before inventing another foundation.

Look specifically for reusable patterns in:

- Course Foundry/shared curriculum infrastructure;
- CS1/CS2/DSCT environment/bootstrap work;
- existing Windows/WSL2 classroom support;
- any shared container/image/run/health-check conventions already proven.

Reuse a shared mechanism when it genuinely fits. Do not import unrelated machinery merely because it already exists.

---

## Settled doctrine inherited from Prompt 002

Do **not** reopen these unless implementation evidence proves a real conflict.

- RISC-V remains the planning-leading teaching ISA.
- Primary specs/official docs are the truth layer.
- Specs are not automatically the student teaching layer.
- Cornell's Docker + GCC + QEMU approach proves that a containerized RISC-V teaching path is pedagogically legitimate, but we build and validate our own path.
- Python/matplotlib is the plotting instrument.
- Tectonic is a strong LaTeX/PDF candidate, pending this prompt's actual technical validation.
- OpenMP is the first-line shared-memory candidate for required multicore work.
- MPI is optional and survives only if its educational value exceeds its setup friction.
- A non-root communication-delay mechanism is required whether or not MPI is chosen.
- GPU/accelerator tooling is optional enrichment only.
- Week 5/14 market prices are current evidence, not lab infrastructure constants.
- Required course work remains zero-cost beyond ordinary student computing/university infrastructure.

Prompt 003 does not conduct another textbook/source hunt. Research only implementation facts needed to choose or validate the laboratory stack.

---

## Non-negotiable student constraints

1. **CPU-only completion path.**
2. **No paid AI requirement.**
3. **No premium CLI-agent requirement.**
4. **No GPU requirement.**
5. **No FPGA/Raspberry Pi requirement.**
6. **No Jeremy-owned host/network dependency.**
7. **No root/admin requirement for the required lab path.**
8. **No leaderboard rewarding expensive hardware.**
9. **No requirement that a student's personal machine expose every phenomenon cleanly.**
10. **No silent grading advantage for premium hardware or tooling.**

A student on the supported ordinary-computer path must be able to demonstrate the same reasoning and earn the same grade.

---

# Part I - Define the laboratory contract before choosing toys

## Principle: one boring interface is better than five clever tools

Prefer a compact set of stable course interfaces over exposing every underlying program directly.

Possible command grammar to evaluate:

```bash
archlab doctor
archprobe snapshot
archlab run <experiment>
archplot <experiment> <receipt>
archlab dossier build
```

or an equivalently simple structure.

**These names are candidates, not promises.**

The executor may choose a better interface after prototype evidence.

But the final design should feel internally consistent.

A student should not need to remember that Week 8 uses one Python script, Week 10 a Makefile, Week 12 a shell script, and Week 14 an unrelated notebook.

---

## Prefer boring implementation technology

This laboratory will be maintained under semester pressure.

Favor:

- small scripts;
- plain C where native architecture behavior matters;
- Python where orchestration/data handling is clearer;
- JSON/CSV for receipts;
- ordinary Makefiles or another tiny runner if justified;
- command-line interfaces that work in a terminal;
- deterministic seeds/configuration where possible;
- readable source students can inspect if curious.

Avoid creating a framework whose architecture is harder to understand than the computer architecture it teaches.

---

# Part II - Build the Observatory

## `archprobe` or equivalent

Create a small course-owned probe that emits both:

1. **structured machine-readable evidence**; and
2. **a friendly human-readable summary**.

The probe should explicitly identify whether a field describes:

- the host;
- WSL/VM/container-visible environment;
- an unknown/unsupported scope.

### Candidate facts

Collect when safely and portably available:

- operating system;
- kernel/version;
- virtualization/container context where detectable;
- CPU architecture / ISA family;
- CPU model/vendor string;
- logical processors;
- physical cores where reliably exposed;
- sockets/packages where reliably exposed;
- cache hierarchy where reliably exposed;
- total visible memory;
- page size where useful;
- storage devices/filesystem facts at a bounded useful level;
- GPU/accelerator presence where safely detectable;
- relevant compiler/tool versions;
- timestamp;
- probe version;
- evidence source for each field where practical.

### Truth behavior

The probe must be allowed to say:

- `unknown`;
- `not exposed`;
- `container-visible only`;
- `host probe unavailable`;
- `platform not implemented`.

**Unknown is better than fabricated portability.**

### Security/privacy

Do not collect secrets, usernames, serial numbers, MAC addresses, public IPs, home paths, device identifiers, or other unnecessary personal/system-identifying information.

The Machine Dossier needs architecture evidence, not a forensic image of the student's computer.

---

# Part III - Build the Experimental Chamber

## Runtime decision

Evaluate the smallest coherent reproducible path for the required tools.

Priorities:

1. WSL2/Linux friendliness;
2. native Linux friendliness;
3. Docker/Podman compatibility where practical;
4. macOS feasibility;
5. simple installation/update story;
6. manageable image/download size;
7. no privileged runtime requirements;
8. predictable tool versions.

Do not assume Docker is available everywhere merely because Docker is familiar.

If one primary path and one fallback are materially better than pretending every runtime is identical, say so.

---

## Baseline native toolchain

Select the minimum useful set for:

- C compilation;
- optimization control;
- timing;
- binary/file inspection;
- ELF inspection;
- assembly/disassembly;
- debugging/register/memory inspection;
- system observation;
- build/run automation.

Likely families include:

- GCC and/or Clang;
- GNU Binutils;
- GDB;
- `file`;
- `xxd` and/or `od`;
- standard `/proc`/Linux utilities;
- Git where appropriate.

Do not install redundant tools merely because they are interesting.

---

# Part IV - Prove one RISC-V path

Prompt 004 needs one RISC-V laboratory contract, not a simulator tasting menu.

Select and smoke-test the smallest path that supports the learning arc:

### Week 6 needs

- compile a tiny C program or assembly fragment for RISC-V;
- inspect assembly;
- inspect encoding/object/binary information;
- run it;
- inspect relevant machine-visible state.

### Week 7 needs

- connect instruction semantics to a bounded datapath/control model;
- trace one familiar instruction through a teaching representation.

### Week 8 needs

- reason about overlap/hazards/performance without requiring a full industrial microarchitecture simulator.

### Week 9 needs

- reuse the same small specimen from source through compiled artifacts into instruction/processor evidence.

Candidates may involve:

- RISC-V GNU cross-toolchain;
- QEMU user-mode and/or a narrowly justified emulator/simulator;
- Spike where it materially improves instruction-level inspection;
- one small educational processor model/visualizer if required for datapath/pipeline teaching.

Choose based on the **whole Weeks 6-9 story**.

Do not select five tools that each solve one slide beautifully but produce a miserable student workflow.

---

# Part V - Establish one evidence-receipt format

Every sensory experiment should emit machine-readable evidence before it emits a picture.

Define a small schema/convention containing enough context to interpret a result later.

Candidate fields:

```text
experiment_id
experiment_version
timestamp
platform_scope
machine_snapshot_ref
parameters
trial_number
measurement_name
measurement_value
unit
compiler/tool version
optimization/settings
notes/warnings
```

The exact schema may differ.

What matters is that:

- data is not trapped in screenshots;
- units are explicit;
- plots consume the same receipt students submit/inspect;
- the dossier can cite/import evidence;
- experiment versions make later reproduction possible;
- warnings can record known noise/limitations.

Prefer CSV where tabular repeated trials are natural and JSON where nested context is useful.

Do not create a database because a CSV would do.

---

# Part VI - Build the sensory-lab substrate

The recurring grammar is frozen:

> **Predict -> Perturb -> Run -> Measure -> Visualize -> Explain -> Revise**

Prompt 003 must prove the substrate can support that grammar.

It does **not** need to finish every Week 5-14 student worksheet.

It does need representative experiments strong enough that Prompt 004 is not designing against imaginary infrastructure.

---

## A. Timing/performance substrate

Provide a sane common timing approach.

The platform should help authors account for:

- warmup when relevant;
- repeated trials;
- minimum useful runtime;
- timer resolution;
- compiler optimization;
- dead-code elimination;
- background/scheduler noise;
- virtualization/container effects;
- median/distribution rather than worshiping one lucky number.

Do not pretend student laptops are precision benchmarking laboratories.

We need trends strong enough to reason about architecture.

---

## B. Week 8 latency / throughput / dependency taste

Prototype one bounded experiment or model where students can distinguish:

- dependent work;
- more-independent/overlappable work;
- latency;
- throughput.

This may use native code, a pipeline model, or a combination.

The experiment must produce evidence that can become the first Sensitivity Profile plot.

The point is not to claim a modern superscalar CPU is a five-stage classroom pipeline.

The point is to attach the words **latency**, **throughput**, and **dependency** to an experience.

---

## C. Week 10 memory experiment - make the hierarchy hurt

This is a required proof point for the laboratory.

Prototype a memory experiment that can contrast at least:

### Dependent / pointer-chase behavior

Each access determines the next access.

Purpose: make access latency difficult to hide.

### Streaming / bulk behavior

Large contiguous work.

Purpose: expose bandwidth/throughput behavior.

### Working-set sweep

Run across increasing working-set sizes.

Purpose: allow students to discover regions/cliffs rather than receive a memorized latency table.

The harness should emit raw measurements and a plot-ready receipt.

The report must discuss:

- prefetching;
- TLB effects;
- allocator/layout effects;
- cache topology uncertainty;
- noisy or missing cliffs;
- virtualization/container distortion;
- why the shape matters more than matching a canonical graph perfectly.

### Required fallback

Provide a course-owned validated dataset/trace path for a student whose machine does not expose a useful curve.

Fallback students must still perform the reasoning task.

---

## D. Storage behavior taste

Evaluate a small, portable way to contrast useful storage behaviors such as:

- sequential/bulk access;
- random/small access;
- cached versus uncached interpretation where honest.

Do not require raw-device access, root, destructive writes, huge files, or misleading claims about physical media through opaque VM/container caches.

If a portable live experiment is too misleading, prefer a smaller measured/demo path plus a validated dataset over fake universality.

---

## E. Week 12 parallel scaling substrate

Required path should run on an ordinary multicore CPU.

Prefer a small shared-memory implementation using OpenMP, native threads, or another justified open route.

Prototype at least two workload shapes:

1. **chunky/local:** meaningful useful work between coordination events;
2. **chatty/synchronized:** frequent dependency/coordination relative to useful work.

Sweep worker count where practical.

Capture runtime and speedup.

The student should be able to see that:

> **more workers is a hypothesis, not a guarantee.**

The report must identify where Amdahl, synchronization, cache behavior, false sharing, scheduling, and workload grain may matter.

---

## F. Communication-latency substrate

This is a major design requirement.

Week 12 needs a safe way to make communication latency **felt**.

The required path must not need root/admin.

Evaluate and prototype the cleanest route, such as:

- a course-owned user-space message harness;
- a local socket client/server pair;
- a user-space delay/rate proxy;
- a deterministic communication simulator;
- an MPI-backed version when MPI earns its complexity.

The conceptual experiment should be able to compare something like:

### Chatterbox

Send a small request/message, wait for the dependent response, repeat.

### Freight train

Move meaningful bulk work/data with far fewer round trips.

Then perturb independently where feasible:

- latency/delay;
- bandwidth/rate;
- message count;
- message size;
- computation between communications.

Students should be able to discover that changing latency and changing bandwidth are **not the same experiment**.

### MPI rule

MPI is optional until proven useful.

If Open MPI is included:

- prove the setup is humane;
- prove local multi-process execution;
- be explicit about transport behavior;
- do not casually assume that a local MPI run traverses a network path that a network-delay tool will affect;
- if network perturbation matters, deliberately control the transport or use the course harness instead.

Optional `netem` may appear in Jeremy's/instructor enrichment where safe privileges exist. It is never the required student path.

---

## G. Week 13 specialization substrate

Required path remains CPU-only.

Prototype a workload that can support a defensible comparison among at least two execution organizations, for example:

- scalar implementation;
- compiler-vectorized/SIMD-shaped CPU implementation;
- threaded CPU implementation;
- optional GPU implementation on capable instructor/student systems.

The laboratory must preserve the same underlying question/workload.

When GPU enrichment exists, measure or expose:

- setup/launch cost;
- host/device data movement;
- steady-state throughput;
- problem-size crossover where relevant.

Do not publish a GPU leaderboard.

The lesson is **workload fit and data movement**, not "CUDA is faster."

---

# Part VII - Python/matplotlib should feel like an instrument

Matplotlib is settled as the default plotting layer.

Students are not being graded on memorizing matplotlib APIs.

Build small course-owned helpers/templates that:

- read the shared receipts;
- apply correct units/labels;
- produce a clean default figure;
- expose enough source that students can inspect/modify if desired;
- avoid decorative plotting complexity;
- save a stable file for the dossier.

Possible interfaces:

```bash
archplot performance data/week08.csv
archplot memory data/week10.csv
archplot scaling data/week12.csv
```

or one generic config-driven command if cleaner.

### Plot-reading support

The tool should make it easy for Prompt 004 to teach:

- axis meaning;
- units;
- log scale only when justified;
- repeated trials/noise;
- identifying regions/cliffs;
- not drawing causal claims from shape alone;
- annotation without overclaiming exact cache boundaries.

A beautiful wrong graph is still wrong.

---

# Part VIII - LaTeX/PDF should feel like a publishing button

The Machine Dossier should become a professional-looking technical artifact without turning into a LaTeX course.

Prompt 002 identified **Tectonic** as a strong candidate.

Prompt 003 must actually compare/validate the smallest reliable option, likely among:

- Tectonic;
- constrained TeX Live + `latexmk`;
- another open route only if materially better.

Required properties:

- open/free;
- reproducible enough for the course;
- equations;
- tables;
- figures;
- cross-references;
- no giant manual setup burden;
- one obvious build command;
- usable inside the supported environment.

Target experience:

```bash
make dossier
```

or equivalent.

### Minimal dossier proof

Build a sample PDF containing:

- machine snapshot facts;
- one short evidence table;
- one generated matplotlib figure;
- one equation with units;
- one evidence-backed explanation;
- provenance/reference text.

The PDF is proof that the pipeline works, not a final student template design exercise.

---

# Part IX - Machine Dossier integration contract

Prompt 003 must turn `planning/machine-dossier.md` into a technically plausible storage/build convention.

A likely shape is:

```text
dossier/
  machine.yaml
  data/
    week08-performance.csv
    week10-memory.csv
    week12-scaling.csv
  plots/
  sections/
  main.tex
```

The exact structure may change based on implementation evidence.

What must remain true:

- one machine snapshot can be referenced across weeks;
- raw evidence remains inspectable;
- plots are generated, not hand-pasted mysteries;
- prose can reference evidence;
- Week 14 can rebuild the same artifact with accumulated evidence;
- Week 15-17 can use the frozen dossier without requiring new architecture experiments.

Do not create a database-backed portfolio platform.

Files are a feature here.

---

# Part X - Fallbacks are part of the design, not an apology

Every experiment author should have one of these answers:

1. **Live measurement works on the supported path.**
2. **Live measurement works but may be noisy; provide interpretation guidance.**
3. **Feature is not reliably exposed; provide a validated course-owned dataset/trace that preserves the reasoning objective.**
4. **Feature is optional enrichment only.**

The fallback dataset should not reduce the intellectual task to "look at Jeremy's answer."

A student using fallback evidence should still:

- predict;
- inspect parameters;
- visualize;
- compare conditions;
- explain mechanism;
- revise a claim.

Equity means same reasoning ceiling, not pretending every laptop has identical hardware.

---

# Part XI - Cross-platform truth table

Do not say "cross-platform" as a vibe.

Test and record what is actually supported.

Prioritize:

### Windows

- WSL2 primary candidate;
- clear distinction between Windows-host Observatory facts and WSL-visible facts;
- no assumption students can install privileged drivers/tools.

### Linux

- native path;
- Docker/Podman path as applicable;
- host probe path.

### macOS

- determine what portion works natively;
- determine whether a container path is practical;
- note architecture differences on Apple Silicon honestly;
- do not force x86-only assumptions into universal instructions.

### Unsupported/untested

Say so explicitly.

A truthful support matrix is more useful than aspirational portability.

---

# Part XII - Laboratory health check

Create one command or script that answers:

> **Is this environment ready for the semester's Architecture work?**

Possible interface:

```bash
archlab doctor
```

It should produce a human-readable result and a machine-readable receipt.

At minimum test:

1. runtime/environment identified;
2. native compiler works;
3. tiny C program runs;
4. binary inspection works;
5. debugger/state inspection works where supported;
6. RISC-V compile path works;
7. RISC-V execution/inspection path works;
8. Python environment works;
9. matplotlib figure generation works;
10. dossier PDF build works;
11. host probe works or reports a clear limitation;
12. native timing experiment works;
13. multicore experiment works;
14. communication-delay experiment works;
15. no secret/private-resource dependency is detected.

Output should distinguish:

- PASS;
- WARN / optional capability unavailable;
- FAIL / required capability broken.

Do not fail the required environment merely because a GPU or optional MPI feature is absent.

---

# Part XIII - Required implementation smoke tests

Prompt 003 is not complete because packages installed successfully.

Actually run small end-to-end proofs.

At minimum:

### Smoke 1 - Observatory

Capture a structured machine snapshot and human summary.

### Smoke 2 - Native program

Compile, run, inspect, and minimally debug a tiny C program.

### Smoke 3 - RISC-V

Compile a small RISC-V specimen, inspect the generated instructions/encoding, execute it through the selected path, and capture evidence.

### Smoke 4 - Measurement receipt

Run a controlled timing experiment producing machine-readable data with explicit units/context.

### Smoke 5 - Plot

Generate a matplotlib figure from that receipt using the proposed student interface.

### Smoke 6 - Dossier

Build a minimal PDF containing machine facts + data + plot + explanation.

### Smoke 7 - Memory sensory proof

Run the working-set/dependent-vs-stream experiment far enough to demonstrate the harness and fallback strategy.

### Smoke 8 - Parallel scaling proof

Run a bounded CPU multicore experiment across several worker counts.

### Smoke 9 - Communication sensitivity proof

Run the non-root delay/communication experiment under at least two latency conditions and demonstrate a workload that reacts materially.

### Smoke 10 - Clean-room / fresh-start proof

Prove the documented setup from a fresh-enough environment rather than relying solely on the developer's accumulated machine state.

If true clean-room validation is impossible in the current execution environment, say exactly what was and was not proven.

---

# Part XIV - Measurement hygiene

Prompt 003 should create a short durable measurement doctrine for Prompt 004 authors.

At minimum establish:

- use explicit units;
- preserve raw receipts;
- repeat measurements;
- summarize responsibly;
- record relevant parameters/tool versions;
- control compiler optimization intentionally;
- prevent dead-code elimination where it invalidates the experiment;
- separate wall-clock runtime from throughput/latency when relevant;
- avoid tiny runtimes dominated by timer noise;
- identify likely virtualization/container artifacts;
- avoid claiming exact hardware boundaries from weak evidence;
- prefer within-machine comparisons over cross-student performance ranking;
- measure the phenomenon, not the student's purchasing power.

The point is not publication-grade benchmarking.

The point is **honest evidence strong enough to support architecture reasoning**.

---

# Part XV - Suggested repository shape

Let implementation evidence decide exact paths, but aim for obvious ownership.

A plausible shape:

```text
lab/
  README.md
  container/ or environment/
  bin/
    archlab
    archprobe
    archplot
  experiments/
    native/
    memory/
    parallel/
    communication/
    specialization/
  riscv/
  python/
  dossier-template/
  fixtures/
    fallback-data/
  tests/
  docs/
    support-matrix.md
    measurement-doctrine.md
```

Do not create directories merely to match this sketch.

Use the smallest tree that makes responsibilities obvious.

---

# Part XVI - Explicit non-goals

Prompt 003 does **not** authorize:

- production Canvas writes;
- Savnac writes;
- production enrollments;
- new grading weights;
- due/late/drop policy decisions;
- a commercial textbook/vendor dependency;
- a paid AI dependency;
- a giant cloud service;
- a Kubernetes requirement;
- student access to NRP;
- student access to Jeremy's machines;
- mandatory MPI;
- mandatory CUDA;
- mandatory GPU;
- mandatory privileged performance counters;
- raw-device experiments;
- a custom full CPU simulator unless existing tools demonstrably cannot support the accepted learning goals;
- full authoring of Weeks 5-14;
- rewriting the accepted curriculum because one tool is inconvenient.

If infrastructure fights the curriculum, first look for a simpler instrument.

---

# Required durable outputs when executed

Prompt 003 should land actual runnable infrastructure plus concise durable documentation.

At minimum, create or update appropriate course-owned paths for:

1. laboratory bootstrap/runtime definition;
2. host Observatory / machine probe;
3. common experiment runner/data convention;
4. RISC-V toolchain path;
5. plotting helper(s);
6. dossier template/build path;
7. representative memory sensory experiment;
8. representative multicore experiment;
9. representative communication-latency experiment;
10. health/doctor command;
11. fallback evidence fixtures;
12. support matrix;
13. measurement doctrine;
14. student/instructor quick-start documentation.

Do not mark a capability complete if only a prose plan exists.

---

# Required execution report

Write:

`sidecar/reports/003_build_reproducible_architecture_lab.md`

The report must answer the fourteen questions near the top of this prompt and include:

## Architecture decision

- final Observatory design;
- final Experimental Chamber design;
- why host and controlled-environment responsibilities are separated;
- interfaces chosen;
- rejected alternatives and why.

## Tool decisions

- runtime/container choice;
- native compiler/debug/binutils path;
- RISC-V compiler/execution/inspection path;
- plotting stack;
- PDF/LaTeX stack;
- multicore path;
- communication-latency path;
- MPI decision;
- optional GPU enrichment decision.

## Footprint / friction

- installation/bootstrap steps;
- image/download size where measurable;
- first-run cost;
- common student failure modes;
- dependency/network assumptions.

## Machine probe

- schema;
- sample output;
- host/container scope behavior;
- privacy behavior;
- unsupported fields/platforms.

## Evidence contract

- receipt format;
- units/context policy;
- experiment versioning;
- plot integration;
- dossier integration.

## Sensory proofs

- Week 8 dependency/latency-throughput proof if implemented;
- Week 10 memory proof;
- Week 12 multicore proof;
- Week 12 communication-delay proof;
- Week 13 specialization proof or validated substrate recommendation.

## Dossier proof

- exact build command;
- example data flow;
- generated plot;
- generated PDF;
- limitations.

## Validation

- smoke-test commands/results;
- `archlab doctor` result;
- platforms actually tested;
- platforms explicitly untested;
- fresh-start evidence;
- known nondeterminism/noise;
- fallback datasets.

## Security / equity verification

Confirm:

- no credentials/secrets;
- no private-host assumptions;
- no privileged required path;
- no paid dependency;
- CPU-only path;
- no hardware-based grading ceiling.

## Handoff to Prompt 004

State exactly what Week authors may now rely upon:

- supported bootstrap command;
- supported experiment interfaces;
- supported receipt schema;
- supported plotting interface;
- supported dossier interface;
- supported RISC-V path;
- known platform caveats;
- fallback strategy.

Do not make Prompt 004 reverse-engineer the lab from source code.

---

# Acceptance gates

Prompt 003 passes only if all required gates are satisfied.

## Gate A - Small enough

The laboratory is understandable and maintainable. Tooling does not become a second curriculum.

## Gate B - Honest machine observation

The course can inspect a real machine without silently confusing host truth with container truth.

## Gate C - Reproducible experiment chamber

A fresh supported environment can run the common technical path with documented versions/interfaces.

## Gate D - RISC-V continuity

One coherent RISC-V path supports the Weeks 6-9 story.

## Gate E - Structured evidence

Experiments emit machine-readable receipts with units/context.

## Gate F - Visualization

A student can convert a receipt into a useful plot without becoming a matplotlib specialist.

## Gate G - Publication

A student can compile a minimal Machine Dossier PDF without becoming a LaTeX specialist.

## Gate H - Sensory proof

At least memory and parallel/communication phenomena have actually been made visible through controlled experiments.

## Gate I - Fallback dignity

Students whose machines do not expose a clean phenomenon have a validated evidence path preserving the same reasoning objective.

## Gate J - No privilege/paywall/hardware trap

The required path needs no root/admin, commercial software, paid AI, private machine, or GPU.

## Gate K - Support truth

The platform matrix says what was actually tested and does not describe hopes as support.

## Gate L - Handoff clarity

Prompt 004 can author Weeks 5-14 against stable laboratory interfaces without reopening foundational tool decisions.

---

# Done when

Prompt 003 is done when a student on a fresh supported ordinary-computer path can:

1. ask the real host what machine it is;
2. enter a reproducible experimental environment;
3. compile and inspect native code;
4. compile, inspect, and execute a small RISC-V specimen;
5. run a controlled architecture experiment;
6. receive structured evidence;
7. deliberately change one condition;
8. measure what changed;
9. generate an interpretable plot;
10. compile that evidence into a minimal Machine Dossier PDF;
11. run a bounded multicore/communication experiment;
12. obtain a clear fallback when hardware does not expose the desired phenomenon;
13. run one health command that says whether the laboratory is ready.

And most importantly:

> **The student experiences architecture. They do not experience our infrastructure.**

The laboratory should make it possible to hold the program mostly still, make one architectural constraint worse, and ask the machine whether the workload cares.

That is the instrument Prompt 004 gets to play.
