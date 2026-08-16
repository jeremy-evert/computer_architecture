# Week 12 Monday - More Cores, More Problems

## Question

> **When does adding workers help, and when does cooperation cost more than it buys?**

## More workers is a hypothesis

Parallel speedup is constrained by serial work, scheduling, synchronization, shared-resource pressure, and communication.

## Amdahl's Law

Use the bounded model:

`S(N) = 1 / ((1-P) + P/N)`

Work one or two simple predictions. Amdahl gives an idealized ceiling under assumptions; it does not guarantee measured speedup.

## Speedup and efficiency

**Speedup** compares baseline runtime to N-worker runtime. **Efficiency** asks how much of N workers' ideal capacity is being realized. Both require a named baseline.

## Shared memory and synchronization

Threads can share data but correctness may require barriers, locks, atomics, or other coordination. Coordination creates waiting and can interact with cache/coherence behavior.

## Coherence and false sharing

At conceptual depth, caches must maintain a coherent shared-memory view. Independent variables on the same cache line can create needless coherence traffic. Week 12 does not pretend the scaling benchmark directly measures false sharing.

## Workload grain

**Chunky:** substantial useful local work between coordination points.  
**Chatty:** frequent dependent waiting/coordination.

This workload-shape vocabulary survives into Week 13.

## Chatterbox versus Freight Train

Hold total payload approximately fixed while changing message count and dependent waits. Frequent waits can dominate even when total data moved is small.

## AI Fluency

Record a scaling prediction, then explicitly **revise** it after evidence. AI may suggest mechanisms for deviation; label measured fact versus plausible mechanism.