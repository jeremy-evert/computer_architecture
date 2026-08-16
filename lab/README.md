# SWOSU Computer Architecture Laboratory

This directory is the common laboratory substrate for COMSC-3013. It is intentionally smaller than the course.

## Two worlds

**Observatory:** `archlab probe snapshot` inspects the machine/environment the command is actually running in and labels scope such as host-visible, WSL-visible, or container-visible. It never pretends a container is the physical host.

**Experimental Chamber:** the common CLI, native C specimens, bounded RISC-V interpreter, plotting helpers, and PDF build provide a repeatable environment for controlled experiments.

## Student command grammar

```bash
python3 -m archlab doctor
python3 -m archlab probe snapshot
python3 -m archlab run riscv
python3 -m archlab run memory
python3 -m archlab run scaling
python3 -m archlab run communication
python3 -m archlab plot memory runs/.../memory.csv --out memory.png
python3 -m archlab dossier build --work-dir dossier --figure memory.png
python3 -m archlab smoke
```

The repository ships `bin/archlab`, `bin/archprobe`, and `bin/archplot` wrappers. No Python package installation or network access is required to use them.

## Evidence contract

Experiments write JSON receipts plus CSV data where a table of repeated measurements exists. The common reasoning grammar is:

**predict -> perturb -> run -> measure -> visualize -> explain -> revise**

A receipt records what happened. It does not automatically prove why it happened.

## Required path

The supported required path is CPU-only and does not require root/admin, a GPU, MPI, a cluster, paid AI, or Jeremy-owned infrastructure.

Current primary target is Linux/WSL2. Container execution is an Experimental Chamber option, but the Observatory should run outside the container when the claim is about the student's actual machine.

## RISC-V choice

The base laboratory uses Clang/LLVM to assemble a bounded RV32I specimen and a small course-owned interpreter to execute that specimen. The interpreter is intentionally **not cycle accurate**. It exposes architectural state and instruction semantics for Weeks 6-9 without making QEMU/Spike/RARS installation a student prerequisite. QEMU or other richer tools remain possible instructor/enrichment paths.

## PDF choice

The required path accepts Tectonic when installed, but falls back to `latexmk + pdflatex`. The first execution pass validates `latexmk + pdflatex`; Tectonic remains an attractive optional engine rather than an untested requirement.
