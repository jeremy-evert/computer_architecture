# Week 16 reference map - Farkle cost versus effectiveness

## 1. Course-owned teaching surface

Start here:

- `README.md` - Week at a Glance and scope;
- `monday.md` - the cost/effectiveness model and prediction;
- `wednesday.md` - required CPU experiment path;
- `friday.md` - bounded Architecture judgment;
- `code/architecture_farkle/` - course-owned host/timing receipt layer.

## 2. Canonical computational truth

The generated package under:

`code/farkle_ml/`

comes from:

`jeremy-evert/Farkle_and_Machine_Learning`

The local file:

`code/farkle_ml/_SHARED_PROVENANCE.json`

records the shared repository, source path, source commit, synchronization-time repository head, and SHA-256 hashes for the generated package.

The canonical shared design documents that motivate the Architecture lens are:

- `planning/architecture-cost-effectiveness-lens.md` in the shared repository;
- `planning/hardware-lane-and-receipt-map.md` in the shared repository.

Those documents define the cross-course experiment doctrine. This course owns the student interpretation, not a second copy of that doctrine.

## 3. Primary truth inside the benchmark

For technical verification, inspect the generated shared modules directly:

- `code/farkle_ml/engine.py` - classroom rules and turn engine;
- `code/farkle_ml/experiment.py` - preparation/runtime/effectiveness receipt schema;
- `code/farkle_ml/simulate.py` - fair repeated-game simulation and raw denominators;
- `code/farkle_ml/strategies.py` - fixed strategy families.

Computer Architecture's execution evidence lives in:

- `code/architecture_farkle/host.py` - host facts and explicit CPU execution claim;
- `code/architecture_farkle/runner.py` - repeated timing receipts;
- `code/architecture_farkle/cli.py` - student/instructor command path.

## 4. Optional reinforcement

Earlier course weeks remain the best source for the Architecture concepts students may use to explain their evidence:

- latency / throughput;
- memory and locality;
- parallelism and scaling;
- communication/data movement;
- vectorization/specialization;
- workload-driven design judgment.

Week 16 does not reopen those units or require new external reading.

## Reuse note

No external textbook passage is copied into the Week 16 teaching surface. The Farkle computational package is generated from the course-family canonical repository with recorded provenance. Course-specific prose and judgment prompts remain owned here.
