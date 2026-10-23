# Conclusion and decision

## Claim

For this Linux host and this generated workload, increasing the working set changed dependent pointer-chase latency much more sharply than it changed contiguous stream throughput; at 32 MiB both measures were worse than their smaller-working-set medians.

## Evidence

Six runs of the course's Week 10 memory sweep are recorded in [[05 Observed Results]]. The run receipts say `PASS`; the raw CSVs hold the measurements. The saved machine probe identifies the visible CPU/cache context.

## Gap

No performance counters were collected. We did not control processor placement, boost frequency, temperature, system load, or the operating system. The data show a size-dependent shape, not an exact cache transition. This is not a cross-machine comparison.

## Decision

Keep the design-level question open: if this workload matters, measure its access pattern and target system before spending effort on a larger cache or faster memory. A useful next experiment would add repeated randomized-size sweeps or trustworthy hardware counters, then compare the shape. Do not claim those measurements have already happened.

This is the point of [[07 Why Keep a Notebook]]: the next engineer can see what was observed, what was inferred, and what is still unknown.
