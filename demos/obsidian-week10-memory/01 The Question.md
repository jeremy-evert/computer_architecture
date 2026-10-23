# The question

> **What's keeping us from pushing the machine for even greater results?**

For this small investigation, we narrow that broad design question to the Week 10 prompt: **Why do we need layers of memory, and what does crossing a layer feel like?**

The useful distinction is not simply “fast memory” versus “slow memory.” [[02 Memory Hierarchy|Working-set size and access pattern]] can change the latency of one dependent access differently from the bandwidth of a stream. [[03 Prediction|Our prediction]] is deliberately about the shape of evidence, not an exact cache boundary.

[[04 Experiment|The executable experiment]] perturbs working-set size. [[05 Observed Results|The measurements]] show what happened on this host. [[06 Conclusion and Decision|The conclusion]] keeps measured facts separate from a plausible mechanism.
