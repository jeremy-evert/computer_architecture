# Prompt 004_j - Author Week 13: Different Machines for Different Work

**Status:** OPEN  
**Depends on:** 004_i; Prompt 003 vector substrate  
**Continuity:** reuse Week 12 workload shape where practical

## Why this week exists

After Week 12, students know general-purpose parallelism has costs. Week 13 asks when changing the execution organization itself is worth it.

The goal is not to convert Architecture into CUDA training. It is to make students reason about **workload fit, throughput orientation, data movement, and setup cost**.

## Central question

> **When does the workload justify a different kind of machine?**

## Required concepts

At bounded depth:

- scalar execution;
- SIMD/vector;
- compiler vectorization;
- GPU/SIMT conceptual model;
- throughput orientation;
- memory bandwidth/data movement;
- setup/launch/transfer cost;
- accelerators/tensor/ML-shaped execution;
- precision formats such as FP32/FP16/BF16/int8 only where they illuminate architecture tradeoffs.

CPU-only required path remains mandatory.

## Monday package

Build from Week 12's workload and ask:

> Instead of adding more general workers, what if we change the organization of the work?

Make students predict when regular data-parallel work should benefit from vector/specialized execution and when setup/data movement might erase the benefit.

## Wednesday investigation

Required path:

```text
archlab run vector
archplot vector ...
```

Preserve Prompt 003's crucial epistemic lesson: in the validation run, the compiler reported vectorization and the vectorized/native build was slower.

Do **not** engineer the assignment to guarantee a speedup.

Require students to inspect:

- timing;
- compiler vectorization report;
- disassembly or equivalent evidence;
- problem size/workload shape;
- repeated trials.

The correct conclusion may be “the expected advantage did not materialize here.”

## Optional GPU enrichment

If GPU hardware is available for instructor/showcase or optional student exploration, compare the same conceptual workload and include setup/data transfer.

No leaderboard. No extra grading ceiling.

## Friday Explain / Defend

Require a decision:

- was specialized/vector execution justified for this workload under this evidence?
- what did the compiler actually do?
- what performance result occurred?
- what other evidence would be needed before making a stronger architecture claim?

## Machine Dossier

Add workload-fit/specialization evidence and revise any naive Week 5 “bigger GPU/vector = better” assumption.

## AI Fluency Lens 13

Decide.

Ask an AI system to recommend scalar/vector/GPU/general-purpose execution for a bounded workload. Then compare the recommendation to actual measured/inspection evidence.

## Professional Minds

Wednesday: *97 Things Every Programmer Should Know*  
Friday: *How to Win Friends and Influence People*

Keep the professional strand about communicating tradeoffs/decisions, not fake accelerator metaphors.

## Stack Showcase

This is a perfect place for instructor GPU/local-model/accelerator hardware if available. Show transfer/setup and workload shape, not just a flashy utilization panel.

## Hard decisions 004_j must make

- best persistent Week 12/13 workload;
- default problem size;
- exact compiler flags/report exposed to students;
- disassembly depth;
- precision-format depth;
- how much GPU memory hierarchy belongs in required lecture;
- optional GPU experiment shape;
- best real accelerator showcase.

## Validation

- execute scalar/vector comparison exactly as authored;
- confirm compiler evidence;
- repeat measurements;
- preserve inconvenient results;
- validate CPU-only fallback path;
- if GPU example is published, measure setup/data movement and mark platform/hardware scope.

## Report

Write `sidecar/reports/004_j_author_week_13_different_machines_for_different_work.md`.

## Done when

Students stop treating “accelerated,” “vectorized,” and “GPU” as magic adjectives and can defend **whether a workload's shape earns the specialization cost**.