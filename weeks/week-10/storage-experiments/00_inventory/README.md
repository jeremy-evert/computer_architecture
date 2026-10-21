Linux only (WSL2 works).

# Question

What storage and CPU details can this machine report directly?

# Prediction

My prediction: ______

# Run

```sh
make
make run
```

# What to look at

Read the `key=value` lines. Cache entries come from CPU 0's sysfs cache indexes. The root filesystem is named from the mounted root entry; disk models appear only when readable without elevated access. `unknown` means the operating system did not provide that item.

# Expected shape

Expect one CPU model, several cache fields, system page and CPU counts, and possibly disk models. CPU 0's caches may not describe every core. The final note reports whether sysfs exposes multiple core types or CPU capacities.

# What would surprise us / falsify the idea

If cache entries or system values are absent, the operating system does not expose them through these interfaces. That is a limit of this inventory, not evidence that the hardware has no cache or memory.

# Caveat

Sysfs describes this running Linux view. Virtual machines and containers can hide or reshape host hardware details. `virtualization=wsl2` appears when the kernel release string contains "microsoft"; otherwise the line says `none_detected`, which only means WSL2 was not recognized. `physical_ram_bytes` is the RAM this OS can see, which inside a VM may be less than the host has.
