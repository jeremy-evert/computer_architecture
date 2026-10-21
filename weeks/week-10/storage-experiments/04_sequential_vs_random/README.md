# 04: Sequential and random access

## Question

How do access order and dependency change the time a CPU takes to read the same number of 64-bit values?

## Prediction

Before running, predict the order of all four modes from fastest to slowest.

My prediction: ______

## Run

```sh
make
make run
```

The program chooses a data buffer of at least 256 MiB and at least four times the last-level cache size reported by Linux. Each trial reads the buffer ten times, and every mode uses the same total number of reads. It runs three trials per mode and prints each trial plus the median. The CSV reports nanoseconds per read and effective GB/s.

## What to look at

Compare the two independent modes with the two dependent modes. In an independent loop, the CPU can have several loads in flight and overlap their wait. In a dependent loop, each address comes from the previous load, so the next read must wait. Sequential addresses also give the hardware prefetcher a pattern it can recognize and fetch ahead. Look at the four medians, not just one trial.

The program consumes each loop's result in a global volatile sink and uses a compiler barrier, so the compiler must keep the measured reads.

## Expected shape

Sequential-independent access should usually have the highest effective bandwidth: the CPU can overlap reads and the prefetcher can bring in upcoming cache lines. Random-independent access still has independent loads, but random data addresses make fetching less predictable. Sequential-dependent access loses overlap, though sequential prefetching can help. Random-dependent access is often slowest because each read waits for an unpredictable next address.


On april (`../receipts/april/04_sequential_vs_random_run*.txt`, three runs, medians agree within a few percent): sequential-independent about 0.17 ns per read (about 47 GB/s effective), sequential-dependent about 1.44 ns (about 5.5 GB/s), random-independent about 5.7 ns (about 1.4 GB/s), random-dependent about 113 to 117 ns (about 0.07 GB/s). That is roughly a 700 times spread for the same number of reads of the same buffer. The big gaps are (a) independent versus dependent in the sequential case, which is overlap, and (b) random-independent versus random-dependent, which shows how much overlapping outstanding misses hides.

## What would surprise us / falsify the idea

If dependent reads consistently match independent reads, check that the loop remains dependent and that the working set really exceeds cache. If random-independent access is unusually fast, remember that multiple outstanding requests can hide latency even when addresses are scattered.

## Caveat

The random-independent loop also reads its precomputed shuffled-index array sequentially, adding an extra stream of memory traffic. That traffic can affect its result, so this comparison is not a pure measurement of random data loads. Cache size, memory channels, CPU prefetching, and background work also change the shape.
