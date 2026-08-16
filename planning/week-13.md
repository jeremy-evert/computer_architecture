# Week 13 — Different Machines for Different Work (Nov 9–13)

## Status
Accepted spine; CPU-only comparison activity and optional accelerator extension still need authoring/validation.

## Weekly Focus
Why do vectors, GPUs, NPUs, and other accelerators exist if CPUs are already programmable? Connect workload shape to SIMD/vector execution, throughput vs latency, GPU/SIMT ideas, memory bandwidth/data movement, and specialization.

This is the second half of the **General + Specialized Parallelism** sister pair with Week 12.

## Monday — Nov 9 — Frame
Start from Week 12's multicore workload and ask whether adding more general-purpose cores is always the right answer. Introduce specialization as a response to regular, parallel, data-heavy workloads.

## Wednesday — Nov 11 — Inspect / Build / Measure
Compare at least two execution shapes, such as scalar vs vectorized CPU or general-purpose vs accelerator-oriented implementations. A CPU-only path is mandatory; GPU/accelerator access may provide an optional comparison.

## Friday — Nov 13 — Explain / Defend
Explain when specialized hardware is a good fit, what overhead or limitation comes with it, and why software/data layout still matters.

## Evidence this week
A controlled comparison of workload implementations or execution models with an evidence-backed explanation of throughput, latency, bandwidth, parallelism, or specialization tradeoffs.

## Open authoring notes
Do not create a hardware-access arms race. Students without a GPU must be able to complete the same required conceptual work and earn the same grade.
