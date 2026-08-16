# Computer Architecture - arc and sister-week map

This file explains the **shape underneath the week list**. It plays the same role that the Coding Odyssey arc map plays in CS1 while preserving Architecture's asynchronous laboratory identity.

The official course remains online/asynchronous. Monday/Wednesday/Friday are production and release anchors, not attendance periods.

## Course movement

The course crosses the software/hardware bridge in both directions:

**human intent -> program -> representation -> ISA -> processor -> memory/system mechanisms -> software-visible abstractions**

and then back upward:

**architecture constraints/opportunities -> workload behavior -> system design -> purchasing/design judgment**

Computer Architecture should not feel like a museum of hardware nouns. Students should repeatedly make a machine behave differently, measure what changes, and explain why.

## Arc structure

| Arc | Weeks | Movement | Closes at |
|---|---:|---|---|
| **1 - Build the investigator** | 1-4 | success habits -> AI verification -> reproducible environment -> Linux observation | Students can ask, run, inspect, record, reproduce, and verify before Architecture begins. |
| **2 - Build and open the machine** | 5-9 | machine design/economics -> representation + ISA -> datapath/control -> pipeline/performance -> full-stack trace | **Week 9 Checkpoint 2:** follow one small program through the stack without hand-waving. |
| **3 - Stress the machine** | 10-13 | cache/memory behavior -> VM/OS abstraction -> multicore/communication -> vector/GPU/accelerator specialization | Students have a measured sensitivity profile rather than vocabulary-only knowledge. |
| **4 - Become the architect** | 14 | compare tradeoffs, revisit the Week 5 design, defend changed or retained choices | **Week 14 Checkpoint 3:** final Machine Dossier and evidence-backed redesign. Architecture instruction ends. |
| **5 - Wind down and reflect** | 15-17 | curate -> Farkle/ML shared application -> reflection | No new Architecture theory; the frozen dossier becomes evidence for closure. |

## The Machine Dossier is the persistent object

Weeks 5-14 reuse one living artifact rather than resetting context every week.

The dossier contains:

- a student-designed machine;
- an observable real machine;
- parts/specifications/costs/interfaces;
- a Dollars-Per ledger that becomes more sophisticated as naive metrics are challenged;
- a sensitivity profile built from experiments;
- plots, traces, measurements, claims, corrections, and design decisions;
- a final Week 14 redesign/defense.

The dossier is **frozen at the end of Week 14**. Week 15 may curate it, Week 16 may naturally refer to it, and Week 17 may use it as reflection evidence, but those weeks do not add Architecture curriculum.

## Sister-week structure

### Weeks 5 + 6 - What machine did I buy, and what contract does it obey?

**Week 5: Build the Machine** starts outside-in.

Students create compatible and workload-shaped PC designs, compare cost/capability, build the initial memory/storage hierarchy, and establish Machine Dossier v0.

**Week 6: Bits Become Instructions** turns inward.

Students inspect representation, bytes, integer/floating-point behavior, RISC-V instructions, registers, and machine-visible state.

The shared movement is:

**workload -> component choice -> value -> bits -> instruction -> machine state**

Week 6 closes **Checkpoint 1**, a small evidence-backed trace across the hardware/software contract.

### Weeks 7 + 8 - Correct execution and fast execution

**Week 7: Crack Open the CPU** asks what has to exist for one instruction to execute correctly.

**Week 8: Make It Fast Without Breaking It** asks what changes when many instructions overlap.

The movement is:

**one instruction path -> overlapping paths -> dependency/hazard -> latency/throughput/CPI -> measured performance**

### Week 9 - Put the machine back together

Week 9 is a short Fall Break integration checkpoint, not filler.

Students follow one bounded program through several layers:

**source -> compiler/toolchain artifact -> representation -> RISC-V instruction -> processor behavior -> measured result**

The purpose is diagnosis and revision of gaps in the mental model.

### Weeks 10 + 11 - Feel the hierarchy, then see the illusion

**Week 10: Make the Memory Hierarchy Hurt** uses sensory experiments: pointer chasing versus streaming, changing working-set size, cache cliffs, latency, bandwidth, and locality.

**Week 11: The Useful Lie of Memory** looks upward at the mechanisms that create private address spaces, protection, page translation, traps, interrupts, and device I/O.

The relationship is:

**measured physical hierarchy -> translation/protection/I/O mechanisms -> useful software abstraction**

### Weeks 12 + 13 - General workers and specialized workers

**Week 12: More Cores, More Problems** makes students experience the cost of cooperation: synchronization, false sharing, communication latency, and scaling limits.

**Week 13: Different Machines for Different Work** asks when vectors, GPUs, or accelerators justify a different organization.

The relationship is:

**more workers -> coordination/data movement cost -> workload shape -> specialization**

### Week 14 - Sit in the architect's chair

Week 14 changes the question from "how does this mechanism work?" to:

> **Given a workload and a budget, what should I build now, and what evidence changed my mind?**

Students revisit the Week 5 machine under the same or explicitly bounded constraints, choose appropriate metrics, and defend changed or retained design choices with the semester's evidence.

This is the technical finale and **Checkpoint 3**. The Machine Dossier is frozen here.

## Weeks 15-17 deliberately stop climbing

- **Week 15:** asynchronous Thanksgiving wind-down. Curate/catch up. No new Architecture mechanism or dossier layer.
- **Week 16:** shared Farkle + Machine Learning fun/application week. Architecture may echo through predictions or observations, but this is not a new capstone or Checkpoint 4.
- **Week 17:** reflection. No new technical material.

## Reusable M/W/F grammar

After Week 1, each week uses a recognizable asynchronous production shape:

1. **Monday - Think / Frame / Lecture**
   - AI Fluency lens;
   - central machine question;
   - course-owned lecture/digest/deck;
   - prediction before evidence.
2. **Wednesday - Investigate / Break / Measure**
   - Professional Minds;
   - hands-on experiment, trace, build, or measurement;
   - Jeremy may record the canonical lab using his real stack.
3. **Friday - Explain / Defend / Stack Showcase**
   - Professional Minds;
   - bounded evidence receipt;
   - instructor real-stack showcase when useful.

The instructor's paid/frontier/local stack is visible pedagogy, not a required student stack.

## Design test

A strong week should let a student answer a more sophisticated version of:

> **What did I predict, what did I make the machine do, what changed, what evidence proves it, and what design decision follows?**
