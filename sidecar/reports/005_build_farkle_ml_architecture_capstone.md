# Report 005 - Build Farkle + ML Architecture Week 16

**Date:** 2026-08-16  
**Status:** REQUIRED WEEK 16 PATH GREEN; OPTIONAL HARDWARE LANES REMAIN FUTURE ENRICHMENT  
**Historical report name:** retained for Prompt 005 compatibility; the former heavy Architecture-capstone framing is retired.

## Outcome

Computer Architecture Week 16 is now a tested consumer of the canonical shared Farkle + Machine Learning machine.

The course does not own a second Farkle engine, learner, simulator, or rollout implementation. The ownership boundary is:

```text
jeremy-evert/Farkle_and_Machine_Learning
        canonical computational machine
                    |
                    v
weeks/week-16/code/farkle_ml/
   generated provenance-pinned snapshot
                    |
                    v
weeks/week-16/code/architecture_farkle/
 host facts + repeated timing + Architecture receipt
                    |
                    v
       Predict -> Measure -> Judge
```

The course-specific question is:

> **What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

The technical Computer Architecture sequence still ends in Week 14. Week 16 is application, evidence, and judgment rather than Checkpoint 4 or a hidden continuation of the Machine Dossier.

## Shared assets reused

Canonical shared source is generated into:

`weeks/week-16/code/farkle_ml/`

The generated `_SHARED_PROVENANCE.json` pins repository:

`jeremy-evert/Farkle_and_Machine_Learning`

and shared source commit:

`d3a1ed379a652731b0b6237c33b4fe42c518ac9e`

The shared layer owns:

- Farkle rules and scoring;
- deterministic fair simulation;
- human threshold strategies;
- transparent learned-table strategy;
- bounded one-step rollout strategy;
- preparation/runtime/effectiveness evidence;
- raw win/tie/start/turn/Farkle counts;
- JSON/CSV experiment semantics.

No Architecture-local fork was created.

## Shared Architecture doctrine preserved first

Before the course consumer build, the larger experiment vision was captured in the canonical shared repository rather than being allowed to live only in course prose or chat history:

- `planning/architecture-cost-effectiveness-lens.md`
- `planning/hardware-lane-and-receipt-map.md`

Those documents preserve the distinction between:

1. **algorithmic effort** - threshold, learned table, bounded rollout; and
2. **execution substrate** - the actual machine/execution lane running the fixed workload.

They also preserve preparation versus operation versus capital/environment cost, amortization/break-even thinking, correctness-before-speed, Pareto reasoning, and optional playful categories such as Top 500, Green 500, Bottom Dollar, and Training Miser.

The course consumes that doctrine; it is not its sole owner.

## Final fixed software choices

The required validation/classroom suite uses five canonical strategy configurations against `bank_at_425`:

- `bank_at_300`;
- `learner:500`;
- `learner:2000`;
- `rollout:10`;
- `rollout:25`.

Students do not need to run all five. The required student path asks for two fixed strategies or effort levels on one execution lane, plus a prediction and an Architecture-informed judgment.

The larger fixed suite exists to make instructor validation and future hardware-lane comparison repeatable.

## Architecture benchmark contract

The Architecture-owned shell lives under:

`weeks/week-16/code/architecture_farkle/`

It adds only what the Architecture lens needs:

- host name;
- processor string;
- logical CPU count;
- execution-mode label;
- accelerator-used boolean;
- repeated timing trials;
- median/min/max games-per-second summary;
- machine-readable JSON and CSV receipts.

The required execution mode is deliberately:

`native-python-cpu`

The runner repeats deterministic workloads so playing outcomes must remain identical while wall-clock throughput may vary.

A faster wrong benchmark does not count.

## Real Brandy CPU validation

Executed from the real isolated Architecture worktree with:

```bash
python scripts/validate_week16_farkle.py
```

Raw receipt generated:

`sidecar/runs/week16_farkle_architecture_validation_20260817T003425Z.md`

Observed environment:

- host: `brandy`;
- CPU: `Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz`;
- logical CPUs: 96;
- Python: 3.9.21;
- execution mode: `native-python-cpu`;
- accelerator used: `False`.

All required checks were GREEN:

- generated canonical package matches provenance hashes;
- CPU execution mode explicit;
- no accelerator claim;
- fixed five-strategy suite executes;
- raw denominators consistent;
- deterministic outcomes stable across repeats;
- throughput median/min/max positive and ordered;
- JSON/CSV evidence emitted.

Observed suite:

