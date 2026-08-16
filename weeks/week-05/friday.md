# Friday - Explain / Defend

This is not a parts-list submission. Your job is to defend **one bounded design judgment** from Week 5 evidence while naming what you still do not know.

## Professional Minds - *How Not to Be Wrong*

Carry forward the shared question:

> **How do attractive numbers and familiar stories trick us into feeling more certain than the evidence allows?**

Your Architecture receipt is the only required product here. Do not create a separate book-response assignment.

## 1. Claim / answer

Complete this idea in your own words:

> **For my $1,500 ______ workload, I spent most intentionally on ______ because ______. I deliberately compromised on ______ because ______.**

A good claim is specific enough that later evidence could change it.

## 2. Evidence that matters

Use the smallest evidence set that actually supports your claim.

Include:

- workload + budget;
- the relevant component prices and budget shares;
- the one spec/capacity fact that matters most;
- the relevant compatibility evidence;
- the baseline vs controlled-reallocation difference;
- the exact naive metric you used, with units.

Do not paste your entire market table or terminal session into the explanation.

## 3. Architecture mechanism / resource story

Explain why the resource you funded should matter to your workload.

At Week 5 depth, this may be a claim about:

- useful capacity;
- number/type of processing resources;
- storage role;
- graphics/accelerator need;
- avoiding an obvious compatibility/interface constraint;
- preserving budget for the resource you believe is closest to the workload.

Do not invent benchmark conclusions you did not measure.

## 4. Limitation

Name one way your best-looking metric could mislead you.

Examples:

- $/core does not measure how well my workload uses the cores;
- $/GB VRAM does not measure GPU throughput or data movement;
- $/TB storage says nothing by itself about latency, bandwidth, endurance, or controller behavior;
- cache capacity has no meaningful retail $/GB in this design;
- a compatibility checker cannot prove workload performance.

Then name **one future measurement** that would make your design judgment stronger or force you to revise it.

## 5. Revision

Compare Monday's prediction with Wednesday's evidence.

- **Prediction:** what did you initially think deserved the budget?
- **Reallocation:** what did you move and why?
- **Revision:** what did the controlled change teach you about the tradeoff?

A strong answer may keep the original design. “I kept it” is meaningful only when the evidence explains why.

## 6. AI / tool use and verification

If AI or another recommendation tool helped:

- what assumption/metric did it appear to optimize?
- what compatibility/spec/price claims did you verify independently?
- where did your final design disagree with the recommendation, if anywhere?

`AI said this is the best part` is not evidence.

If you used course-provided AI recommendation samples instead of a live tool, identify them as course-provided.

## Machine Dossier

**Action: ADD.**

Your `dossier/machine-map.md`, dated market evidence, and `week05-archprobe` receipt become the baseline that later weeks may revise.

Do not rewrite the Week 5 evidence later to make your original design look smarter. Preserve the original snapshot. Week 14 is more interesting if the record remembers what you actually believed.
