# Week 7 - Crack Open the CPU (Sep 28-Oct 2)

## Status
Accepted focus; exact datapath teaching model/simulator/build and validation still need authoring.

## Weekly Focus
**What has to exist inside the CPU for one instruction to execute correctly?**

Students previously treated the CPU as a chosen component and the ISA as a contract. Now crack the box open enough to see how hardware keeps that contract.

## Monday - Think / Frame / Lecture
**AI Fluency Lens 7: Research and Retrieve.**

Lecture: **Crack Open the CPU.**

Use authoritative references to establish the bounded model:

- stored-program idea;
- program counter;
- register file;
- ALU;
- instruction/data memory;
- muxes and control signals;
- decode;
- single-cycle datapath/control at an appropriate scope.

## Wednesday - Investigate / Break / Measure
**Professional Minds: _Understanding by Design_ - How do we design meaningful systems?**

Trace or build the bounded datapath/control required for one already-familiar RISC-V instruction.

The student should be able to change/remove one needed path/control choice and explain what breaks.

## Friday - Explain / Defend / Stack Showcase
**Professional Minds: _Rethinking Grading_ - How do we design meaningful learning?**

Defend why each important datapath/control component is necessary for the chosen instruction rather than merely labeling a diagram.

**Stack Showcase:** use the selected simulator/visualizer or real microarchitecture evidence to connect the teaching model to a contemporary processor.

## Evidence this week
A processor/datapath trace or bounded build plus an explanation of what machine state changes and why.

## Machine Dossier role
Crack the Week 5 CPU box open conceptually; add a compact datapath/control trace where it improves the persistent machine model.

## Online-delivery note
M/W/F are asynchronous anchors. The build/trace must have a supported individual path.

## Open authoring notes
Keep the build bounded. A small processor path students truly understand is more valuable than a giant half-finished CPU project.
