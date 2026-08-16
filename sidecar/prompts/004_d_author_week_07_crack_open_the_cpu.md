# Prompt 004_d - Author Week 7: Crack Open the CPU

**Status:** OPEN  
**Depends on:** 004_a, 004_c  
**Continuity:** reuse the Week 6 specimen/instructions

## Why this week exists

Week 6 proved that instructions change architectural state. Week 7 asks the obvious next question:

> **What has to exist inside a CPU for that instruction to happen at all?**

This week makes the CPU stop being a labeled rectangle.

## Central question

> **What has to exist inside the CPU for one instruction to execute correctly?**

## Scope

Use a bounded teaching datapath/control model.

Required concepts at useful depth:

- stored-program idea;
- program counter;
- instruction memory/flow;
- register file;
- ALU;
- data memory where relevant;
- immediates;
- muxes/data selection;
- control signals;
- state update;
- one or a few instruction families.

Explicitly state that this is a teaching model, not a transistor-level or modern superscalar implementation diagram.

## Monday package

Build the datapath because the familiar Week 6 instruction *needs* each piece.

Avoid the classic failure mode of showing a finished spaghetti datapath and naming arrows.

Preferred narrative:

1. start with the instruction's semantics;
2. ask what state must be read;
3. ask what operation must happen;
4. ask what result/state must be written;
5. introduce only the structures needed;
6. introduce control as the mechanism that selects behavior.

End with an instruction students predict through the model.

## Wednesday investigation

Author one trace/build activity where the student follows a known instruction through the bounded datapath.

This may use a course-owned diagram/worksheet/interactive artifact. Do not add a giant simulator unless it materially improves the accepted evidence task.

The student should identify:

- inputs;
- path through major components;
- operation;
- control choices;
- changed state;
- what would differ for another bounded instruction class.

## Friday Explain / Defend

Give a trace or claim with one deliberate error or ambiguity and require the student to defend/correct it using the datapath model.

Raw labeling should not be sufficient.

## Machine Dossier

Add only a CPU/datapath trace or conceptual machine-map annotation if it improves the persistent model. Do not turn the dossier into a circuit workbook.

## AI Fluency Lens 7

Research and Retrieve.

Have students compare an AI-generated datapath explanation against an authoritative source and the course's bounded teaching model. The interesting question is often not “is AI wrong?” but “is it describing a different CPU model/scope?”

## Professional Minds

Wednesday: *Understanding by Design*  
Friday: *Rethinking Grading*

Use them to ask what evidence would demonstrate actual understanding of the CPU, not to create extra work.

## Stack Showcase

Candidates:

- a processor/datapath simulator;
- actual compiled instruction behavior plus architecture documentation;
- a real microarchitecture diagram used carefully to show how much richer reality becomes;
- AI models disagreeing about a trace, followed by verification.

## Hard decisions 004_d must make

- exact SWOSU datapath model/diagram;
- instruction subset used;
- whether students construct pieces or trace a provided model;
- exact control-signal depth;
- treatment of memory and branches;
- best distinction between ISA-visible state and implementation detail;
- what artifact survives into Week 8.

## Validation

- independently verify every datapath/control trace;
- ensure source/diagram licensing is course-owned or compliant;
- check Week 6 instruction continuity;
- verify Friday task cannot be answered by mere component naming.

## Report

Write `sidecar/reports/004_d_author_week_07_crack_open_the_cpu.md`.

## Done when

Students can take one familiar instruction and explain **why each major CPU structure/control choice is necessary for the promised state change**.