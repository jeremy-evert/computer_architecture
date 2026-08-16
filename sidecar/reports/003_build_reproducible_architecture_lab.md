# Sidecar Report 003 - Build the reproducible Computer Architecture laboratory

**Status:** COMPLETE WITH NAMED PLATFORM YELLOWS  
**Date:** 2026-08-16  
**Executed by:** ChatGPT under Jeremy's course-design authority  
**Laboratory implementation commit:** `a8c336e4acaf4296d23bd6571cf040bcf9832734`

## Result

Prompt 003 produced a real common laboratory substrate under `lab/` and proved the core path end to end on the available Linux execution surface.

The durable result is deliberately smaller than the course. Prompt 004 can now author Weeks 5-14 against one stable laboratory contract instead of inventing a new toolchain, receipt format, plotter, and report path every week.

The stable student/author interface is:

```text
archlab doctor
archprobe [--out-dir DIR]
archlab run riscv|dependency|memory|scaling|communication|vector
archplot dependency|memory|scaling|communication|vector DATA.csv --out FIGURE.png
archlab dossier build --work-dir DIR [--figure FIGURE.png ...]
archlab smoke
```

No Python package installation is required. The wrappers in `lab/bin/` add the repository-local package to `PYTHONPATH` and run it directly.

## Central architecture: two worlds, one laboratory

Prompt 003 confirmed the need for the split designed in the work order.

### Observatory

`archprobe` inspects the environment where it is actually running and labels evidence scope as host-visible, WSL-visible, container-visible, or otherwise limited.

It may capture, where exposed:

- OS/kernel/distribution;
- ISA/architecture and CPU model/vendor;
- logical/core/socket topology where exposed;
- cache records from Linux sysfs;
- visible memory;
- visible filesystem capacity;
- visible NVIDIA accelerator presence;
- probe version and timestamp.

It intentionally omits usernames, home paths, serial numbers, MAC addresses, public IPs, and device identifiers.

The probe is allowed to say unknown/not exposed. It does not silently promote container-visible facts to physical-host truth.

### Experimental Chamber

The common chamber owns:

- native C specimens;
- compiler/binary/debugging checks;
- bounded RISC-V compilation and architectural-state execution;
- common experiment runners;
- JSON/CSV receipts;
- matplotlib plots;
- scaffolded LaTeX/PDF dossier generation;
- health/smoke tests;
- fallback evidence datasets.

A `Containerfile` is included as a reproducible-environment candidate, but the current execution harness had no Docker/Podman runtime. The container image itself therefore remains YELLOW until it is actually built and measured.

## Important implementation decisions

### 1. No mandatory `pip install`

The first editable-package installation attempt failed because the execution environment could not reach package indexes/build dependencies.

Rather than treating network access as a hidden requirement, the lab was simplified. Repository-local Bash wrappers now execute the Python package directly.

This is a better student contract:

- fewer moving parts;
- no package-index dependency for normal lab execution;
- no virtual-environment ceremony merely to invoke the course runner;
- easier offline/restricted-network use.

### 2. RISC-V: LLVM cross-compile + bounded course interpreter

The required path uses Clang/LLVM to target `riscv32-unknown-elf` / RV32I and a small course-owned architectural-state interpreter.

The interpreter is intentionally **not cycle accurate**. It exists to expose architectural instruction/state behavior for the bounded subset needed by Weeks 6-9 without making a large simulator installation a prerequisite.

Two cases passed:

1. a hand-written RV32I assembly specimen;
2. a C `transform()` specimen compiled at `-O0` and entered through a tiny `_start` assembly shim.

The source-to-CPU specimen compiled, disassembled, executed through the bounded interpreter, exercised call/return plus stack loads/stores/branching, and produced the expected result `18` in the return/result registers.

Pipeline timing and real microarchitecture behavior remain separate teaching models/experiments; the interpreter does not pretend to provide them.

### 3. Structured evidence before pictures

Experiments write JSON receipts and CSV when repeated/tabular measurements are natural. Plots consume those receipts.

This keeps evidence:

- inspectable;
- reusable;
- unit-aware;
- suitable for the Machine Dossier;
- separate from screenshots.

### 4. Matplotlib is scaffolded

