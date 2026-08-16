# COMSC-3013 Computer Architecture - Fall 2026 Course Design

## Course promise

Computer Architecture should answer a question students have been carrying since they first wrote code:

> **What is the machine actually doing underneath my program, what evidence lets me know, and why was it built that way?**

The course treats a computer as a connected, measurable stack rather than a museum of isolated terms.

The official Fall 2026 section is online/asynchronous. Jeremy's Monday / Wednesday / Friday 2:00 PM cadence is an instructor production/release rhythm, not an official meeting requirement.

## Required-materials promise

Students do not need to buy a textbook, zyBook, paid AI subscription, premium AI command-line tool, GPU, FPGA, Raspberry Pi, or other specialized hardware to complete this course successfully.

The required path is built from:

- open/freely accessible readings and primary references;
- course-created explanations, diagrams, examples, decks, recordings, and labs;
- open-source/free compilers, debuggers, simulators/emulators, container/runtime tools, plotting/reporting tools, and system-inspection utilities;
- a no-cost or course-accessible AI path where AI is expected;
- CPU-only completion for required technical work.

Commercial books and premium tools may improve the instructor workflow or provide optional enrichment. They may not become a student dependency or raise the grading ceiling.

## Design goals

By the end of the course, a successful student should be able to:

1. explain the abstraction stack from software intent through machine execution and system behavior;
2. connect component/specification claims to workload needs rather than repeating marketing numbers;
3. represent and inspect data quantitatively, including binary/hex, signed integers, floating point, and instruction encodings;
4. read and trace a modern ISA, with RISC-V as the planning-leading teaching ISA;
5. trace an instruction through datapath/control and explain basic pipeline/performance consequences;
6. explain and **feel through experiment** important distinctions such as latency versus bandwidth, cache-friendly versus cache-hostile access, and scalable versus synchronization-bound work;
7. explain memory hierarchy, virtual memory, protection, I/O, and OS-facing hardware mechanisms;
8. reason about multicore/coherence/synchronization and specialized vector/GPU/accelerator hardware;
9. inspect a real machine with Linux/toolchain evidence and reproduce a systems experiment;
10. visualize measured behavior with course-scaffolded Python/matplotlib tools;
11. communicate a durable technical argument through the Machine Dossier, including equations/tables/figures in a scaffolded LaTeX publishing path;
12. use AI skeptically and productively, treating models as investigation partners whose claims must be verified;
13. defend a final architecture/design choice with measured evidence and explicit tradeoffs.

## Semester movement

### Part I - Build the investigator (Weeks 1-4)

- **Week 1 - Success Foundations:** survive the semester, thrive in the degree, enjoy the career. No Architecture technical gate.
- **Week 2 - AI Lab Training:** AI can propose; evidence decides.
- **Week 3 - Containers & Repeatability:** establish the reproducible laboratory.
- **Week 4 - Linux as a Machine Telescope:** learn to ask a machine questions and separate observation from interpretation.

These weeks are hand-holding by design. They do not start the Machine Dossier or smuggle Architecture content into the universal opening.

### Part II - Build and open the machine (Weeks 5-9)

- **Week 5 - Build the Machine:** PCPartPicker-style compatibility/workload design, hierarchy, Dollars-Per, actual-machine snapshot, Machine Dossier v0.
- **Week 6 - Bits Become Instructions:** representation plus the RISC-V hardware/software contract; Checkpoint 1.
- **Week 7 - Crack Open the CPU:** datapath and control.
- **Week 8 - Make It Fast Without Breaking It:** pipelines, hazards, latency, throughput, CPI, performance; first sensitivity plot.
- **Week 9 - Follow the Program Down:** integration Checkpoint 2.

### Part III - Stress the machine (Weeks 10-13)

- **Week 10 - Make the Memory Hierarchy Hurt:** cache/locality/working-set sensory lab; latency/bandwidth cliffs.
- **Week 11 - The Useful Lie of Memory:** VM, protection, I/O, traps, interrupts, OS support.
- **Week 12 - More Cores, More Problems:** scaling, communication, synchronization, coherence, false sharing.
- **Week 13 - Different Machines for Different Work:** vectors, GPUs, accelerators, data movement, workload fit.

