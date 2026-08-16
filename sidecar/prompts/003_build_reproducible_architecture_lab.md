# Sidecar Prompt 003 - Build the reproducible Computer Architecture laboratory

**Status:** OPEN  
**Owner:** Foreman  
**Mode:** inspect -> prototype -> smoke-test -> document -> recommend

## Mission

Build and validate the semester's reproducible **Architecture laboratory**, including the smallest coherent tooling needed for:

- Weeks 3-4 investigation/repeatability/observation;
- Weeks 5-14 sensory labs;
- the Machine Dossier;
- Python/matplotlib visualization;
- a scaffolded LaTeX/PDF publishing path;
- machine snapshots and repeatable measurement receipts.

This prompt turns the accepted laboratory doctrine into runnable infrastructure.

## Read first

- `AGENTS.md`
- `README.md`
- `planning/fall-2026-course-design.md`
- `planning/block-map.md`
- `planning/machine-dossier.md`
- `sidecar/PLANNING.md`
- `docs/grading-model.md`
- current Week 2-14 planning
- `sidecar/reports/002_build_open_source_architecture_canon.md` when available

Inspect sibling/shared infrastructure before inventing a new pattern.

## Core constraints

1. **CPU-only completion path is mandatory.**
2. GPU support is optional enrichment.
3. No paid AI/CLI requirement.
4. No student dependency on Jeremy's private network or machines.
5. Required experiments should not require administrator/root privileges.
6. Prefer open-source/free tools.
7. Containerized/reproducible path should be portable enough for WSL2/Linux and as feasible macOS/Docker/Podman.
8. Tools exist to expose Architecture, not to create a giant DevOps course.

## Capability targets

### Baseline systems/toolchain

Select the smallest coherent set supporting:

- C compiler;
- make/just or similarly simple runner;
- binutils (`objdump`, `readelf`, `nm`, etc.);
- GDB or equivalent;
- `file`, `xxd`/`od`, `/proc`/system inspection;
- timing/profiling;
- Git;
- RISC-V cross-compiler/assembler plus one practical simulator/emulator path.

Do not install five redundant simulators.

### Machine probe

Build a small course-owned machine probe with structured output.

Target facts:

- OS/kernel/container;
- CPU architecture/ISA;
- cores/threads;
- cache hierarchy where exposed;
- RAM;
- storage;
- GPU/accelerator presence where safely detectable;
- relevant tool versions.

Prefer a command shape such as:

```bash
archprobe snapshot
```

with JSON plus a human-readable summary. Exact naming may change if a better interface emerges.

### Sensory experiment harness

Provide a shared runner/data convention for controlled experiments.

Target Week 5-14 needs include:

- timing repeated work;
- varying working-set size;
- pointer-chase/dependent-access style test;
- streaming/bulk-access style test;
- basic storage access comparison where portable;
- pipeline/performance traces through simulator/tooling;
- multicore/shared-memory scaling;
- a safe communication-latency/synchronization experiment;
- CPU versus vectorized/specialized workload shape where possible.

Do not promise privileged counters that are unreliable across student systems.

### Network/communication latency path

Week 12 needs a way to make communication cost **felt**.

Required path should work without root.

Evaluate options such as:

- user-space delay/rate-limiting proxy/harness;
- container-local message simulator;
- small socket/MPI-like course harness.

Optional Linux `netem` may be enrichment where privileges exist, never the required path.

If Open MPI adds manageable value/size, prototype a small MPI path. If it creates disproportionate friction, preserve the principle through a simpler controlled communication harness.

### Python/matplotlib visualization

Include a small Python environment and course helpers that can turn CSV/JSON measurements into useful plots.

The student should not have to become a matplotlib expert.

Target interface examples:

```bash
archplot memory data/week10-memory.csv
archplot scaling data/week12-scaling.csv
```

Exact naming is open to implementation evidence.

### LaTeX/PDF dossier build

Evaluate the smallest reliable open publishing path for a technical dossier containing equations, tables, figures, and cross-references.

Candidates may include:

- constrained TeX Live + `latexmk`;
- Tectonic or another maintainable open path.

Target student experience:

```bash
make dossier
```

The build should consume generated plots/data without requiring a LaTeX side course.

## Standard experiment receipt

Build conventions around:

**predict -> perturb -> run -> measure -> visualize -> explain -> revise**

Prefer machine-readable data outputs so students and plots use the same source.

## Required smoke tests

At minimum prove a fresh supported environment can:

1. report architecture/tool versions;
2. run `archprobe` or equivalent;
3. compile and run a tiny native program;
4. inspect/disassemble it;
5. debug/inspect state;
6. compile/run/inspect a small RISC-V example through the chosen path;
7. execute a timing experiment that emits CSV/JSON;
8. generate a matplotlib figure from the receipt;
9. build a minimal dossier PDF containing that figure;
10. run one bounded multicore/communication experiment;
11. emit a machine-readable PASS/FAIL health receipt.

Keep each smoke test small.

## Cross-platform validation

Prioritize:

- Windows + WSL2;
- native Linux;
- Docker/Podman path;
- macOS where feasible.

If a platform is untested, say so.

## Student-facing implications

Return enough validated information for authors to build:

- Week 3 repeatability lesson;
- Week 4 Linux observation lesson;
- Week 5 machine snapshot/dossier start;
- Week 8 performance plots;
- Week 10 memory sensory lab;
- Week 12 scaling/communication sensory lab;
- Week 14 final dossier build.

## Explicit non-goals

- no production Canvas writes;
- no mandatory GPU stack;
- no giant cloud dependency;
- no privileged/root requirement;
- no paid AI tooling;
- no assumption of Jeremy's private network;
- no attempt to fully author all labs in this infrastructure prompt.

## Required report

Write:

`sidecar/reports/003_build_reproducible_architecture_lab.md`

Include:

- alternatives considered;
- selected runtime/tool stack and why;
- image/container size;
- machine-probe interface/results;
- plotting environment and example;
- LaTeX/PDF path and example;
- sensory harness design;
- network/communication-latency approach;
- smoke-test commands/results;
- platforms tested;
- known failure modes;
- student fallback strategy;
- worker commit SHA(s).

## Foreman acceptance

Foreman independently verifies that the lab:

1. builds/starts reproducibly;
2. supports CPU-only completion;
3. exposes real architecture evidence;
4. produces structured measurement data;
5. can plot and compile a dossier PDF;
6. supports at least one controlled latency/scaling experiment;
7. embeds no secrets/private assumptions;
8. gives later Week 5-14 authors one common laboratory contract.

## Done when

A fresh supported environment can inspect a machine, run/measure a controlled experiment, visualize the result, and compile a minimal Machine Dossier receipt through one documented open/free path.
