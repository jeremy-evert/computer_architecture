# Instructor plan - Week 16

This file is not student-facing by default.

## Dead-days boundary

Fall 2026 Week 16 is the three-class-day dead-days window immediately before finals.

Keep the Farkle + ML experience because it is a useful, playful synthesis, but do **not** turn it into recurring graded work:

- no graded AI Fluency object;
- no graded Professional Minds object;
- no graded Architecture Investigation object;
- no graded Explain / Defend object;
- no Machine Dossier checkpoint;
- no hidden points for optional hardware/showcase work.

Students may run the benchmark, discuss it, write the bounded judgment, and retain receipts as learning/portfolio evidence. The instructor may demonstrate and discuss. Canvas must not assign recurring Week 16 points during dead days.

## Monday recording spine

**Target shape:** a concise payoff lecture, not a new Architecture unit.

1. Open with: "What did the extra compute buy?"
2. Name the false shortcut: more compute / newer hardware is not automatically the better architecture.
3. Separate algorithmic effort from execution substrate.
4. Separate effectiveness, preparation, operation, and machine/environment currencies.
5. Use learner-versus-rollout as the persistent example: pay before play versus pay during play.
6. Explain why timings repeat and why median/min/max are more honest than one stopwatch reading.
7. Make the student's two-strategy prediction visible.
8. Stop with: "When the machine runs the fixed workload, what does the extra compute actually buy?"

**Live tools / demonstrations:** show one canonical receipt JSON and the matching compact terminal summary.

**AI/tool verification moment:** if an AI summarizes the receipt, verify one raw denominator and one throughput field directly in JSON/CSV before accepting the story.

**Likely editing/capture needs:** terminal capture of `architecture_farkle.cli host` and one small comparison; no giant dashboard.

## Wednesday canonical run

From repository root:

```bash
python scripts/validate_week16_farkle.py
```

For a student-sized demonstration from `weeks/week-16/`:

```bash
PYTHONPATH=code python3 -m architecture_farkle.cli compare \
  --strategy-a learner:2000 \
  --strategy-b bank_at_425 \
  --games 500 --seed 6262 --repeats 3 \
  --lane-label classroom-cpu \
  --out-dir artifacts/classroom-demo
```

**Expected shape, not exact number:** deterministic playing outcomes repeat for the same seed; wall-clock throughput varies somewhat across timing repeats; trained strategies expose preparation cost while rollout strategies expose more decision-time cost.

**Known noise/failure modes:** background CPU load, thermal behavior, Python version differences, missing/old checkout, accidental claim that a physically present GPU was used.

**Fallback receipt/trace:** retain the latest real GREEN `sidecar/runs/week16_farkle_architecture_validation_*.md` receipt and its summarized table. Students should still reason from real evidence, not invented sample numbers.

## Friday Stack Showcase

**Course question:** how does the same fixed decision workload behave when the execution substrate changes?

**Real system/tool/workflow:** run the same versioned benchmark receipt contract on selected instructor-owned lanes only after each lane is verified.

Potential future lanes documented in the canonical shared repository include:

- Brandy native CPU, with Tesla T4 physically present but not used by this path;
- Maise native CPU / future verified RTX 2080 SUPER accelerator lane;
- April native CPU / future verified RTX 5080 accelerator lane;
- GTX 1080-class desktop lane when available;
- later NRP professional-GPU lane when the actual executing hardware is known and recorded.

**Evidence/action demonstrated:** compare host facts and throughput while holding the shared Farkle benchmark contract fixed.

**Connection to the student lab:** same receipt schema, same software strategies, same seed/game contract. Only the declared substrate changes.

**Intentionally beyond the required student path:** accelerator backends, NRP orchestration, energy measurement, purchase-price normalization, tournament automation.

**One takeaway:** hardware evidence becomes useful only when the workload and measurement contract stay stable enough to support the comparison.

## Hardware honesty rule

Do not call a run a T4/2080/5080/GPU result because `nvidia-smi` sees a device. The workload must actually dispatch to the accelerator, pass correctness/equivalence gates, and record that backend in the receipt.

## Scope fences

- no Architecture Checkpoint 4;
- no Machine Dossier expansion;
- no required GPU or private machine;
- no production leaderboard/service;
- no Kubernetes requirement;
- no package-registry detour;
- no paid AI/CLI requirement;
- no recurring graded Week 16 objects during dead days.

The learning game is complete when students can use a trustworthy fixed workload to make one cost-versus-effectiveness judgment.
