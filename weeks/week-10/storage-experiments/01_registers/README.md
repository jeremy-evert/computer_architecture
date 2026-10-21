# Question

What changes when a loop's accumulator stays in an ordinary local variable versus being forced to memory each iteration?

# Prediction

My prediction: ______

# Run

```sh
make
make run
make asm
```

# What to look at

Compare the median `ns_per_iteration` rows and `median_ratio`. Each step does `x = (x ^ i) + 7`, so every iteration needs the answer of the one before it; the CPU cannot overlap them. (A first version used a multiply, which is about as slow as a memory round trip, so it hid the difference. That is why the loop is plain xor and add.) A global `volatile` sink uses the final value so the compiler cannot delete the loop.

After `make asm`, open `01_registers.s` and compare the loop `.L30` under `register_loop.isra.0` with `.L27` under `volatile_loop.isra.0`. The register loop never touches memory: `xorq %rdx, %rax`, `addq $1, %rdx`, `addq $7, %rax`, `cmpq`, `jne`. The volatile loop adds `movq -8(%rsp), %rax` (load x from the stack) at the top and `movq %rax, -8(%rsp)` (store x back) at the bottom. Those two lines are the whole difference. Another compiler may spell them differently.

# Expected shape

The register loop is a fraction of a nanosecond per iteration; the volatile loop is several times slower because each iteration waits for its own store to come back as a load. On april (`../receipts/april/01_registers_run*.txt`, pinned to one performance core) the register loop measured about 0.20 ns and the volatile loop about 1.48 ns per iteration, a ratio near 7. Your machine will differ; look for "several times", not a particular number.

# What would surprise us / falsify the idea

If assembly shows no per-iteration stack load/store for the volatile accumulator, or repeated memory traffic for the ordinary local, the generated code did not match the prediction. If timing is close, the machine may make these operations inexpensive relative to the arithmetic or noise may hide the gap.

# Caveat

The volatile loop does extra loads and stores by design; it is not a model of every real memory access. CPU frequency and background load affect timing.
