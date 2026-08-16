# Sidecar Report 004_l - Cross-week continuity and editorial audit

**Status:** IMPLEMENTED / PASS WITH NAMED RELEASE YELLOWS  
**Date:** 2026-08-16  
**Audited:** `weeks/week-05/` through `weeks/week-14/`

## Verdict

The technical core now reads as one accumulating investigation:

> **build -> open -> trace -> stress -> explain -> redesign**

The durable continuity map is `planning/technical-core-continuity.md`.

## Persistent threads verified

### Machine

Week 5's workload, $1,500 constraint, designed machine, original market snapshot, observable-machine scope, and `Claim waiting to be attacked` survive explicitly to Week 14.

### Specimen, Weeks 6-9

The course-owned `transform()` specimen survives representation/ISA -> datapath/control -> dependency/performance -> Checkpoint 2 integration. No gratuitous toy-program reset was introduced.

### Memory, Weeks 10-11

Week 11 begins from Week 10's memory access and moves from physical hierarchy behavior into virtual translation/protection/process abstraction. It does not reset into an OS survey.

### Workload shape, Weeks 12-13

Week 12 establishes `chunky/local` versus `chatty/dependent` work and the cost of cooperation. Week 13 asks whether changing execution organization earns its cost for that workload shape.

### Metrics

Naive Week 5 cost/capacity/headline proxies become conditional as latency/throughput, locality/bandwidth, scaling/communication, and specialization/data movement evidence arrives. Week 14 selects metrics rather than accumulating them indiscriminately.

## Monday -> Wednesday -> Friday audit

All technical weeks now satisfy the intended argument:

- Monday states a model/prediction that makes Wednesday interpretable;
- Wednesday produces or inspects evidence;
- Friday requires that evidence for the judgment task;
- Week 9 intentionally has no normal Friday burden because of Fall Break.

No Friday receipt can be satisfied solely by naming components or pasting raw terminal output.

## Dossier audit

Dossier handoffs are explicit ADD/REVISE actions rather than blank weekly worksheets. Major persistent evidence is:

- Week 5 baseline and original claim;
- Week 6 representation/ISA trace;
- Week 8 dependency plot;
- Week 9 synthesis checkpoint;
- Week 10 memory plot;
- Week 11 translation/protection refinement;
- Week 12 scaling/communication plots;
- Week 13 specialization evidence;
- Week 14 final architecture defense and freeze.

## Seam repairs made during the audit

The audit found a genuine equity seam: several authored weeks promised equal-ceiling fallback evidence, but only memory/scaling/communication and Week 5 machine evidence existed as concrete files.

Added:

- `lab/fallback_data/dependency-reference.csv` for Week 8;
- `lab/fallback_data/vector-reference.csv` + `vectorization-reference.txt` for Week 13;
- `lab/fallback_data/week11-process-map-reference.txt` for Week 11;
- `lab/fallback_data/week06-riscv-source-to-cpu-reference.txt` for Weeks 6/9.

The RISC-V fallback disassembly was reproduced from the committed course source with the same RV32I/ilp32/O0 toolchain shape and is paired with the already validated final architectural state. The Week 11 map is clearly labeled curated rather than fabricated as a live machine receipt. The Week 13 fallback preserves the inconvenient vectorization/slower-runtime evidence without inventing a compiler remark line that was not durably retained.

`lab/fallback_data/README.md` now names the full fallback contract.

## Source/evidence-scope audit

The campaign keeps primary truth and course teaching separate. Current RISC-V, Linux, OpenMP and LLVM primary sources were reverified during authoring. Important scope brakes are repeated where the student needs them rather than buried in a single policy file.

## Calendar/load audit

- Week 6 Checkpoint 1 is a compact four-layer trace.
- Week 9 Checkpoint 2 integrates existing evidence and has no normal Friday burden.
- Week 14 Checkpoint 3 is the final Dossier defense, not a new project.
- No Checkpoint 4 or post-Week-14 technical dependency exists.

## Remaining YELLOWs

These are **release/platform** YELLOWs, not unresolved cross-week curriculum seams:

- WSL2 real-machine execution;
- macOS real-machine execution if advertised;
- Containerfile/runtime build validation;
- final instructor Stack Showcase recordings/inventories;
- representative final authored Dossier build from a complete student-like evidence set;
- final live-link/current-market recheck near release.

## Disposition

**004_l passes.** The content audit found and repaired real fallback seams. `004_m` is now the remaining hardware/execution truth pass; it is expected to end with physical-machine YELLOWs until real Windows/Mac runs occur.