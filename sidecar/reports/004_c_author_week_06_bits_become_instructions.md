# Sidecar Report 004_c - Author Week 6: Bits Become Instructions

**Status:** IMPLEMENTED WITH NAMED YELLOWS  
**Date:** 2026-08-16  
**Implementation:** `weeks/week-06/`

## Result

Week 6 is now a real technical week using one persistent `transform()` specimen rather than a disconnected number-systems chapter.

The intellectual movement is:

**source meaning -> fixed-width representation -> RV32I instruction/disassembly -> architectural state -> bounded explanation.**

Checkpoint 1 asks the student to follow one value/operation across that evidence chain.

## Hard decisions closed

- persistent specimen: course-owned `transform()`;
- canonical case: input 4 -> return 18;
- floating point: conceptual taste only;
- instruction encoding: one or two bounded examples, not whole-program hand encoding;
- endianness: concise observation when evidence makes it useful;
- ABI: `a0/x10` return convention only at this depth;
- Checkpoint 1: compact four-layer evidence trace using accepted rubric axes.

## Validation

Prompt 003's committed RISC-V v2 implementation already executes this exact specimen and verifies `x10/a0=18`, `x11/a1=18` on the executed Linux substrate. The Week 6 student deck and instructor-notes deck both compiled in the campaign validation pass.

## Boundary preserved

The Week 5 designed machine stays the workload/design context. RISC-V is the teaching ISA context. The course does not falsely claim the student's physical desktop is RISC-V or that the bounded interpreter reveals pipeline timing.

## YELLOWs

Only cross-platform release proof and final recording/showcase capture remain. These do not block Week 7 authoring.

**Disposition: 004_c IMPLEMENTED WITH NAMED YELLOWS; 004_d unblocked.**