# Monday - Reproducibility is a contract

Work through the shared Computing Commons lesson this week:
`computing_commons/curriculum/containers-and-repeatable-environments.md`
(deck: `computing_commons/slides/week3_containers/week3_containers.pdf`). It
teaches image vs. container, pinned digest identity, and bind mounts once;
this page and Wednesday/Friday apply that shared concept to Architecture's
question: **where does the machine end?**

"It worked on my machine" is not a useful experiment receipt.

A reproducible systems experiment needs enough context that another person can answer:

- **What did you run?** exact command and workload.
- **What software executed it?** relevant tool/runtime versions.
- **Where did it run?** execution environment and scope.
- **What stayed fixed?** inputs, seed, configuration, source version.
- **What may vary?** timing noise, host hardware, scheduling, implementation details outside the controlled environment.
- **What evidence came out?** receipt, CSV, trace, or other inspectable artifact.

## Containers are one answer, not the definition

A container can freeze many software dependencies. It cannot magically make two physical CPUs identical, eliminate timing noise, or prove that host-visible hardware is the same.

This course therefore uses a broader rule:

> **Control what must be controlled. Record what cannot be controlled.**

The validated course lab lives under `lab/` and exposes stable wrappers such as:

```text
./lab/bin/archlab doctor
./lab/bin/archprobe --out-dir <directory>
```

Those wrappers avoid a mandatory package-install step and make the required path less fragile.

## Your prediction

Before Wednesday, write three environment facts you expect a reproducibility receipt to need and one thing you expect to vary between two runs.