`archplot` owns the standard plots. Students can inspect or extend the Python later, but the required Architecture reasoning does not depend on memorizing plotting syntax.

### 5. LaTeX is scaffolded

`archlab dossier build` turns generated evidence figures into a technical PDF scaffold with Claim, Evidence, Explanation, and Revision sections.

The executed pass validated `latexmk + pdflatex` end to end. Tectonic remains an optional candidate but is not declared required because it was not installed in the execution harness.

### 6. OpenMP, not MPI, owns the required first-line multicore path

The shared-memory scaling specimen compiles/runs through OpenMP.

MPI was not installed and is not required for the base course. The Week 12 communication-learning goal is preserved through a course-owned user-space socket experiment with controlled per-message waiting.

This avoids making MPI setup/syntax the lesson merely to demonstrate communication sensitivity.

### 7. Communication delay is user-space and no-root

The communication experiment keeps total payload bounded and compares:

- **chatterbox:** many small request/reply exchanges;
- **freight train:** one bulk exchange.

The same controlled reply delay is inserted in user space. The receipt explicitly says this is a model of per-message waiting cost, **not** a measurement of Internet/network hardware latency.

No `netem`, root, private network, or cluster is required.

### 8. Fallback evidence is first-class

Committed fallback datasets preserve the same prediction -> visualize -> explain -> revise reasoning task when a student's machine cannot expose a clean effect after reasonable troubleshooting.

Fallback evidence has the same grading ceiling. The student must identify it as course-provided rather than locally measured.

## Sensory experiments proved

### Week 8 substrate: dependency vs independent work

A native C specimen compares one serial dependency chain with four independent chains using the same total update count.

Its receipt carefully scopes the claim: this is evidence about dependency and available overlap in the generated loop. It is not a direct measurement of physical pipeline depth.

### Week 10 substrate: memory sensitivity

The memory experiment compares:

- randomized dependent pointer chasing;
- streaming reads;
- working sets from KiB scale into tens of MiB.

On the executed validation surface, pointer-chase latency showed a strong working-set shape, rising from low-single-digit ns/access at small working sets to roughly 126 ns/access at 32 MiB in the final smoke run.

The exact values are **not benchmark doctrine**. The preserved lesson is the changing shape and the difference between dependent-access latency and streaming throughput.

### Week 12 substrate: shared-memory scaling

The OpenMP specimen varies worker count while holding a deterministic workload fixed.

The final smoke pass observed speedups of approximately:

- 1 thread: `1.00x`
- 2 threads: `1.89x`
- 4 threads: `3.40x`

These values are receipt evidence from the validation surface, not performance expectations for student computers.

### Week 12 substrate: communication sensitivity

At the largest controlled per-reply delay in the final smoke receipt (20 ms):

- chatterbox: approximately `1.304 s`
- freight train: approximately `0.020 s`

This is exactly the intended experience: the same total payload can respond radically differently to per-message waiting depending on communication shape.

### Week 13 substrate: specialization must be measured

The vector specimen compiles the same vectorizable loop in two organizations:

- vectorization disabled;
- native optimization/vectorization enabled.

The compiler reported vectorization in the final validation run, yet the native/vectorized executable was **slower** in that run.

That result is deliberately preserved rather than treated as a failed demo. It is powerful evidence for the course rule:

> specialization and optimization are hypotheses about workload fit, not magic words that guarantee speedup.

Prompt 004 should require compiler/disassembly evidence and repeated measurement before students attribute a timing change to SIMD/vectorization.

## End-to-end validation

`make validate` passed on 2026-08-16.

The final smoke path proved:

| Capability | Result |
|---|---|
| Python syntax/CLI | PASS |
| doctor/health receipt | PASS |
| Observatory machine snapshot | PASS |
| native C compile/run | PASS |
| binary inspection prerequisites | PASS |
| debugger availability through GDB or LLDB | PASS |
| RV32I assembly compile/disassemble/execute | PASS |
| C -> RV32I source-to-CPU specimen | PASS |
| dependency experiment + plot | PASS |
| memory experiment + plots | PASS |
| OpenMP scaling experiment + plot | PASS |
| user-space communication experiment + plot | PASS |
| CPU specialization/vector experiment + plot | PASS |
| Machine Dossier LaTeX/PDF build | PASS |
| machine-readable smoke receipt | PASS |

