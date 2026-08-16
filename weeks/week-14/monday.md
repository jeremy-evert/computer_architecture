# Week 14 Monday - Sit in the Architect's Chair

## Question

> **Given my workload and constraints, what would I build now, and what evidence changed or strengthened my judgment?**

## The course needs a verdict, not a topic

Week 14 is architecture decision-making. A mature result may change the machine, keep the machine, or change only the reasoning behind it.

## Reopen the original claim

Read the Week 5 `Claim waiting to be attacked` exactly as written. Do not rewrite history so the original design looks smarter.

## Naive metrics became conditional

Week 5 numbers such as $/GB, capacity, core count, clock, GPU VRAM/headline specs may still matter. They now sit beside evidence about:

- latency and throughput;
- locality and bandwidth;
- scaling and coordination;
- communication shape;
- specialization and data movement;
- cost and workload fit.

Choose only the dimensions that bear on your workload.

## Fresh market, same architecture question

Refresh current price/spec evidence using the Week 5 schema. Identify which changes are **market drift** and which design changes are **learning-driven**.

## Unchanged can be excellent

`I kept this component` is a strong architecture answer when you can connect workload -> course evidence -> chosen metric -> accepted tradeoff -> limitation.

## Automation has a boundary

Scripts and AI may gather sources, rebuild plots/tables, assemble the PDF, and run consistency checks. They may not make the final tradeoff judgment for you.

## Freeze means freeze

Checkpoint 3 compiles the final technical Dossier. Week 15 may curate it, Week 16 may echo it, and Week 17 may reflect on it. No new technical layer is added.

## Prediction

Before doing fresh shopping research, identify the Week 5 choice you expect to keep and the one you expect to change, then point to the earlier evidence driving that expectation.