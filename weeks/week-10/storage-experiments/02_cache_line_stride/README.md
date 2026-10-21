# Question

How does walking an array with larger strides change the cost of each access?

# Prediction

My prediction: ______

# Run

```sh
make
make run
```

# What to look at

The array is 256 MiB (512 MiB if CPU 0's largest cache is over 128 MiB). For each stride the program makes the same 100 million accesses, wraps around the array, and reports three trials plus their median. Fixed access count keeps the number of measured loads constant while changing how many distinct lines the walk touches. Compare `stride_bytes` with the line size from `00_inventory`.

# Expected shape

Stride 1 (4 bytes) is cheapest per access: many accesses share one 64-byte line. Cost per access then climbs as the stride grows toward the line size, because each access needs a new line. In the three april runs (`../receipts/april/02_cache_line_stride_run*.txt`, medians agree within about 2%) it went from about 0.56 ns at stride 1, to 1.3 ns at 32 bytes, 2.2 ns at 64 bytes (the reported line size), then 3.4 ns at 128 bytes and a flat shelf near 3.6 to 3.7 ns for 256 bytes and up, with a further rise at 2048 bytes. So the climb ends at 128 bytes, not 64: this CPU appears to fetch lines in pairs or prefetch the neighbor, which is a real effect, not an error. The first rows (stride 2 slower than stride 4) show that small strides interact with the loop and prefetcher in ways the line-size picture does not explain.

# What would surprise us / falsify the idea

No visible knee, or a knee far from the reported line size, weakens the simple line-boundary prediction for this access pattern. Hardware prefetch can hide the expected rise.

# Caveat

This array can use up to 512 MiB of memory. The operating system, cache sharing, and competing work affect the observed shape.
