# Week 6 — The Hardware/Software Contract: ISA + RISC-V (Sep 21–25)

## Status
Accepted spine. RISC-V is the planning-leading teaching ISA; exact free/open toolchain and simulator path still need prototype validation.

## Weekly Focus
What must software and hardware agree on for a program to run? Connect source intent to registers, memory, instructions, encodings, control flow, procedures, and machine-visible state.

This is the second half of the **Meaning + Contract** sister pair with Week 5.

## Monday — Sep 21 — Frame
An ISA as a contract between software and hardware. Introduce the smallest useful subset of RISC-V needed to understand a tiny program: registers, loads/stores, arithmetic, branches/jumps, and instruction encoding where it improves understanding.

## Wednesday — Sep 23 — Inspect / Build / Measure
Compile/disassemble/step one of Week 5's tiny programs. Inspect assembly, instructions, registers, memory, and machine code using the supported open toolchain/simulator path.

## Friday — Sep 25 — Explain / Defend
Trace how a small source-level operation becomes machine instructions and defend the explanation with compiler/disassembly/simulator evidence.

## Evidence this week
A source → assembly → instruction/register/memory trace for one bounded program, with a short explanation of what the ISA contract made possible.

## Open authoring notes
Prefer the smallest coherent RISC-V stack that works reliably on the Week 3 lab platform. The course must not depend on zyBooks or a paid simulator. Keep compiler/assembler/linker/loader boundaries only as deep as they sharpen the architecture story.
