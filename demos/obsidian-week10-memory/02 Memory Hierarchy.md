# Memory hierarchy: locality, latency, bandwidth

The CPU uses nearby cache levels to make common accesses fast while RAM provides much larger capacity. A cache line brings nearby bytes together; temporal and spatial locality can make that useful.

This experiment contrasts two workloads as the active data grows:

- **Pointer chase:** each load determines the address of the next load. The dependency chain limits overlap and ordinary streaming prefetching.
- **Stream read:** values are read contiguously and summed. The processor can exploit spatial locality and overlap more work.

Latency (time per dependent access) and bandwidth (bytes per second) answer different questions. A change in either curve is evidence about these workloads on this system, not a universal score. [[04 Experiment|See the exact implementation and command]].

Maise exposed host-visible 32 KiB L1 data cache per core, 512 KiB L2 per core, and a 16 MiB L3 instance shared by a core group in the captured machine probe. Those inventory values are context, not proof that a measured curve transition occurred at one exact boundary. See [[05 Observed Results|the observed curve summaries]].
