# Prompt 004_c - Author Week 6: Bits Become Instructions

**Status:** OPEN  
**Depends on:** 004_a and 004_b  
**Checkpoint:** Machine Dossier Checkpoint 1

## Why this week exists

Week 5 built a machine at human scale. Week 6 begins moving downward.

The job is not to teach a disconnected number-systems chapter. The job is to make students feel the hardware/software contract: **meaning has to become bits, bits become instructions, and instructions change machine-visible state.**

## Central question

> **What must software and hardware agree on for a program to run?**

## Continuity object

Use one bounded specimen/value family that can survive Weeks 6-9.

Prompt 003 already proved a small `transform()`-style C specimen through RV32I. Prefer reusing/adapting it unless authoring evidence shows a materially better teaching specimen.

Do not introduce a different toy program for every representation topic.

## Concept boundary

Teach only what makes the evidence chain meaningful:

- binary and hex;
- fixed-width values;
- unsigned vs signed/two's-complement;
- overflow;
- floating-point approximation at a humane conceptual depth;
- bytes and endianness where useful;
- RISC-V register/instruction basics;
- instruction encoding at bounded depth;
- source -> assembly -> binary/state;
- calling convention/ABI only when the specimen makes it necessary.

Avoid turning this into Digital Logic or Compiler Construction.

## Monday package

Narrative target:

1. humans write meaning;
2. machines store bit patterns;
3. interpretation depends on an agreed contract;
4. instructions are also encoded agreements;
5. the same bit pattern can mean different things under different interpretations;
6. the toolchain gives us evidence instead of requiring faith.

End with a prediction about a specific value/instruction that Wednesday can verify.

## Wednesday investigation

Use stable Prompt 003 interfaces, especially:

```text
archlab run riscv
```

Students should inspect a small chain such as:

**source expression -> value representation -> generated RISC-V instruction(s) -> encoding/disassembly -> register/memory state -> result**

They should encounter at least one place where an intuitive explanation is incomplete without width/sign/representation context.

## Checkpoint 1

This is the first synthesis checkpoint, intentionally lighter than Weeks 9/14.

Require the student to follow one value/operation across several layers and provide evidence.

Rubric axes:

- Functions/Runs;
- Concept use;
- Explanation;
- Demonstrability/Reproducibility.

Do not add a new grading category.

## Friday Explain / Defend

Ask the student to defend one interpretation from actual state/disassembly rather than from a textbook statement.

Include one limitation: what does the bounded RV32I interpreter show, and what does it *not* show?

## Machine Dossier

Add representation/ISA evidence and Checkpoint 1 trace. Do not explode the dossier with binary worksheets.

## AI Fluency Lens 6

Engineer the prompt until an AI explanation becomes testable.

Useful pattern:

1. ask for a representation/RISC-V explanation;
2. identify vague claims;
3. rewrite the prompt around the exact specimen/value;
4. verify against disassembly/state.

## Professional Minds

Wednesday: *Statistics Done Wrong*  
Friday: *Understanding Statistics and Experimental Design*

Connection: evidence quality and interpretation, not a second statistics assignment.

## Stack Showcase

Compile/disassemble/inspect the same tiny program using the instructor's real tool stack. Multiple AI explanations may be compared, but the executable evidence gets the final vote.

## Hard decisions 004_c must make

- exact persistent specimen;
- exact values/edge cases;
- how much floating point fits without stealing the week;
- how much instruction encoding students calculate by hand;
- whether endianness is a live observation or concise demonstration;
- exact Checkpoint 1 submission shape;
- how much ABI/calling convention is necessary now vs Week 9.

## Validation

- run the exact student specimen through the supported RISC-V path;
- confirm disassembly and expected architectural state;
- check any hand-derived encoding examples;
- build/render the lecture/deck;
- prove Checkpoint 1 can be completed without hidden tooling.

## Report

Write `sidecar/reports/004_c_author_week_06_bits_become_instructions.md`.

## Done when

The student can point at one value/operation and say, with evidence, **how its meaning survives the trip into machine representation and state**.