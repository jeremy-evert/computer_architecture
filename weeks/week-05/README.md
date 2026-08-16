# Week 5 - Build the Machine

> **Central machine question:** What should I build for this workload, what does each part buy me, and how should I compare choices?

## Week at a Glance

**Useful prior belief we are testing:** a better computer is mostly the one with the biggest numbers.

**Prediction before the investigation:** under a fixed $1,500 tower budget, which component category deserves the largest share of your budget for your workload, and what evidence would make you move about $150 somewhere else?

**AI Fluency lens:** Lens 5 - Select the Right Model.

**Professional Minds:** Wednesday - *The Art of Thinking Clearly*; Friday - *How Not to Be Wrong*.

| Day | Mode | What happens | Evidence |
|---|---|---|---|
| Monday | Think / Frame | Treat a computer as a negotiated set of workload, compatibility, capacity, cost, and uncertainty constraints. | prediction + first design model |
| Wednesday | Investigate / Break / Measure | Build one compatible $1,500 system, reallocate about $100-$200 while holding workload/budget steady, calculate deliberately naive metrics, and inspect one real machine with `archprobe`. | dated market table + compatibility receipt + tradeoff comparison + machine snapshot |
| Friday | Explain / Defend | Defend one intentional spend and one accepted compromise without pretending a shopping metric is a benchmark. | bounded evidence-backed design argument |

## The common constraint

Your hypothetical tower budget is **$1,500 USD**.

Include the system unit: CPU, compatible motherboard, memory, primary storage, case, power supply, cooling when needed, and a discrete GPU only when your workload/design requires one.

Exclude tax, shipping, display, keyboard/mouse, operating-system license, and other peripherals. Used hardware is not required.

The budget is hypothetical. **You are not being asked to buy anything.** Owning expensive hardware does not improve your grade.

## Choose a workload

Pick one:

1. **Build & Container Developer** - IDEs, compilation, containers/VM-shaped multitasking, general development responsiveness.
2. **Play & Stream** - modern interactive/gaming work plus communication/light recording or streaming.
3. **Create** - photo/video/content creation where CPU, memory, storage, and optional acceleration compete for budget.
4. **Local Data / AI Explorer** - data analysis and modest local inference/experimentation, not giant-model training.
5. **Guarded custom workload** - name three concrete tasks, your most important capacity/throughput/responsiveness concern, one likely bottleneck or uncertainty, and why the workload still fits the same $1,500 tower constraint.

You do **not** need benchmark expertise yet. Week 5 predictions are allowed to be wrong. Later weeks exist to make them better.

## Continuity

**What returns from Weeks 2-4:** skeptical AI use, reproducible work habits, and machine observation.

**What this week intentionally carries forward:** one workload, one designed machine, one observable machine, one set of assumptions, and one Machine Dossier through Week 14.

Week 14 asks you to return to this same design question with much stronger evidence.

## Machine Dossier handoff

**Action:** `ADD`

Initialize Dossier v0 with:

- workload + $1,500 constraint;
- designed baseline machine;
- one controlled reallocation/tradeoff;
- compatibility receipt;
- dated market/spec evidence;
- first hierarchy ledger;
- first Dollars-Per/budget-share metrics;
- observable-machine `archprobe` receipt or approved fallback;
- at least one predicted bottleneck/constraint;
- one claim you expect later evidence might overturn.

Suggested working shape:

```text
dossier/
  machine-map.md
  evidence/
    week05-market.csv
    week05-archprobe/
      machine.json
      machine.txt
```

This is the beginning of one living technical record, not the first page in a weekly worksheet pile.

## Student path

1. Read/work through [`monday.md`](monday.md) and record your prediction before shopping/research.
2. Complete the investigation in [`wednesday.md`](wednesday.md).
3. Use only the evidence that matters to complete [`friday.md`](friday.md).
4. Use [`references.md`](references.md) when you need verification or deeper reinforcement.

## Required materials and equity

- ordinary web browser;
- course repository/laboratory for `archprobe` where supported;
- free manufacturer/retailer information;
- PCPartPicker or another builder may be used as a convenience, but no commercial builder is required;
- no paid AI, premium CLI agent, commercial textbook, GPU, private host, or actual hardware purchase required.

If your machine cannot run the current Observatory path, use the named course-owned fallback snapshot and do the same reasoning. The grading ceiling is identical.

## Scope

**This week is about:** workload-driven design, compatibility, hierarchy, cost evidence, intentionally naive metrics, and explicit tradeoffs.

**This week is not trying to teach:** benchmark interpretation, cache timing, pipeline performance, virtual memory, GPU programming, exhaustive electrical engineering, or “the best PC build.”

Those tempting details arrive only when the course has enough evidence to make them useful.
