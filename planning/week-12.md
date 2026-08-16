# Week 12 — More Cores, More Problems (Nov 2–6)

## Status
Accepted spine; small parallel experiment and coherence/synchronization demonstration still need authoring and validation.

## Weekly Focus
What changes when several cores can touch the same world at once? Introduce thread/data parallelism, speedup, Amdahl's Law, shared memory, synchronization, cache coherence, false sharing, and only enough consistency reasoning to explain observed behavior.

This is the first half of the **General + Specialized Parallelism** sister pair with Week 13.

## Monday — Nov 2 — Frame
Why does adding cores help some workloads a lot, others a little, and some not at all? Establish serial fraction, coordination, and shared-state costs.

## Wednesday — Nov 4 — Inspect / Build / Measure
Run a bounded repeatable parallel experiment. Compare one-thread and multi-thread behavior and, where the supported environment permits, expose a coordination effect such as synchronization overhead, contention, or false sharing.

## Friday — Nov 6 — Explain / Defend
Explain why the measured speedup differs from the naive "N cores = N times faster" story and identify at least one architecture/software interaction responsible.

## Evidence this week
A small parallel-performance receipt with controlled workload size, timing/measurement, and an evidence-backed speedup explanation.

## Open authoring notes
Reuse a workload/data layout that can continue into Week 13. The point is not concurrent-programming syntax mastery; it is understanding what general-purpose parallel hardware makes possible and difficult.
