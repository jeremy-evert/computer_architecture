# Week 10 — The Memory Illusion I: Memory Hierarchy + Caches (Oct 19–23)

## Status
Accepted spine; exact locality/cache experiment still needs authoring and execution validation.

## Weekly Focus
Why can memory appear both large and fast only by using layers? Introduce temporal/spatial locality, cache lines/blocks, hits/misses, mapping/associativity at an appropriate depth, and basic performance reasoning.

This is the first half of the **Memory Reality + Memory Illusion** sister pair with Week 11.

## Monday — Oct 19 — Frame
Start from the processor's need for data and confront the physical problem: fast storage is scarce and expensive; large storage is farther away and slower. Locality is the software behavior that makes hierarchy useful.

## Wednesday — Oct 21 — Inspect / Build / Measure
Run or inspect a bounded access-pattern experiment that changes locality and exposes timing/cache behavior. Connect measured behavior to cache organization where practical.

## Friday — Oct 23 — Explain / Defend
Explain why two programs/access patterns doing apparently similar work can behave differently because of the memory hierarchy.

## Evidence this week
A locality/cache investigation with measured or simulated evidence and a short interpretation of hits/misses/performance behavior.

## Open authoring notes
Carry one program/data story into Week 11 so physical memory behavior becomes the foundation for software-visible address-space abstractions rather than a disconnected cache chapter.
