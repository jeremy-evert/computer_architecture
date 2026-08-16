# Week 6 - Bits Become Instructions (Sep 21-25)

## Status
Accepted spine and Checkpoint 1 role; exact examples/toolchain/lab still need authoring and execution validation.

## Weekly Focus
**What must software and hardware agree on for a program to run?**

Move from the machine students chose in Week 5 to the representations and instruction contract inside it, using RISC-V as the planning-leading teaching ISA.

## Monday - Think / Frame / Lecture
**AI Fluency Lens 6: Engineer the Prompt.**

Lecture: **Bits Become Instructions.**

Useful coverage:

- binary and hexadecimal as machine-reading notation;
- fixed-width unsigned/signed integers and two's complement;
- overflow;
- floating-point approximation at useful depth;
- bytes/endianness where useful;
- registers, memory, RISC-V instruction forms and encodings;
- source -> assembly -> machine-visible state;
- calling convention/ABI only far enough to explain observed compiler output.

## Wednesday - Investigate / Break / Measure
**Professional Minds: _Statistics Done Wrong_ - How do we know something is true?**

Reuse a tiny program/value story from Week 5.

Inspect:

**source value/operation -> bytes/representation -> assembly/RISC-V instruction -> registers/memory/state**

Students should change one bounded input/operation and predict what will change before recompiling/inspecting.

## Friday - Explain / Defend / Stack Showcase
**Professional Minds: _Understanding Statistics and Experimental Design_ - How do we know something is true?**

**Checkpoint 1:** defend one compact evidence chain across multiple layers.

**Stack Showcase:** Jeremy compiles, disassembles, and steps the same tiny program with his real stack, using AI tools as visible assistants while machine evidence remains authoritative.

## Evidence this week
Checkpoint 1 should show:

- claimed software meaning;
- actual representation/encoding;
- relevant instruction(s);
- observed state/result;
- student's explanation of the contract.

## Machine Dossier role
Add representation/ISA evidence and Checkpoint 1.

## Online-delivery note
M/W/F are asynchronous anchors. Checkpoint evidence must be individually reproducible; no live demonstration is required.

## Open authoring notes
Avoid turning the week into either a binary-conversion worksheet marathon or an assembly-programming course. Floating-point and ABI depth should be bounded by what later labs need.
