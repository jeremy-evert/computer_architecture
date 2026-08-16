# Week 7 Monday - Crack Open the CPU

## Question

> **What has to exist inside the CPU for one instruction to execute correctly?**

## Start from the ISA promise

Week 6 established what an instruction promises to do to architectural state. Week 7 works backward: what structures must exist to keep that promise?

## Build the datapath because the instruction needs it

For a familiar arithmetic/immediate instruction:

1. the **PC** identifies the current instruction;
2. instruction bits are fetched and decoded;
3. the **register file** supplies named source state;
4. an **immediate generator** supplies encoded constants when needed;
5. the **ALU** performs arithmetic/comparison/address work;
6. **muxes** select among possible sources/results;
7. **control** chooses behavior for this instruction class;
8. **write-back** changes architectural state;
9. the next PC is selected.

## State versus plumbing

Registers, memory, and PC behavior are visible in the ISA contract. Muxes, control lines, ports, and the exact teaching datapath are implementation mechanisms.

## Load/store and branch taste

Trace one bounded example from another instruction class to show how the path changes. Do not build a complete HDL processor.

## Why this is not a modern CPU diagram

A real out-of-order processor can rename registers, issue multiple operations, speculate, and contain many layers absent from our model while still implementing the same ISA-visible behavior.

## AI Fluency

Retrieve an authoritative ISA explanation and compare it with an AI-generated datapath explanation. A disagreement may be a scope/model mismatch rather than a simple factual error.

## Prediction

Choose one Week 6 instruction and predict its input state, major path, operation, control choices, and changed state before Wednesday.