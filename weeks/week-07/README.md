# Week 7 - Crack Open the CPU

> **Central machine question:** What has to exist inside the CPU for one instruction to execute correctly?

## Week at a Glance

**Prior belief:** if I know what an instruction means, the inside of the CPU is mostly implementation trivia.

**Prediction:** for one familiar Week 6 instruction, predict what state must be read, what operation happens, what selections/control choices are needed, and what state changes.

**AI Fluency:** Lens 7 - Research & Retrieve.  
**Professional Minds:** Wednesday - *Understanding by Design*; Friday - *Rethinking Grading*.

Monday builds only the structures the familiar instruction needs. Wednesday traces the instruction through the bounded SWOSU datapath. Friday corrects a deliberate trace error using the model and ISA evidence.

## Continuity

Reuse the Week 6 `transform()` specimen and its disassembly. No new toy program.

## Bounded SWOSU datapath

The teaching path is:

**PC -> fetch/decode -> register file / immediate -> ALU -> optional data memory -> write-back / next PC**

Muxes and control choose which path is active. This is a teaching model, not a transistor-level or modern superscalar diagram.

## Machine Dossier handoff

**Action: REVISE.** Add one CPU/datapath trace or annotation only if it improves the persistent machine model. Do not create a circuit workbook.

## Required path

No new simulator is required. Use the Week 6 disassembly plus the course-owned trace table in [`wednesday.md`](wednesday.md).

## Equity / scope

Zero-cost and CPU-only. Rich real microarchitecture diagrams may appear in the instructor showcase only after the bounded model is understood.