The course deliberately makes important architecture adjectives experiential. Students should have measurements and plots that show what the words mean.

### Part IV - Become the architect (Week 14)

**Week 14 - Sit in the Architect's Chair** is the technical finale.

Students revisit the Week 5 machine under the same or clearly bounded workload/budget constraints, use ten weeks of evidence, defend changed or retained choices, submit **Checkpoint 3**, and freeze the Machine Dossier.

Architecture instruction stops here.

### Part V - Wind down (Weeks 15-17)

- **Week 15:** Thanksgiving asynchronous wind-down. Curate/catch up. No new Architecture theory or dossier layer.
- **Week 16:** shared Farkle + Machine Learning fun/application week. Architecture may echo naturally, but this is not a new capstone or Checkpoint 4.
- **Week 17:** reflection. No new technical content. The frozen dossier is evidence for what changed.

## Online M/W/F learning and recording chassis

### Monday - Think / Frame / Lecture

Monday is the weekly **lecture package**.

It combines:

- AI Fluency lens;
- the central technical question;
- course-owned digest/LaTeX source;
- slide/Beamer deck;
- instructor recording/workthrough;
- predictions/hypotheses before evidence.

Jeremy may record with his actual AI/tool stack visible. ChatGPT, Claude, Copilot, Gemini, Grok, Codex, Claude Code, aider, OpenClaw, local models, and other tools can appear as collaborators in the instructor workflow.

**Instructor stack visibility is pedagogy, not a student requirement.**

### Wednesday - Investigate / Break / Measure

Wednesday combines:

- Professional Minds Wednesday topic;
- hands-on architecture lab/trace/build;
- reproducible environment;
- sensory perturbation where useful;
- data/trace collection;
- optional instructor canonical walkthrough.

The student should make the machine do something that gives the week's language physical meaning.

### Friday - Explain / Defend / Stack Showcase

Friday combines:

- Professional Minds Friday topic;
- a bounded evidence-backed student receipt;
- plot/table/trace/explanation when useful;
- an instructor **Stack Showcase** demonstrating the idea on a real machine, cluster, compiler/toolchain, profiler, GPU/accelerator, NRP resource, local agent workflow, or other authentic system.

The Stack Showcase replaces the energy of a live show-and-tell without pretending asynchronous students are present synchronously.

## AI Fluency sequence

Architecture inherits the shared Fall 2026 AI Fluency progression:

1. Week 1 universal opening;
2. Week 2 Lens 1+2: Define the Problem + Gather Context;
3. Week 3 Lens 3: Plan the Work;
4. Week 4 Lens 4: Decompose the Task, folded around Labor Day;
5. Week 5 Lens 5: Select the Right Model;
6. Week 6 Lens 6: Engineer the Prompt;
7. Week 7 Lens 7: Research and Retrieve;
8. Week 8 Lens 8: Reason;
9. Week 9 Lens 9: Generate;
10. Week 10 Lens 10: Critique;
11. Week 11 Lens 11: Verify;
12. Week 12 Lens 12: Revise;
13. Week 13 Lens 13: Decide;
14. Week 14 Lens 14: Automate;
15. Week 15 Lens 15: Measure;
16. Week 16 Lens 16: Reflect and Improve.

AI Fluency is tied to the same week's machine question rather than becoming a second unrelated course.

## Professional Minds sequence

Architecture inherits the shared Fall 2026 Professional Minds topics:

- W2: *Make It Stick* / *Mindset*
- W3: *Limitless Mind* / *Resilience Education*
- W4: *Critical Thinking* / *Thinking, Fast and Slow*
- W5: *The Art of Thinking Clearly* / *How Not to Be Wrong*
- W6: *Statistics Done Wrong* / *Understanding Statistics and Experimental Design*
- W7: *Understanding by Design* / *Rethinking Grading*
- W8: *The Pragmatic Programmer* / *Clean Code*
- W9: *Refactoring* / Fall Break Friday
- W10: *Software Engineering* / *Agile Software Development*
- W11: *Software Project Management* / *Growing Object-Oriented Software, Guided by Tests*
- W12: *Getting Things Done* / *Joy on Demand*
- W13: *97 Things Every Programmer Should Know* / *How to Win Friends and Influence People*
- W14: *Docs for Developers* / *Prompt Engineering for Generative AI*
- W15: Thanksgiving; no normal Wednesday/Friday strand burden
- W16: *Generative AI Design Patterns* / Semester Reflection