The committed machine-readable receipt is:

`lab/validation/2026-08-16-native-linux-smoke.json`

The PDF built during the final smoke pass was approximately 318 KB and contained generated evidence figures.

## Platform truth

| Surface | Status | Evidence |
|---|---|---|
| Linux execution substrate | **GREEN for substrate** | `make validate` + full smoke PASS |
| container-visible scope detection | **GREEN** | Observatory correctly labeled executed environment `container-visible` |
| CPU-only path | **GREEN** | all required experiments validated without GPU |
| no-root experiment path | **GREEN on executed surface** | experiments require no privileged operations |
| WSL2 | **YELLOW** | planned Windows path, not executed in this pass |
| Docker Containerfile | **YELLOW** | authored, but no Docker runtime existed in validation harness |
| Podman | **YELLOW** | runtime absent/unexecuted |
| macOS | **YELLOW** | unexecuted |
| native Windows outside WSL | **NOT A PRIMARY EXPERIMENTAL-CHAMBER TARGET** | Windows students should use the validated future WSL2 path; host observation may later gain a native Windows probe if useful |
| MPI | **OPTIONAL / NOT REQUIRED** | not installed; required communication lesson is covered by user-space harness |
| GPU | **OPTIONAL / NOT REQUIRED** | CPU-only substrate passed |
| Tectonic | **OPTIONAL / UNVALIDATED HERE** | latexmk+pdflatex is the validated engine |

Do not upgrade a YELLOW to GREEN from documentation alone. Run the course substrate on the target surface.

## Doctor contract

`archlab doctor` checks required capabilities rather than merely listing binaries:

- Python 3.10+;
- native C compiler;
- binary inspection tools;
- GDB or LLDB state-inspection path;
- matplotlib import;
- RISC-V cross-compile prerequisites;
- PDF engine;
- actual OpenMP compile/run probe.

It separately records optional availability such as container runtime, MPI, QEMU, and Tectonic.

When a required capability is absent, the message directs the user toward the supported Experimental Chamber/fallback path rather than telling them to improvise administrator/root changes.

## Security and privacy

The required path:

- contains no credentials or secrets;
- requires no Jeremy-owned infrastructure;
- performs no network write;
- performs no LMS write;
- performs no privileged network manipulation;
- does not collect personal host identifiers unnecessary to Architecture reasoning.

No Savnac or production Canvas object was touched by Prompt 003.

## Stable handoff to Prompt 004

Prompt 004 may now treat these as the common laboratory contract:

```text
archlab doctor
archprobe
archlab run riscv
archlab run dependency
archlab run memory
archlab run scaling
archlab run communication
archlab run vector
archplot ...
archlab dossier build ...
```

Week authors must **not** casually replace these with per-week notebooks/runners.

Prompt 004 still owns:

- actual Monday lecture/deck content;
- student-facing lab narrative;
- prediction prompts;
- experiment workload sizing for normal students;
- exact evidence/Explain-Defend requirements;
- rubrics/check criteria;
- Machine Dossier handoff text;
- Stack Showcase plans;
- accessibility/fallback wording;
- week-level execution validation.

## Remaining YELLOW work before student release

These are not blockers to Week 5-14 authoring, but they are real deployment requirements:

1. execute `make validate` and `archlab smoke` in the intended WSL2 student path;
2. build the `Containerfile`, record final image size, and smoke-test it under at least one intended runtime;
3. decide whether Podman deserves explicit support or remains best-effort;
4. run a macOS probe/chamber test if macOS is to be advertised as supported;
5. tune default workloads after observing normal student-class hardware;
6. test host Observatory behavior on a real WSL2 Windows machine rather than inferring it from Linux code;
7. keep MPI/GPU/QEMU enrichment separate unless a later week demonstrates that the extra friction buys real learning.

## Prompt 003 disposition

**Prompt 003 is complete at the laboratory-substrate level.**

Gate 2 is a **PASS for the executed Linux substrate with explicit cross-platform deployment YELLOWs**.

This is sufficient to unblock Prompt 004 authoring because the stable interfaces and required CPU-only sensory capabilities now exist and have been executed.

It is **not** sufficient to advertise every platform as classroom-ready. Those platform claims remain evidence-gated.
