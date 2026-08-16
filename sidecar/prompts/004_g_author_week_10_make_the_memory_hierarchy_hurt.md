# Prompt 004_g - Author Week 10: Make the Memory Hierarchy Hurt

**Status:** OPEN  
**Depends on:** 004_a and prior core continuity; Prompt 003 memory substrate GREEN on Linux

## Why this week exists

Students already know machines have cache, RAM, and storage. That is not enough.

Week 10 should make them **feel why hierarchy exists** by showing that dependent access latency, streaming bandwidth, locality, and working-set size produce different behavior.

## Central question

> **Why do we need layers of memory, and what does crossing a layer feel like?**

## Required concepts

- temporal/spatial locality;
- cache lines/blocks;
- hits/misses;
- mapping/associativity/replacement at useful depth;
- working-set size;
- AMAT at a humane depth;
- latency vs bandwidth;
- prefetching as an important complication;
- TLB/layout effects as caveats where relevant;
- capacity vs speed vs cost/scarcity tradeoff.

Avoid drowning the sensory week in hand-simulated cache tables.

## Monday package

Start with the Week 5 hierarchy ledger and attack its naive “fast/slow” categories.

Build predictions around two workload shapes:

- dependent pointer chasing;
- streaming/bulk access.

Ask what should happen as working set grows.

Do not show the canonical curve before students commit to a prediction.

## Wednesday investigation

Use:

```text
archlab run memory
archplot memory ...
```

Students should sweep working-set size and compare dependent access with streaming behavior.

Required reasoning:

- identify regions/shape rather than worship exact ns values;
- explain why latency and bandwidth are different questions;
- discuss why a cliff may be noisy or shifted;
- avoid claiming an exact L1/L2/L3 boundary without adequate evidence.

## Friday Explain / Defend

Require interpretation of the student's curve or validated fallback curve:

- what changed;
- where behavior changed materially;
- plausible mechanism;
- alternative/noise explanation;
- which Week 5 metric now looks naive.

## Machine Dossier

This is a major Sensitivity Profile expansion.

Add memory plots and revise the hierarchy ledger with better distinctions among:

- capacity;
- latency;
- bandwidth;
- cost/scarcity;
- workload sensitivity.

## AI Fluency Lens 10

Critique.

Give AI a seductive memory claim such as “RAM is slower than cache because X” or a confident cache-boundary interpretation, then use evidence to critique precision/mechanism.

## Professional Minds

Wednesday: *Software Engineering*  
Friday: *Agile Software Development*

Keep the professional thread light and relevant to evidence/iteration.

## Stack Showcase

Real cache/memory profiling on one of the instructor's systems is ideal. Optional performance counters are welcome if the showcase explicitly distinguishes them from the required student path.

## Hard decisions 004_g must make

- exact working-set sweep/default runtime;
- number of trials and summary statistic shown to students;
- how much cache mapping arithmetic belongs Monday;
- whether AMAT is required calculation or conceptual support;
- exact fallback-use threshold;
- whether storage appears here or remains Week 11;
- best instructor profiling showcase.

## Validation

- run the exact authored sweep on at least one supported surface;
- generate final figures;
- verify fallback data and plotting instructions;
- inspect runtime on ordinary-ish hardware if available;
- audit every causal claim against what the experiment actually varies.

## Report

Write `sidecar/reports/004_g_author_week_10_make_the_memory_hierarchy_hurt.md`.

## Done when

Students stop saying merely “cache is faster” and can explain why **access pattern and working-set shape determine whether a workload experiences latency, bandwidth, or locality pain**.