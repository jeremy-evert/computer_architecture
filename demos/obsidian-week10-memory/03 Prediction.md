# Prediction before measurement

**Hypothesis:** Increasing the working set should affect the dependent pointer-chase latency more strongly than the contiguous stream bandwidth. The two measurements should not collapse into one “memory speed” number.

**What would support it:** pointer-chase time per access rises across larger working sets while stream throughput changes by a different amount or shape.

**What would not be justified:** naming an exact cache boundary from a timing curve alone, claiming one result applies to all CPUs, or claiming the CPU’s advertised inventory caused a specific transition without corroborating evidence.

The six repeated runs in [[05 Observed Results]] can test the qualitative prediction. Noise, frequency changes, scheduling, prefetching, cache/TLB behavior, and process placement remain possible influences. [[06 Conclusion and Decision|The decision must preserve those limits]].
