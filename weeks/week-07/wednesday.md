# Week 7 Wednesday - Trace the CPU

## Professional Minds

*Understanding by Design*. Ask what evidence would demonstrate actual understanding rather than component naming.

## Evidence grammar

**Predict -> Trace -> Compare -> Correct -> Explain -> Revise**

## Required evidence

Use your Week 6 `source-to-cpu.disassembly.txt` and choose the course-named familiar instruction.

Complete this bounded trace:

| Question | Evidence / answer |
|---|---|
| ISA semantic promise | |
| current PC / instruction | |
| source register(s) or immediate | |
| selected ALU/function | |
| memory read/write needed? | |
| write-back source/destination | |
| next-PC choice | |
| architectural state changed | |

Then compare with one different instruction class and identify only what changes.

## Control vocabulary

Use semantic labels, not a vendor control-bus census: source-A, source-B, ALU operation, memory read/write, write-back source, register-write, next-PC choice.

## Deliberate error task

Take one instructor-provided or AI-generated trace containing a wrong/ambiguous step. Correct it using the ISA promise plus the bounded course model.

## Overclaim warning

The trace explains a teaching datapath capable of implementing the instruction. It does not prove the organization of the physical CPU running your laptop.

## Dossier

**REVISE** the Machine Map with one compact datapath/ISA-visible-state annotation if it improves the persistent model.