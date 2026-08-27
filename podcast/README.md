# Podman at the Podium

**Status:** Working show charter / durable home  
**Course:** COMSC-3013 Computer Architecture  
**Working title:** **Podman at the Podium**  
**Subtitle:** *Computer Architecture from Inside the Container*  
**Established:** 2026-08-27

## The idea

Computer Architecture should feel less like memorizing a diagram and more like sitting beside a machine while somebody who loves this stuff opens the hood.

The show is built around a simple teaching doctrine:

> **The machine is powerful. You are the multiplier.**

Podman gives the course a recurring laboratory environment that can travel across very different hardware. The container is not the professor and it is not the point of the course. It is the controlled experimental chamber that lets the professor and students ask the same question on different machines and then investigate why the answers differ.

The human remains the multiplier.

## Why Podman belongs in Computer Architecture

Podman creates a useful tension for an Architecture course.

A container gives us repeatability. Architecture gives us the reasons repeatability does **not** mean identical performance.

The same experiment may run inside the same course container on a Raspberry Pi, a student laptop, a workstation, or a server. The software environment can be held comparatively stable while CPU design, core count, clock behavior, cache hierarchy, memory bandwidth, storage, virtualization, ISA, and other host constraints change underneath it.

That gives us a recurring question:

> **Same experiment. Different machine. What changed, and why?**

This is the bridge between containerization and Architecture.

## Two worlds: do not blur them

This show follows the laboratory doctrine already established in `lab/README.md`.

### The Observatory

Look at the real machine.

Use host-visible evidence when the claim is about the host: CPU topology, memory, kernel-visible hardware, cache information, timing, counters, virtualization, or other architectural facts.

A container must never be allowed to pretend it *is* the physical host.

### The Experimental Chamber

Run a bounded, reproducible experiment in a controlled environment.

Podman is a natural home for the chamber. It lets us make software setup boring enough that the interesting variable can be the architecture.

The core experimental grammar remains:

> **predict -> perturb -> run -> measure -> visualize -> explain -> revise**

## Important technical truth

Containers do not magically erase platform differences.

On Linux, containers rely on Linux kernel facilities. On macOS and Windows, Podman normally runs Linux containers through a Podman-managed Linux virtual machine. Cross-architecture images and emulation may introduce additional behavior and overhead.

That is not a flaw in the course concept. It is Architecture material.

Students should learn to ask what is native, what is virtualized, what is emulated, what is container-visible, and what is host-visible before interpreting performance evidence.

## The show voice

This should feel like Jeremy sitting down at a microphone because there is something genuinely interesting to show somebody.

Not a narrated textbook.

Not a polished corporate training video.

Not a thirty-minute slide autopsy.

The preferred energy is:

- one interesting machine question;
- one concrete experiment or artifact;
- visible curiosity;
- real measurements;
- permission to be surprised;
- corrections when the machine proves the first explanation wrong;
- occasional guests who know, build, operate, or care about interesting systems.

## Recurring show signature

### Opening

> These machines are amazing. But the most important thing is what happens when a capable human learns to use them well. **The machine is powerful. You are the multiplier.**

### Architecture bridge

> Today we are going to make the machine show us what it is doing.

### Closing

> **Use the power. Verify the output. Protect what you put in. Go build something.**

The underlying doctrine remains canonical in `course_foundry/doctrine/HUMAN_MACHINE_AMPLIFICATION.md`.

## A repeatable episode shape

A normal episode should be able to work as video, audio, transcript, and a short written recap.

1. **Cold open — The question**  
   Start with a claim students may believe: “More cores means faster,” “GHz tells me how fast the CPU is,” “the same container should perform the same everywhere,” or “the GPU is always faster.”

2. **Open the hood — The architecture**  
   Introduce only enough vocabulary to understand the experiment.

3. **Professor Podman — The chamber**  
   Run the bounded experiment in the course environment. Podman is the recurring stage, not an oracle.

