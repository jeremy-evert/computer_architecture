# COMSC 3013 Fall 2026 — asynchronous block map

**The master target list for the weekly learning pipeline.**

This file intentionally mirrors CS1's `planning/block-map.md`, but Computer Architecture is officially online/asynchronous. Here, a "block" is a **student-facing release/learning block**, not a scheduled class period or fixed duration.

The recurring design rhythm is:

**Monday — Frame → Wednesday — Inspect / Build / Measure → Friday — Explain / Defend**

Week 1 is the universal success-foundations exception. Week 15 is intentionally lightweight for Thanksgiving/travel. Week 17 is finals/reflection rather than a normal technical week.

## Semester map

| Week | Dates | Monday — Frame | Wednesday — Inspect / Build / Measure | Friday — Explain / Defend | Relationship |
|---|---|---|---|---|---|
| 1 | Aug 17–21 | **Survive the semester** | **Thrive in the degree** | **Enjoy the career** | Universal Week 1; no Architecture technical gate. |
| 2 | Aug 24–28 | **AI Lab Training:** ask a useful technical question and gather context | Compare an AI claim against commands/docs/measurements | Explain what changed after verification | Investigation foundation |
| 3 | Aug 31–Sep 4 | Why repeatability matters | Build/run the semester lab capsule and reproduce a small experiment | Explain what must be captured for another machine/person to reproduce it | Laboratory foundation |
| 4 | Sep 8–11 | **Labor Day Monday:** no Monday release required; frame asynchronously as needed | Use Linux as a machine telescope: files, processes, CPU/memory, binaries | Explain one machine fact using command output as evidence | Observation foundation |
| 5 | Sep 14–18 | **Bits Become Meaning:** representation, logic, arithmetic | Manipulate/observe binary, hex, signed values, floating point, Boolean/ALU behavior | Explain what the bits mean and where representation limits matter | Sister with Week 6 |
| 6 | Sep 21–25 | **Hardware/Software Contract:** ISA + planning-leading RISC-V | Compile/disassemble/step a tiny program; inspect instructions/registers/memory | Connect source intent to actual machine instructions with evidence | Sister with Week 5 |
| 7 | Sep 28–Oct 2 | **Build One Instruction:** datapath + control | Trace or build a bounded datapath/control path | Defend how one instruction moves through the processor | Sister with Week 8 |
| 8 | Oct 5–9 | **Do Many Things at Once:** pipelines + performance | Trace overlap, hazards, stalls/forwarding; measure/compute latency/throughput/CPI | Explain why an optimization helps and what complication it introduces | Sister with Week 7 |
| 9 | Oct 12–14 | **Follow the Program Down:** choose one bounded source program | Trace source → assembly/instruction → datapath/pipeline evidence | Fall Break: no Friday requirement; integration artifact closes the week | Integration checkpoint |
| 10 | Oct 19–23 | **The Memory Illusion I:** caches + locality | Change/access data in ways that expose locality/cache behavior | Explain measured behavior using memory hierarchy concepts | Sister with Week 11 |
| 11 | Oct 26–30 | **The Memory Illusion II:** VM, protection, I/O, OS support | Inspect address spaces/system mechanisms; trace a syscall/trap/interrupt/I/O path where practical | Explain how hardware creates a useful software abstraction | Sister with Week 10 |
| 12 | Nov 2–6 | **More Cores, More Problems:** parallelism + Amdahl | Run/inspect a small multicore/shared-memory experiment; expose synchronization/coherence/false sharing where feasible | Explain why more cores did or did not help | Sister with Week 13 |
| 13 | Nov 9–13 | **Different Machines for Different Work:** vectors, GPUs, accelerators | Compare scalar/vector/parallel or CPU/accelerator workload shapes; CPU-only required path | Explain when specialization wins and what it costs | Sister with Week 12 |
| 14 | Nov 16–20 | **Architecture Is Tradeoffs:** compare real machines | Build an evidence-backed architecture/workload comparison; form capstone hypothesis | Defend one design choice and submit a bounded measurement plan | Synthesis + capstone launch |
| 15 | Nov 23–27 | **Thanksgiving / Architecture Field Notebook:** baseline/preflight only | No fragile live/instructor-dependent activity | No major new theory; capture what evidence is ready and what remains | Lightweight asynchronous preflight |
| 16 | Nov 30–Dec 4 | **Farkle + Machine Learning:** establish workload and architecture question | Run controlled baseline + variation; profile/measure/inspect | Defend one bounded architecture claim; connect multiple course layers | Applied capstone |
| 17 | Dec 7–11 | Reflection: what can I explain now? | Evidence-backed demonstration / portfolio defense path | Semester closure | No new technical material |

## The production pattern

Each technical week should eventually produce a compact package analogous to CS1's recurring content pipeline:

1. **Frame material** — concise explanation, central question, predictions, selected open references.
2. **Investigation** — runnable lab/trace/build/measurement with supported-environment instructions.
3. **Evidence checkpoint** — interpretation or defense that cannot be satisfied by pasting raw output.
4. **Reference map** — free/open material used for learning, verification, and deeper study.
5. **Validation receipt** — instructor/agent proof that the activity actually runs in the supported lab environment.

## Sister-week production rule

When two weeks are sisters, author them together enough that they share a continuing object of study instead of resetting context.

Preferred continuity:

- Weeks 5–6 reuse the same values/tiny programs from representation into ISA.
- Weeks 7–8 reuse the same instruction/program from datapath into pipeline timing.
- Week 9 reuses material from Weeks 5–8 for the integration trace.
- Weeks 10–11 reuse a process/program/data-access story from cache reality into virtual-memory/OS abstraction.
- Weeks 12–13 reuse a workload/data layout from multicore execution into vector/GPU/accelerator comparison.
- Weeks 14–16 carry one bounded architecture question from design tradeoff → preflight → capstone evidence.

## Current production status

This map defines the **spine and target learning moves**, not finished lessons. Individual `planning/week-NN.md` files should remain honest about whether their references, labs, rubrics, and validation have actually been authored and executed.