These topics should flavor how students investigate, communicate, and make judgments. They should not crowd out the Architecture lab.

## Machine Dossier

The persistent artifact from Weeks 5-14 has two views:

### Machine Map

What exists, what it costs, what it connects to, and what it is designed to do.

### Sensitivity Profile

How the machine/workload responds when one architectural constraint changes.

See [`machine-dossier.md`](machine-dossier.md) for the full contract.

## Architecture sensory-lab doctrine

The recurring experiment grammar is:

**predict -> perturb one constraint -> run -> measure -> visualize -> explain -> revise**

Examples include:

- dependent pointer chase versus streaming memory;
- changing working-set size to expose cache boundaries;
- sequential versus random storage access;
- dependent versus independent pipeline/workload behavior;
- worker-count/synchronization/communication-delay experiments;
- general-purpose versus vector/GPU/accelerator-shaped execution;
- setup/data-movement cost versus steady-state throughput.

A course adjective should be attached to an experience whenever that can be done safely and reproducibly.

## Python and LaTeX

Python/matplotlib is the standard visualization instrument. The course provides helpers so plotting syntax is not the point.

LaTeX is the dossier publishing instrument. The course provides a template and one-command build so typesetting is not the point.

A likely target structure is:

```text
dossier/
  machine.yaml
  data/
  plots/
  sections/
  main.tex
```

Prompt 003 owns the actual tool selection, implementation, container size, portability, and smoke tests.

## Source doctrine

No required commercial text owns the curriculum.

Course authors should deliberately combine:

- RISC-V International specifications;
- official compiler/binutils/debugger/runtime documentation;
- strong open/freely accessible university architecture materials;
- open textbooks/open educational resources where useful;
- open-source tools and docs;
- course-created explanations, diagrams, datasets, scripts, labs, plots, and assessments.

The open-course benchmark set includes Berkeley CS61C, Cornell CS3410, MIT 6.004, Nand2Tetris, Cambridge architecture materials, and other current primary/open sources found by Prompt 002.

## Assessment structure

Architecture inherits the recognizable CS1 grading family while adapting away face-to-face categories that do not exist online.

The accepted structure is recorded in [`../docs/grading-model.md`](../docs/grading-model.md).

The technical center is intentionally large:

- weekly investigation evidence;
- weekly Explain/Defend receipts;
- Machine Dossier checkpoints in Weeks 6, 9, and 14.

Week 16 is not an Architecture checkpoint.

Operational due/late mechanics remain to be finalized before Canvas deployment.

## Deployment readiness rule

A technical week is ready only when it has:

- clear central question/objectives;
- open/course-owned learning path;
- lecture digest/deck/recording plan;
- tested lab in the supported environment;
- evidence artifact and check criteria;
- visualization scaffold where relevant;
- Friday Stack Showcase plan where useful;
- fallback/accessibility path;
- validated links/commands;
- clean Savnac rendering path.

Week files remain honest planning shells until those things actually exist.

## Pinned non-negotiables

- Week 1 remains universal.
- Weeks 1-4 remain the hand-holding/investigator runway.
- Weeks 5-14 are the entire Architecture technical runway.
- Week 14 is the technical finale and dossier freeze.
- Week 15 is asynchronous wind-down.
- Week 16 is Farkle + ML shared application/fun, not Checkpoint 4.
- Week 17 is reflection.
- no required commercial textbook/zyBooks;
- no required paid AI;
- no required premium CLI agent;
- no required specialized GPU;
- CPU-only required completion path;
- RISC-V remains the planning-leading teaching ISA.
