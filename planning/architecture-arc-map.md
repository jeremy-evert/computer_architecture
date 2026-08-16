# Computer Architecture — arc and sister-week map

This file plays the same role for Computer Architecture that `planning/coding-odyssey-arc-map.md` plays in CS1: it explains the **shape underneath the week list**.

It does not replace `planning/fall-2026-spine.md`. The spine says what happens each week. This map explains why neighboring weeks belong together, where students should integrate ideas, and where the course deliberately changes perspective.

## Course movement

The course repeatedly crosses the bridge in both directions:

**software intent → representations → ISA → processor → memory/system mechanisms → software-visible abstractions**

and then back upward:

**architecture constraints/opportunities → system design → software choices → workload behavior**

Computer Architecture should therefore not feel like "the hardware vocabulary class." Students should see hardware and software as a continuing negotiation.

## Arc structure

| Arc | Weeks | Movement | Closes at |
|---|---:|---|---|
| **1 — Learn to investigate a machine** | 1–4 | human success → AI-assisted investigation → repeatable environments → Linux observation | Students can ask, run, inspect, record, and verify before core Architecture begins. |
| **2 — Follow software down into a processor** | 5–9 | representation → ISA → datapath/control → pipeline/performance → full-stack trace | **Week 9 integration checkpoint:** follow one small program through the stack without hand-waving. |
| **3 — Follow architecture back up into useful systems** | 10–14 | cache/memory reality → VM/OS illusion → multicore → vectors/GPU/accelerators → design tradeoffs | **Week 14 synthesis:** defend an architecture choice and launch the capstone question. |
| **4 — Investigate a real workload** | 15–16 | lightweight preflight → Farkle/ML architecture investigation | **Week 16 capstone:** make and defend one bounded architecture claim with evidence. |
| **5 — Explain what now makes sense** | 17 | reflection + demonstration | Student shows genuine architecture understanding rather than merely recalling terms. |

## Sister-week structure

### Weeks 5 + 6 — Meaning and contract

**Week 5: Bits Become Meaning** asks what information means inside a machine.

**Week 6: Hardware/Software Contract** asks how software and hardware agree on operations over those representations.

The same tiny programs/data should recur across both weeks where possible:

**value → bits → operation → instruction → machine-visible state**

### Weeks 7 + 8 — Correct execution and fast execution

**Week 7: Datapath + Control** asks how hardware executes one instruction correctly.

**Week 8: Pipelines + Performance** asks how hardware overlaps many instructions without breaking that contract.

The conceptual movement is:

**one instruction path → overlapping instruction paths → hazards → measured performance**

### Week 9 — Put the machine back together

Week 9 is not filler for a short Fall Break week. It is a deliberate integration checkpoint.

Students should take one bounded program and connect several layers:

**source → compiler/toolchain artifact → assembly/instruction → representation → datapath/pipeline behavior**

The purpose is to expose gaps in the mental model before the course moves into memory and larger systems.

### Weeks 10 + 11 — Memory reality and memory illusion

**Week 10: Memory Hierarchy + Caches** looks downward at the physical/performance problem: storage closer to the CPU is fast and scarce; storage farther away is large and slow.

**Week 11: Virtual Memory + Protection + I/O + OS Support** looks upward at what hardware mechanisms let software pretend: private address spaces, protection, traps, interrupts, devices, and process abstractions.

The relationship is:

**messy physical hierarchy → hardware mechanisms → useful software illusion**

### Weeks 12 + 13 — General parallelism and specialized parallelism

**Week 12: Multicore + Coherence + Synchronization** asks what happens when general-purpose cores share work and memory.

**Week 13: Vectors + GPUs + ML Accelerators** asks why some workloads justify a different machine organization entirely.

The relationship is:

**more general-purpose workers → coordination costs → workload shape → specialization**

Software matters enormously here: data layout, locality, synchronization, vectorization, and algorithm shape change what the hardware can accomplish.

### Week 14 — Sit in the architect's chair

Week 14 changes the question from "How does this mechanism work?" to:

> **Given competing constraints, why would a designer choose this architecture?**

Students compare real systems through performance, latency, throughput, power/energy, memory/bandwidth, cost, programmability, reliability/security, and workload fit. This is the natural launch point for the Week 16 capstone measurement question.

## Standalone-but-connected weeks

The course intentionally contains several unusual weeks that should remain unusual:

- **Week 1:** survive the semester, thrive in the degree, enjoy the career. No Architecture technical gate.
- **Week 2:** AI Lab Training. Teaches the investigation behavior used afterward.
- **Week 3:** Containers & Repeatability. Establishes the environment contract.
- **Week 4:** Linux Command Line as a Machine Telescope. Establishes the observation layer.
- **Week 15:** Thanksgiving/travel. Lightweight asynchronous capstone preflight, no major new theory.
- **Week 16:** Farkle + Machine Learning. ML is the workload; Architecture is the subject.
- **Week 17:** reflection plus evidence-backed demonstration. No new technical material.

These weeks are not interruptions to the course. They establish, test, or synthesize the habits used in the Architecture core.

## Reusable course grammar

Like CS1, each week should eventually have a predictable planning file. Architecture uses:

1. **Status**
2. **Weekly Focus**
3. **Monday — Frame**
4. **Wednesday — Inspect / Build / Measure**
5. **Friday — Explain / Defend**
6. **Evidence this week**
7. **Open authoring notes** when the week is not yet complete

The official course remains asynchronous. Monday/Wednesday/Friday are release/design anchors, not attendance periods.

## Design test

A strong sequence should let a student answer increasingly sophisticated versions of one question:

> **What is this machine doing underneath my software, what evidence lets me know, and why was it designed this way?**
