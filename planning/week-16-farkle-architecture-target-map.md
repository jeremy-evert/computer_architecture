# Week 16 Farkle + ML Architecture target map

**Status:** BUILD TARGET

## Central question

> **What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

## Ownership map

```text
Farkle_and_Machine_Learning
  owns rules / learner / strategies / simulation / common experiment evidence
                    |
                    v
computer_architecture
  owns execution-context measurement + architecture interpretation
                    |
                    v
student prediction -> bounded run -> evidence -> architecture judgment
```

## Required computational path

Use a generated provenance-pinned snapshot at:

`weeks/week-16/code/farkle_ml/`

Architecture-owned code lives beside it at:

`weeks/week-16/code/architecture_farkle/`

The Architecture layer must not duplicate shared engine, learner, simulation, or strategy implementations.

## Fixed software menu

Keep the software menu small enough that hardware/execution evidence remains interpretable. Required validator/demo suite:

- `bank_at_300` versus `bank_at_425`;
- `learner:2000` versus `bank_at_425`;
- `rollout:25` versus `bank_at_425`.

Optional instructor enrichment may include higher-effort configurations already supported by the shared package, but they are not required for student completion.

## Architecture evidence contract

Each result row should preserve shared effectiveness/cost fields and add execution context that is actually observable without privileged tooling:

- host name;
- platform/system string;
- Python version;
- logical CPU count;
- optional user-supplied lane label;
- strategy specification;
- game count and seed;
- preparation seconds;
- evaluation seconds;
- games/second;
- model size / training turns where relevant;
- win/tie/effectiveness evidence from the canonical experiment result.

Do not pretend to measure watts, dollars, cache misses, CPU frequency, GPU utilization, or hardware value unless an optional instructor lane explicitly supplies trustworthy measurements.

## Required student experience

### Predict
Choose two fixed configurations and predict:

- which will play better;
- which will cost more to prepare;
- which will cost more while running;
- what machine/execution characteristic you expect to matter.

### Measure
Run one bounded CPU command on an accessible machine and save a machine-readable receipt.

### Compare
Use the evidence to distinguish at least:

- effectiveness;
- preparation cost;
- operating cost;
- execution context.

### Judge
Complete one sentence:

> For this workload, under this constraint, measured this way, I would choose ___ because the additional effectiveness is/is not worth the additional computational cost.

Name one Architecture idea that plausibly explains the observation, but do not require a new profiling investigation.

## Required course artifacts

- `weeks/week-16/README.md`
- `weeks/week-16/monday.md`
- `weeks/week-16/wednesday.md`
- `weeks/week-16/friday.md`
- `weeks/week-16/_instructor.md`
- `weeks/week-16/_validation.md`
- generated `weeks/week-16/code/farkle_ml/`
- Architecture wrapper package under `weeks/week-16/code/architecture_farkle/`
- standard-library tests under `tests/`
- one-command validator under `scripts/`
- timestamped validation receipt under `sidecar/runs/`
- final Prompt 005 report under its historical report path.

## Optional enrichment

Only after the CPU path is GREEN:

- compare the exact same configuration on another instructor-controlled host;
- container versus bare-metal comparison if the separate container-foundations lane is already verified;
- Raspberry Pi / desktop / large-host comparison;
- optional instructor-provided energy/resource evidence;
- static showcase table generated from real receipts.

None of these block release.

## Explicit non-goals

- no course-local Farkle fork;
- no required GPU;
- no required container;
- no Kubernetes service;
- no persistent leaderboard;
- no Architecture Checkpoint 4;
- no Machine Dossier expansion;
- no grading based on student hardware wealth;
- no fake energy/cost numbers.
