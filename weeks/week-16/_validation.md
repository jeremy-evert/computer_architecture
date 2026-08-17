# Week 16 authoring / execution validation receipt

**Status:** GREEN - required CPU path and deck source validated; release semantics reconciled to dead days

**Validation date:** 2026-08-16  
**Authored branch:** `farkle/shared-core-architecture-brandy`  
**Validator:** Foreman + real Brandy checkout + independent exact-source LaTeX build  
**Execution platform:** Brandy for workload; independent LaTeX toolchain for deck compilation

## Authoring checks

- [x] No unresolved template placeholders remain in the authored Week 16 files.
- [x] `README.md` central question matches Monday/Wednesday/Friday.
- [x] Monday digest and deck share the same prior belief, model, prediction, and scope.
- [x] AI Fluency integration uses Lens 16: Reflect and Improve.
- [x] Professional Minds references remain reflection/enrichment rather than duplicate Architecture assignments.
- [x] Machine Dossier action is explicitly `NO CHANGE` because the technical dossier froze in Week 14.
- [x] Friday requires a bounded judgment, evidence, Architecture connection, limitation, and revision rather than raw-output paste.
- [x] No Checkpoint 4 or new grading category was invented.
- [x] Canonical shared computational ownership is recorded through `_SHARED_PROVENANCE.json`.

## Fall 2026 dead-days release check - GREEN

The course-family grading work verified that the three class days immediately before finals are Monday Nov. 30, Wednesday Dec. 2, and Friday Dec. 4, which is all of Week 16 for the Fall 2026 M/W/F calendar.

The Week 16 student/instructor source now explicitly preserves the learning experience while preventing a deployment compiler from interpreting it as recurring graded work:

- [x] no Machine Dossier checkpoint;
- [x] no graded AI Fluency Week 16 object should be created;
- [x] no graded Professional Minds Week 16 object should be created;
- [x] no graded Architecture Investigation Week 16 object should be created;
- [x] no graded Explain / Defend Week 16 object should be created;
- [x] Friday judgment is student learning/portfolio evidence, not a graded Canvas submission;
- [x] optional hardware/Stack Showcase work creates no grading advantage.

**Deployment gate:** Course Foundry Prompt 008 must contain a regression test that fails if recurring graded Week 16 objects are reintroduced. This source-level check does not by itself prove the compiler is compliant until that test and the Savnac dry run pass.

## Required execution path - GREEN

Executed from a real Brandy checkout:

```bash
python scripts/validate_week16_farkle.py
```

Retained receipt:

`sidecar/runs/week16_farkle_architecture_validation_20260817T003425Z.md`

Observed platform:

- host: `brandy`
- CPU: `Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz`
- logical CPUs: 96
- execution mode: `native-python-cpu`
- accelerator used: `False`
- Python: 3.9.21
- shared source commit: `d3a1ed379a652731b0b6237c33b4fe42c518ac9e`

Required checks all passed:

- [x] generated canonical package hashes match its provenance manifest;
- [x] required execution mode is explicitly `native-python-cpu`;
- [x] no accelerator use is claimed;
- [x] fixed five-strategy CPU suite executes;
- [x] raw denominators are internally consistent;
- [x] deterministic playing outcomes repeat across timing trials;
- [x] throughput median/min/max evidence is positive and ordered;
- [x] JSON and CSV machine-readable evidence are emitted.

Observed fixed CPU suite:

| strategy | win rate vs `bank_at_425` | median games/s | min | max |
|---|---:|---:|---:|---:|
| `bank_at_300` | 0.600 | 3039.38 | 2999.05 | 3079.72 |
| `learner:2000` | 0.650 | 3065.15 | 3065.01 | 3065.29 |
| `learner:500` | 0.525 | 2987.56 | 2981.92 | 2993.19 |
| `rollout:10` | 0.650 | 824.86 | 824.67 | 825.06 |
| `rollout:25` | 0.600 | 427.08 | 426.78 | 427.38 |

Interpretation boundary retained by the validator:

> This is a Brandy native-Python CPU receipt. It is not a Tesla T4 result.

That sentence is part of the Architecture lesson, not merely bookkeeping. Physical accelerator presence is not evidence of accelerator execution.

## Deck build gate - GREEN

Brandy itself did not have `latexmk`, so Brandy correctly reported a toolchain YELLOW rather than changing the course/runtime environment.

The exact committed:

- `weeks/week-16/monday.tex`
- `weeks/_shared/beamer-preamble.tex`

were then compiled in an independent LaTeX environment with:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

Result:

- [x] compilation GREEN;
- [x] output PDF produced;
- [x] 13 pages;
- [x] deck source remains a visual storyboard rather than copied digest paragraphs;
- [x] speaker notes remain present where they materially help the recording.

The rendered PDF is a reproducible build product and is not required to be committed during source authoring.

## Fallback

The retained real Brandy GREEN validator receipt may be used as instructor/student fallback evidence if a live local run is unavailable. Do not invent benchmark numbers.

The fallback preserves the same reasoning task: students compare effectiveness, preparation/operation cost, and named execution context before making the Architecture judgment.

## Remaining YELLOWs

| Yellow | Why it remains | Blocks authoring? | Blocks student release? | Owner / next proof |
|---|---|---:|---:|---|
| full-semester compiler dead-days regression | source is now explicit, but Course Foundry must prove it emits no recurring graded Week 16 objects | no | **yes for graded LMS release** | Prompt 008 |
| optional hardware zoo | T4, RTX 2080 SUPER, RTX 5080, GTX 1080, and NRP/RTX 6000-class lanes require separate verified execution receipts | no | no | future Stack Showcase / hardware-lane campaign |
| accelerator execution | no accelerator backend has yet proved actual dispatch plus benchmark equivalence | no | no | future optional enrichment |
| power / energy evidence | no synchronized power sampler is part of the required CPU path | no | no | future optional enrichment |

## Validation judgment

**What is genuinely ready:** canonical shared package, Architecture-owned runner/CLI, student Monday/Wednesday/Friday surfaces, instructor plan, exact-source deck build, provenance, real Brandy CPU evidence, one-command validation contract, and a source-explicit ungraded dead-days posture.

**What should not yet be claimed:** Tesla T4 execution, GPU acceleration, power/energy results, cross-machine performance rankings, or a dead-days-compliant Savnac grading surface until Prompt 008 proves the compiler and dry run.

The required Week 16 **learning** path is GREEN. The LMS release gate remains dependent on the full-semester compiler honoring the ungraded dead-days contract.