4. **Receipts — The machine answers**  
   Show commands, timings, plots, counters, traces, or other evidence.

5. **Same code, different iron**  
   When useful, run the same experiment on a second machine or architecture and compare.

6. **The human multiplier**  
   Ask what better software, better parallelism, better data layout, or better system design could do with the hardware.

7. **What fooled us?**  
   Identify one measurement trap, abstraction leak, bad assumption, or misleading metric.

8. **Close with a challenge**  
   Give students one prediction, experiment, or observation they can make next.

## Recurring segments worth testing

### Same Container, Different Iron

Run one bounded workload on two very different systems.

Possible pairings:

- Raspberry Pi vs workstation;
- laptop vs server;
- older CPU vs newer CPU;
- few-core vs many-core host;
- x86-64 vs ARM64;
- CPU path vs accelerator-shaped path when an honest comparison is possible.

The lesson is never merely “bigger machine wins.” The lesson is to explain which architectural resources the workload can actually use.

### The One-Tire Fire

Take a workload that is effectively serial or bottlenecked on one execution path and put it on increasingly impressive hardware.

Then ask why the expensive machine is bored.

This is a natural doorway into utilization, parallelism, Amdahl's Law, synchronization, bottlenecks, and the difference between owning resources and using resources.

### Make It Hurt

Deliberately perturb one architectural constraint until students can feel it in the measurements:

- cache locality;
- working-set size;
- dependency chains;
- synchronization;
- worker count;
- communication delay;
- memory access pattern;
- vectorization;
- data movement.

### Bring Me Your Machine

Guest episode or student-safe demonstration built around an interesting system.

The guest explains what the machine was built to do, where it is strong, where it is weak, and one architectural decision that matters in real work.

### Architecture Mythbusters

Start with a familiar claim and make the machine argue with it.

Examples:

- “More cores is always faster.”
- “A higher clock means a faster computer.”
- “Containers make performance portable.”
- “GPUs are faster than CPUs.”
- “More RAM makes programs run faster.”
- “Cloud means the hardware no longer matters.”

## Relationship to the existing M/W/F course rhythm

The podcast should not become a second curriculum competing with the existing course. It is a delivery and engagement layer over the course that already exists.

### Monday — Frame

The episode asks the central machine question and gives the student a model.

### Wednesday — Experiment

The lab makes the machine argue with the model.

### Friday — Explain / Guest / Stack Showcase

The show revisits the evidence, compares machines, brings in a guest, or demonstrates where the idea appears in a real system.

This preserves the existing production principle:

> **Monday gives the student a model. Wednesday makes the machine argue with the model. Friday forces a better explanation.**

## Candidate first season from the existing course

The current Weeks 3-14 arc already reads like a season outline:

- **Episode 0 — Welcome to the Machine:** the machine is powerful; you are the multiplier.
- **Episode 1 — It Worked on My Machine:** containers, reproducibility, Podman, and the difference between controlled software and uncontrolled hardware.
- **Episode 2 — Linux Is a Machine Telescope:** ask the host what it actually is.
- **Episode 3 — Build the Machine:** workload fit, hierarchy, interfaces, constraints, and dollars-per.
- **Episode 4 — Bits Become Instructions:** the hardware/software contract and RISC-V.
- **Episode 5 — Crack Open the CPU:** datapath, control, registers, ALU, and instruction flow.
- **Episode 6 — GHz Is Lying to You:** latency, throughput, CPI, pipeline behavior, and dependencies.
- **Episode 7 — Follow the Program Down:** connect source, instructions, execution, and evidence.
- **Episode 8 — Make the Memory Hierarchy Hurt:** locality, caches, bandwidth, and cliffs.
- **Episode 9 — The Useful Lie of Memory:** virtual memory, protection, translation, and I/O.
- **Episode 10 — More Cores, More Problems:** the One-Tire Fire, scaling, synchronization, and Amdahl's Law.
- **Episode 11 — Different Machines for Different Work:** vectors, GPUs, accelerators, and data movement.
- **Episode 12 — Sit in the Architect's Chair:** use the semester's evidence to redesign the machine.