| strategy | win rate vs `bank_at_425` | median games/s | min | max |
|---|---:|---:|---:|---:|
| `bank_at_300` | 0.600 | 3039.38 | 2999.05 | 3079.72 |
| `learner:2000` | 0.650 | 3065.15 | 3065.01 | 3065.29 |
| `learner:500` | 0.525 | 2987.56 | 2981.92 | 2993.19 |
| `rollout:10` | 0.650 | 824.86 | 824.67 | 825.06 |
| `rollout:25` | 0.600 | 427.08 | 426.78 | 427.38 |

The runtime validator intentionally records:

> **This is a Brandy native-Python CPU receipt. It is not a Tesla T4 result.**

Brandy physically containing a Tesla T4 does not make a native Python CPU benchmark an accelerator benchmark.

## Deck validation

Brandy did not have `latexmk`, and no package installation was performed merely to make the receipt look cleaner.

The exact committed:

- `weeks/week-16/monday.tex`;
- `weeks/_shared/beamer-preamble.tex`

were subsequently compiled in an independent LaTeX environment using:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

The build completed GREEN and produced a 13-page PDF.

The rendered PDF remains a reproducible build product rather than canonical authored source.

## Student runtime and friction

Required path:

- ordinary supported computer;
- Python;
- CPU only;
- two fixed strategy choices;
- bounded repeated workload;
- machine-readable receipt;
- short evidence-backed judgment.

Not required:

- GPU;
- CUDA;
- cloud account;
- Kubernetes;
- NRP access;
- paid AI or premium CLI;
- large model or dataset download;
- Machine Dossier modification;
- new Architecture mechanism.

This keeps hardware wealth from determining the grading ceiling.

## Week package created

Student-facing:

- `weeks/week-16/README.md`
- `weeks/week-16/monday.md`
- `weeks/week-16/monday.tex`
- `weeks/week-16/wednesday.md`
- `weeks/week-16/friday.md`
- `weeks/week-16/references.md`

Instructor/validation:

- `weeks/week-16/_instructor.md`
- `weeks/week-16/_validation.md`
- `scripts/validate_week16_farkle.py`

Architecture runtime:

- `weeks/week-16/code/architecture_farkle/`

Canonical generated dependency:

- `weeks/week-16/code/farkle_ml/`

## Architecture judgment prompt

The final student judgment stays intentionally short:

> **For this workload, under this constraint, measured this way, I would choose this architecture/strategy because the additional effectiveness is or is not worth the additional computational cost.**

Students must identify:

- the objective;
- the evidence that mattered;
- one Architecture mechanism that helps explain the result;
- a limitation;
- what changed or stayed the same after measurement.

Raw output alone is not the assignment.

## Hardware lanes

The required student release does not wait for a hardware tournament.

Named future optional lanes include:

- Brandy / Tesla T4;
- Maise / RTX 2080 SUPER;
- April / RTX 5080;
- GTX 1080 legacy lane;
- future NRP RTX 6000-class professional Blackwell lane.

These names are experiment targets, not completed accelerator benchmarks.

A future lane may be called an accelerator result only after it proves:

1. actual accelerator dispatch;
2. benchmark-contract equivalence;
3. deterministic/correctness gates;
4. explicit execution context;
5. standard result receipt.

Cross-machine rankings are not yet claimed.

## Training / preparation cost treatment

The shared experiment model keeps preparation and operation separate.

This matters because:

- learned strategies pay preparation/training cost and may be cheap during play;
- rollout strategies pay little preparation cost but spend simulation work at each decision;
- simple thresholds can remain rational when marginal effectiveness does not justify extra computation.

The Week 16 lesson invites amortization and break-even reasoning without opening a new theory unit.

## Leaderboard / runner implemented

No production leaderboard or tournament service was built.

The Architecture runner plus standard JSON/CSV receipt is intentionally sufficient for the required week.

Potential categories such as Farkle Champion, Top 500, Green 500, Bottom Dollar, Training Miser, and same-hardware Round Robin remain optional presentation surfaces for later instructor-controlled hardware experiments.

## Larger infrastructure deliberately parked

Not built:

- persistent tournament web service;
- generalized Kubernetes submission platform;
- student-code execution service;
- GitHub app/controller;
- live semester leaderboard;
- cross-host scheduler;
- required GPU backend;
- energy/power telemetry stack.

Those ideas may be worthwhile elsewhere. They are not Week 16 blockers.

## Machine Dossier / grading confirmation

- **No Architecture Checkpoint 4.**
- **No Machine Dossier continuation.**
- **No new grading category.**
- **No post-Week-14 technical layer.**

Week 16 uses existing course reasoning habits for a playful shared application.

## Final classification

> **COMPUTER ARCHITECTURE WEEK 16 REQUIRED PATH GREEN. CANONICAL SHARED CONSUMER GREEN. OPTIONAL HARDWARE/ACCELERATOR LANES REMAIN FUTURE ENRICHMENT.**

The learning game works without waiting for a grand tournament platform.