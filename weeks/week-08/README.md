# Week 8 - Make It Fast Without Breaking It

> **Central machine question:** Why does overlap improve throughput, and why does it create new problems?

## Week at a Glance

**Prior belief:** higher GHz or a deeper pipeline automatically means a faster program.

**Prediction:** with the same total updates, should one serial dependency chain or four more-independent chains achieve lower time per update, and why?

**AI Fluency:** Lens 8 - Reason.  
**Professional Minds:** Wednesday - *The Pragmatic Programmer*; Friday - *Clean Code*.

Monday moves the Week 7 correct-execution model into overlap, pipeline, hazards, CPI, latency and throughput. Wednesday runs the dependency specimen and plots the result. Friday must connect the measured shape to a bounded mechanism and state what the benchmark cannot prove.

## Machine Dossier

**Action: ADD.** Add the first Sensitivity Profile performance plot and one bounded claim about dependency/available overlap.

## Required path

```bash
./lab/bin/archlab run dependency --updates 12000000 --out-dir dossier/evidence/week08-dependency
./lab/bin/archlab plot dependency dossier/evidence/week08-dependency/dependency.csv --out dossier/evidence/week08-dependency/dependency.png
```

The 12,000,000-update size matches the committed Prompt 003 smoke validation.

## Scope

The native benchmark measures the effect of dependency structure on this program and visible machine. It does **not** directly reveal physical pipeline depth or prove a particular modern microarchitecture.