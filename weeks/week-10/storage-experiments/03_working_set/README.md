# Question

How does dependent random-access latency change as the working set grows across cache capacities?

# Prediction

My prediction: ______

# Run

```sh
make
make run > working_set.csv
python3 plot.py working_set.csv
```

# What to look at

The earlier [`lab/experiments/memory.c`](../../../../lab/experiments/memory.c) samples a few fixed sizes and also measures a streaming read. This experiment adds roughly four size steps per doubling, from 4 KiB through at least four times the last-level cache, and reports whether each size fits in CPU 0's L1d, L2, and L3 capacities. It follows a random cyclic permutation with dependent pointer chasing; each hop reads a pointer in a new cache line. The dependency prevents later addresses from being requested before the prior load finishes. Each size has three trials and a median row.

# Expected shape

A staircase that rises with working-set size, with blurry steps. In the three april runs (`../receipts/april/03_working_set_run*.txt`): flat near 1 ns up to 48 KiB (the L1 data size from 00), a jump to about 2.3 ns just past it, a slow climb to about 4.5 ns by 2.6 MiB, a steeper climb around 3 MiB (the L2 size) to 10 to 14 ns by 4 to 5 MiB, continuing to roughly 20 ns by 17 MiB and 25 to 32 ns near the 30 MiB L3 size, then 45 to 90 ns just past it and about 110 ns once the working set is several times the L3. Runs agree closely in the L1 and L2 range and wobble more (a few ns) around the L2 and L3 sizes. The steps do not land exactly on the advertised sizes; the sizes are a guide for where to look, not a promise.

# What would surprise us / falsify the idea

No step near a reported capacity, or steps elsewhere, would show that the cache-capacity picture alone does not explain this run. Shared caches, replacement, address translation, and system activity can move or blur transitions.

# Caveat

This is CPU 0's sysfs cache view, and the allocations are made by a normal Linux process. The operating system may schedule the process on a different core.
