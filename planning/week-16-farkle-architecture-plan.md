# Week 16 Farkle + ML Architecture build plan

**Status:** READY TO EXECUTE ON `farkle/shared-core-architecture-brandy`

## Goal

Build the smallest trustworthy Computer Architecture consumer of the canonical Farkle + ML shared package.

The richer experiment doctrine lives upstream in:

- `jeremy-evert/Farkle_and_Machine_Learning/planning/architecture-cost-effectiveness-lens.md`
- `jeremy-evert/Farkle_and_Machine_Learning/planning/hardware-lane-and-receipt-map.md`

Computer Architecture should implement a humane required slice, not reproduce the whole research/showcase surface.

## Required student question

> **What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

## Phase 1 — synchronize canonical computational truth

Use the shared repository's sync script to generate:

`weeks/week-16/code/farkle_ml/`

Rules:

- generated files are not hand-edited;
- `_SHARED_PROVENANCE.json` must travel with the package;
- `--check` must pass before course-specific code is built around it;
- no Architecture-local scoring/learner/strategy/simulation fork.

## Phase 2 — build the Architecture receipt layer

Create:

`weeks/week-16/code/architecture_farkle/`

The Architecture package should be thin.

Required responsibilities:

1. construct/run canonical shared experiment configurations;
2. preserve the complete canonical result data;
3. add safe observable execution context;
4. save JSON/CSV receipts;
5. provide a tiny CLI.

Required execution-context fields:

- host label;
- platform/system string;
- Python version;
- logical CPU count;
- explicit execution/lane label;
- implementation ID;
- worker count, initially `1` unless real parallelism is implemented.

Do not claim GPU use merely because a GPU exists in the host.

## Phase 3 — bounded fixed CPU suite

The required validator suite should be intentionally smaller than CS2's experiment menu:

- `bank_at_300` vs `bank_at_425`;
- `learner:2000` vs `bank_at_425`;
- `rollout:25` vs `bank_at_425`.

This is enough to show three different cost shapes:

- cheap human heuristic;
- preparation-heavy trained learner;
- operation-heavy rollout strategy.

The validator should preserve:

- effectiveness;
- preparation seconds;
- training turns/model size;
- evaluation seconds;
- games/second;
- raw canonical denominators;
- execution context.

No one magic efficiency score.

## Phase 4 — correctness and validation

Create standard-library tests that prove:

- generated shared hashes match provenance;
- Architecture imports canonical `farkle_ml` rather than copied machine logic;
- result envelope contains the canonical result fields plus Architecture context;
- fixed seeded experiments reproduce their effectiveness results;
- JSON/CSV persistence is machine-readable;
- required CPU path installs nothing and needs no GPU/cloud/container.

Create one command:

`python scripts/validate_week16_farkle_architecture.py`

It should write:

`sidecar/runs/005_week16_farkle_architecture_validation_<timestamp>.md`

and bounded scratch under ignored `artifacts/`.

## Phase 5 — build the Week 16 course package

Create the normal course week surface:

- `weeks/week-16/README.md`
- `weeks/week-16/monday.md`
- `weeks/week-16/wednesday.md`
- `weeks/week-16/friday.md`
- `weeks/week-16/_instructor.md`
- `weeks/week-16/_validation.md`

Required student flow:

### Monday — predict

Pick two fixed strategy/effort configurations. Predict:

- effectiveness;
- preparation cost;
- operating cost;
- which architecture characteristic might matter.

No new Architecture theory lecture.

### Wednesday — measure

Run one bounded CPU comparison/suite on an accessible machine. Read the saved receipt, not just terminal output.

Separate:

- effectiveness;
- preparation;
- operation;
- execution context.

### Friday — judge

Complete one short statement:

> **For this workload, under this constraint, measured this way, I would choose ___ because the additional effectiveness is/is not worth the additional computational cost.**

Then identify one prior Architecture idea that plausibly explains the result.

No profiling investigation is required to prove the explanation.

## Phase 6 — real Brandy validation

Brandy is the first release-validation host because it is available and provides a stable CPU path.

The first required run is **not a Tesla T4 benchmark** unless a future implementation actually dispatches work to the T4.

The Brandy receipt should simply identify Brandy as the host and `python-reference-v1` / CPU-native as the implementation/execution mode.

If the validator is GREEN, retain the raw receipt.

## Phase 7 — optional showcase after GREEN

Only after the required consumer is validated may the instructor rerun the same receipt contract on other machines.

Candidates already captured upstream include:

- Maise / RTX 2080 SUPER host;
- GTX 1080-class lane after exact host identity is verified;
- April / RTX 5080 host;
- NRP professional Blackwell lane;
- ordinary CPU-only hosts.

Initially these may still be CPU-host comparisons. An accelerator only counts when an accelerator-capable equivalent implementation exists and verifies actual accelerator use.

Potential later experiments:

- cross-host CPU throughput;
- worker-count scaling;
- native vs verified container;
- compiled/vectorized equivalent implementation;
- real GPU batching;
- measured power/energy;
- static Top 500 / Green 500 / Bottom Dollar / Training Miser showcase.

None of these block Week 16.

## Phase 8 — closure

Update the historical report path:

`sidecar/reports/005_build_farkle_ml_architecture_capstone.md`

The report must explicitly state that the former heavy capstone framing remained retired.

Document:

- canonical assets reused;
- Architecture wrapper built;
- CPU validation receipt;
- student friction/runtime;
- exact required learning path;
- optional hardware lanes parked as enrichment;
- confirmation of no Checkpoint 4 / Machine Dossier expansion / required GPU / Kubernetes platform.

## Done when

The Architecture consumer is GREEN when an ordinary CPU can run the canonical shared machine through a thin Architecture receipt layer, preserve honest cost/effectiveness evidence with explicit execution context, and support one bounded architectural judgment.

The project is **not** waiting for the hardware showcase to become elaborate.
