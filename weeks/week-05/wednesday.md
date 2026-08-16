# Wednesday - Investigate / Break / Measure

## Question

> **Can I build a compatible $1,500 machine for one workload, then move about $150 without losing track of what I am trading away?**

This is a design investigation, not a shopping contest. You are not buying anything.

## Professional Minds - *The Art of Thinking Clearly*

Use one shared question while you work:

> **Which attractive number is most likely to trick me into feeling more certain than my evidence allows?**

Do not create a second Professional Minds assignment. Carry that question into the Architecture investigation.

## 1. Predict

Before current market research, record:

- your workload;
- the component/resource category you expect should receive the largest budget share;
- your predicted bottleneck or uncertainty;
- what kind of evidence would make you move about $150 to a different category.

Do this **before** asking an AI tool or builder to recommend parts.

## 2. Perturb

You will create:

1. one **baseline** compatible machine under the $1,500 constraint;
2. one **controlled reallocation** that moves about $100-$200 while keeping the workload and total budget approximately fixed.

Good reallocations change one design emphasis rather than rebuilding the entire computer from scratch.

**Change deliberately:** where a bounded part of the budget is spent.

**Hold reasonably constant:** workload, total budget, new-retail/not-required-used assumption, and basic tower scope.

**Why this is useful:** the comparison turns “tradeoff” from a vocabulary word into a design action.

## 3. Run - Part A: Would It Run?

Use PCPartPicker or another builder if it is convenient and accessible. The course does **not** require a particular commercial builder.

Choose:

- CPU;
- motherboard;
- memory;
- primary storage;
- case;
- power supply;
- cooling when needed;
- discrete GPU only when the design requires one.

Then complete this bounded compatibility receipt.

| Check | Your evidence | Result |
|---|---|---|
| CPU ↔ motherboard socket/platform | exact model + manufacturer/spec URL | PASS / concern |
| motherboard ↔ memory type/capacity | exact model + manufacturer/spec URL | PASS / concern |
| storage ↔ board interface/slot | exact model + spec evidence | PASS / concern |
| board/GPU/cooler ↔ case fit | form factor/clearance evidence | PASS / concern |
| CPU/GPU ↔ PSU power/connectors | power/connectors evidence | PASS / concern |
| usable graphics path exists | integrated or discrete evidence | PASS / concern |

A builder showing no warning is helpful. It does not replace your ability to explain the important checks.

## 4. Measure - Part A: current market evidence

Capture market evidence in a table or CSV with at least these fields:

```text
category,component,observed_price_usd,source_url,observed_date,architecture_property,property_value,official_spec_url,notes
```

Rules:

- record the price you actually observed;
- record the observation date;
- use the manufacturer page for architecture/spec claims when practical;
- do not silently replace a missing price with MSRP;
- do not treat an AI recommendation as market/spec evidence.

Your baseline total should be at or below $1,500 before tax/shipping under the course scope.

## 5. Measure - Part B: Dollars Per and budget share

Calculate:

### Required literal capacity metrics

- RAM $/GB;
- primary storage $/TB (or $/GB, but label units clearly).

### Required deliberately naive proxy

Choose one that fits your design:

- CPU $/advertised physical core; or
- discrete GPU $/GB VRAM.

If your CPU has heterogeneous core types, state exactly what you counted. The awkwardness is part of the lesson.

### Required budget-share view

For at least CPU, motherboard, memory, storage, GPU if present, case, PSU, and cooling if separately purchased:

\[
\text{budget share} = \frac{\text{component price}}{1500} \times 100\%
\]

A table is enough this week. Do not spend time making a decorative chart.

## 6. Build the first hierarchy ledger

Record what your designed/observable evidence can support.

| Layer | Capacity | Separately purchased? | Observed price | Price/capacity meaningful? | Persistent? | Evidence source/date | What this number hides |
|---|---:|---|---:|---|---|---|---|
| L1 cache | | no | N/A | no | no | | latency/organization/locality |
| L2 cache | | no | N/A | no | no | | latency/organization/locality |
| L3 cache | | no | N/A | no | no | | latency/organization/locality |
| RAM | | yes | | yes | no | | latency/bandwidth/timings |
| primary SSD/NVMe | | yes | | yes | yes | | latency/bandwidth/endurance/controller |
| optional secondary storage | | yes | | yes | yes | | workload/access pattern |

Do **not** invent a retail price for cache. Do **not** paste a universal latency table and call it measurement.

## 7. Run - Part B: observe one real machine

From the course repository, on a supported Observatory path:

```bash
mkdir -p dossier/evidence/week05-archprobe
./lab/bin/archprobe --out-dir dossier/evidence/week05-archprobe
```

Preserve both:

```text
dossier/evidence/week05-archprobe/machine.json
dossier/evidence/week05-archprobe/machine.txt
```

Read the scope line.

If it says `container-visible` or `WSL-visible`, that is part of the evidence. Do not silently promote what the environment can see into a claim about the physical host.

### Fallback

If `archprobe` is unavailable on your supported path after reasonable troubleshooting, use the course-owned Week 5 reference snapshot from `lab/fallback_data/`.

Identify it as **course-provided fallback evidence**. You still complete the same Machine Map and scope interpretation. There is no grading penalty.

## 8. Perturb the budget

Now move roughly $100-$200.

Keep the workload and total budget approximately fixed.

Record:

| | Baseline | Reallocation |
|---|---|---|
| money moved from | | |
| money moved to | | |
| total price | | |
| compatibility changed? | | |
| capacity/spec metric improved | | |
| capacity/spec metric worsened | | |
| workload hypothesis strengthened/weakened | | |
| new risk/uncertainty | | |

The goal is not to prove the second build is better. The goal is to expose what a design choice buys and costs.

## 9. Explain

Answer these before Friday:

1. Which component/resource got the largest intentional budget share?
2. What compatibility fact mattered most?
3. Which metric made one option look especially attractive?
4. What does that metric fail to measure?
5. What changed when you moved about $150?
6. What piece of evidence would you most like to have before claiming your build is actually faster/better for the workload?

## 10. Revise

Return to Monday's prediction.

Write one sentence for each:

- **Keep:** what part of the prediction survived?
- **Change:** what did market/compatibility evidence make you revise?
- **Narrow:** what claim became more careful?

## Machine Dossier v0

Create `dossier/machine-map.md` containing:

### Workload and constraints

- chosen workload;
- $1,500 budget;
- three concrete tasks/priorities;
- predicted bottleneck/uncertainty.

### Designed machine

- baseline parts table;
- compatibility receipt;
- controlled reallocation table;
- dated market evidence path.

### Hierarchy ledger

Use the Week 5 table above. Mark unknown rather than inventing precision.

### Observable machine

- short human-readable summary;
- path to `machine.json`;
- evidence scope;
- one way the observable machine differs from your proposed design.

### Initial metrics

- RAM $/GB;
- storage $/TB or $/GB;
- one deliberately naive proxy;
- component budget shares.

### Claim waiting to be attacked

Finish this sentence:

> **Right now I believe ______ matters most to this workload because ______. The later measurement most likely to prove me wrong would be ______.**

## What this investigation does not prove

A compatible, intelligently budgeted machine is **not automatically a measured fast machine**.

This week does not prove:

- real application performance;
- cache latency;
- memory bandwidth;
- multicore scaling;
- accelerator benefit;
- energy efficiency;
- benchmark leadership.

We have built a testable design story. The rest of the course gets to make it earn its confidence.

## Re-run / cleanup

No special cleanup is required.

Keep the dated market table and `archprobe` receipt. Week 14 needs the original evidence, not your memory of it.
