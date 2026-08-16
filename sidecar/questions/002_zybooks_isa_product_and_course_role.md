# Question 002 — Which zyBooks ISA/product should Architecture use?

**Status:** CLOSED / SUPERSEDED  
**Answer:** **None is required. No Fall 2026 zyBooks product selection is needed for the core course.**  
**Resolved from:** Jeremy, directly, 2026-08-16.

## Why this question is closed

The course direction changed from "keep zyBooks but choose the best ISA/product" to a stronger doctrine:

> Build the complete Computer Architecture course from open/freely accessible resources and course-created materials. Use textbooks and zyBooks only as optional references for course authors or interested students.

That removes the need to spend Foreman time comparing RISC-V, ARM, and MIPS zyBooks products for required adoption.

## What remains useful from the old discussion

RISC-V remains the planning-leading teaching ISA, but for reasons independent of zyBooks:

- open specification;
- strong open-source compiler/toolchain ecosystem;
- good simulators/emulators and teaching tools;
- broad use in contemporary Computer Architecture courses;
- clean fit with the accepted Week 5–14 spine.

The final simulator/emulator/toolchain still needs technical validation under the reproducible-lab workstream. That is a tooling decision, not a commercial-textbook decision.

## Historical resource provenance

The repository may preserve the old MIPS zyBook identifier and Patterson/Hennessy chapter information as historical/reference provenance. It must not be presented to students as required material.

Commercial books remain legitimate instructor references. Course authors may consult them while constructing explanations and checking coverage, subject to normal copyright boundaries. Student-facing required material must stand independently.

## Replacement work

The old vendor reconnaissance work order is replaced by:

`sidecar/prompts/002_build_open_source_architecture_canon.md`

That prompt should identify the best open/freely accessible source set for every week and detect any curriculum topic where we still need to create our own explanation, diagram, example, or lab.