## Guests

Guests should not be decorative interviews. Every guest episode needs an architecture question.

Useful guest roles may include:

- systems administrators;
- software engineers;
- infrastructure or cloud engineers;
- cybersecurity practitioners;
- HPC or research-computing staff;
- hardware enthusiasts;
- developers who have had to make software scale;
- people operating unusual, old, tiny, expensive, or specialized machines.

A strong guest prompt is:

> **What does your software assume about the machine underneath it, and when has that assumption hurt you?**

## Channel architecture

The show should have distinct layers so one platform never becomes the source of truth.

### 1. Source layer — Git

This repository owns the durable course-facing source:

- episode premise;
- outline;
- experiment contract;
- commands or code;
- sanitized transcript or corrected notes when appropriate;
- links or identifiers for published derivatives;
- correction log.

Do not commit protected student-bearing recordings or transcripts.

### 2. Capture / recap layer — institutional video environment

Microsoft Teams can be used for recording, transcription, recap, and AI-derived navigation or summaries when licensing and institutional policy permit.

Generated summaries are derivatives, not authoritative teaching truth. Verify them before promoting them into course materials.

### 3. Course layer — Canvas / institution-approved delivery

Every enrolled student must have a boring, dependable way to get the required episode or equivalent course material without joining a public social platform.

### 4. Public / community layer — optional

A sanitized episode may later become a public or unlisted video, audio feed, or social/community post when appropriate.

Public reach is an enhancement, never the required access path.

### 5. Conversation layer — optional community

Discord, YouTube comments, Teams discussion, or another community surface can be useful for questions and social energy, but none should become the only place where required course knowledge or feedback exists.

## Media rule

One recording should produce several useful representations when practical:

```text
record once
    |
    +--> full video
    +--> audio-friendly episode
    +--> transcript
    +--> verified written recap
    +--> chapter/timestamp index
    +--> short clips or demonstrations
    +--> experiment receipt / code in Git
```

The durable intellectual product is not the MP4. It is the connected set of source, evidence, explanation, and derivatives.

## Pilot episode

### Episode 1 — It Worked on My Machine

**Question:** If we run the same container on two different computers, did we actually run the same experiment?

**Machines:** Start with any two available hosts. An ARM64 Raspberry Pi and an x86-64 workstation would make the contrast especially visible, but the concept does not depend on that pairing.

**Experiment:** One bounded CPU workload with both a serial and parallel form, plus environment receipts.

**Evidence to capture:**

- host architecture and CPU facts;
- container-visible architecture and CPU facts;
- Podman version and container image identity;
- wall-clock runtime;
- CPU utilization;
- worker count;
- repeated measurements rather than one magic number.

**Teaching turn:** The container helped us control the software environment. It did not make the hardware disappear.

**Closing question:** What would the software have to change before the more capable machine could become a meaningful multiplier?

## Production guardrails

- Do not make Podman itself the learning objective when Architecture is the learning objective.
- Do not claim a container reproduces the physical host.
- Do not compare machines using a benchmark that cannot use the resource being discussed and then blame the hardware.
- Do not make students reproduce Jeremy-owned infrastructure to earn the same grade.
- Keep a CPU-only required path.
- Distinguish native execution, virtualization, emulation, and containerization explicitly when they matter.
- Prefer evidence over benchmark theater.
- Preserve corrections. A wrong prediction followed by a good measurement and correction is excellent teaching material.

## Next artifacts

As the show becomes real, this directory can grow deliberately:

```text
podcast/
├── README.md
├── EPISODE_TEMPLATE.md
├── season-01/
│   ├── e00_welcome_to_the_machine/
│   ├── e01_it_worked_on_my_machine/
│   └── ...
├── guests/
└── production/
```

Do not pre-build empty bureaucracy. Add these only when the first real episode needs them.
