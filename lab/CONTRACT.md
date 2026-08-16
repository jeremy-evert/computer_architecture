# Architecture Laboratory contract

## Stable interface for week authors

Prompt 004 may build on these interfaces without inventing new runners:

```text
archlab doctor
archprobe [--out-dir DIR]
archlab run riscv|dependency|memory|scaling|communication|vector
archplot dependency|memory|scaling|communication|vector DATA.csv --out FIGURE.png
archlab dossier build --work-dir DIR [--figure FIGURE.png ...]
archlab smoke
```

The command wrappers live under `lab/bin/` and require no Python package installation.

## Observatory vs Experimental Chamber

- **Observatory:** run `archprobe` outside a container when the claim concerns the student's actual machine. The probe marks WSL/container scope and is allowed to report unknown/not exposed.
- **Experimental Chamber:** common software/tool environment for compiling, measuring, plotting, and dossier generation. A container definition is provided, but native Linux/WSL execution is also supported when `archlab doctor` passes.

Never relabel container-visible evidence as physical-host truth.

## Experiment inventory

| Experiment | Intended course use | Perturbation / comparison | Evidence |
|---|---|---|---|
| `riscv` | W6-W9 | source/assembly -> RV32I -> architectural state | ELF/raw binary, disassembly, instruction trace, register state |
| `dependency` | W8 | one dependency chain vs independent chains | ns/update + plot |
| `memory` | W10 | working-set growth; dependent access vs streaming | latency/bandwidth CSV + plots |
| `scaling` | W12 | worker count | runtime/speedup CSV + plot |
| `communication` | W12 | per-message controlled waiting; chatty vs bulk shape | runtime CSV + plot |
| `vector` | W13 | same loop, vectorization disabled vs native compiler optimization | runtime, compiler vectorization report + plot |

These are **substrates**, not finished weekly assignments. Prompt 004 owns student-facing questions, workload sizing, instructions, and rubrics.

## Receipt rules

- JSON receipts use schema names under `swosu.archlab.*`.
- Repeated/tabular measurements use CSV.
- Every receipt records scope/limitations where the measurement could be overinterpreted.
- Generated evidence belongs under ignored `lab/runs/`; durable validation receipts may be committed under `lab/validation/`.

## Required access rule

The required reasoning path is CPU-only, no-root, no-paid-tool, and no-private-infrastructure. GPU, MPI, QEMU, privileged counters, `netem`, and professor-owned machines are optional enrichment only unless a later validated course decision explicitly changes that.
