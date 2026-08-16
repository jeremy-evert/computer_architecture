# Prompt 004_h - Author Week 11: The Useful Lie of Memory

**Status:** OPEN  
**Depends on:** 004_g  
**Continuity:** move from physical memory behavior to software-visible abstraction

## Why this week exists

Week 10 made physical hierarchy behavior visible. Week 11 asks why a process does not simply experience “physical RAM.”

The week should reveal that the clean world software sees is a useful abstraction built jointly by hardware and the OS.

## Central question

> **What hardware mechanisms create the memory/process world software thinks it sees?**

## Required concepts

Bound to Architecture relevance:

- virtual vs physical addresses;
- pages/page tables;
- TLB;
- protection/privilege;
- page faults;
- traps/exceptions/syscalls;
- interrupts;
- device/I/O path at introductory depth;
- storage/persistence relationship where useful.

Do not attempt Operating Systems in a week.

## Monday package

Begin from a Week 10 memory access and ask:

> When a program uses an address, what does that address actually mean?

Build the translation/protection story only far enough to explain observable behavior.

Use one process/memory map or bounded address example throughout rather than unrelated diagrams.

## Wednesday investigation

Prefer an observable process evidence path.

Candidates on supported Linux/WSL surfaces:

- `/proc/<pid>/maps` or a course-controlled equivalent;
- process virtual mappings;
- page size;
- bounded fault counters where safely exposed;
- syscall tracing or another controlled OS transition;
- file-backed mapping or I/O observation where it clarifies the story.

If a live page-fault/storage experiment is too fragile or platform-shaped, use a curated trace plus real local observations rather than pretending universality.

## Friday Explain / Defend

Require students to distinguish:

- what is directly observed;
- what mechanism explains it;
- what remains hidden/abstracted.

A good receipt might ask them to defend why two processes can use similar-looking virtual addresses without sharing the same physical state.

## Machine Dossier

Add VM/protection/I/O evidence only if it improves the Machine Map or explains an earlier measurement. A concise mechanism/trace is enough.

## AI Fluency Lens 11

Verify.

Ask AI for a claim about virtual memory/process behavior, then verify using observable OS evidence and primary docs. Make scope part of the answer.

## Professional Minds

Wednesday: *Software Project Management*  
Friday: *Growing Object-Oriented Software, Guided by Tests*

Do not invent a fake project-management analogy for page tables. Let the strands coexist meaningfully.

## Stack Showcase

Candidates:

- inspect a real process with `/proc`, `strace`, debugger, or profiler;
- show a page fault/mapping event;
- compare host/container/WSL process views;
- show how an AI explanation of “memory” changes when asked to distinguish virtual/physical/resident/file-backed.

## Hard decisions 004_h must make

- exact live observation sequence;
- whether page-table arithmetic is needed and how much;
- whether a live fault experiment is reliable enough;
- storage sequential/random placement;
- syscall/trap/interrupt depth;
- portable fallback for macOS/non-Linux later;
- exact continuity artifact from Week 10.

## Validation

- run every live observation on the intended supported substrate;
- remove assumptions about privileged access;
- verify `/proc`/tool output parsing is not brittle;
- prepare a validated trace fallback;
- verify claims against official Linux/RISC-V sources as appropriate.

## Report

Write `sidecar/reports/004_h_author_week_11_the_useful_lie_of_memory.md`.

## Done when

Students can explain, using bounded evidence, that software's memory/process world is **constructed by translation, protection, privilege, and OS/hardware cooperation**, not simply a direct view of RAM.