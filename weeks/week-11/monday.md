# Week 11 Monday - The Useful Lie of Memory

## Question

> **What hardware mechanisms create the memory/process world software thinks it sees?**

## An address is part of an abstraction

A process typically issues **virtual addresses**. Hardware translation plus OS-managed mappings create a private/protected view that need not correspond to an obvious physical address.

## Pages and page tables

Virtual address space is divided into pages. Translation structures map virtual pages toward physical frames or other states. Work one small address split into **virtual page number + page offset**; do not perform a giant multi-level walk.

## The TLB

Translation itself would be expensive if every access walked page tables. A TLB caches recent translations, adding another locality-sensitive structure to the memory story.

## Protection and privilege

Mappings carry permissions. Processor privilege and translation/protection machinery let the system reject accesses that should not succeed.

## Faults are transitions

A page fault means the current state cannot complete the memory reference normally. The OS may allocate, load, remap, reject, or otherwise handle the event.

## Traps, syscalls, interrupts

At bounded depth:

- a syscall intentionally requests privileged service;
- exceptions/traps transfer control because of synchronous program/processor state;
- interrupts represent asynchronous events.

Exact naming/taxonomy can vary by architecture; use the RISC-V/Linux sources for our bounded model.

## Observable process evidence

Linux `/proc/<pid>/maps` exposes virtual mapping ranges, permissions, and file-backed paths where applicable. That is powerful evidence, but it does not tell you a simple physical frame number for every address.

## Storage/I-O boundary

File-backed mappings and persistence connect memory to storage/I-O. Keep the story on translation/protection/cooperation rather than turning this into a storage benchmark week.

## AI Fluency

Ask AI for a specific VM/process claim, then verify it with local evidence and primary documentation. Scope is part of the answer.