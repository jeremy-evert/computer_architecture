# Monday - Think / Frame

## Central question

> **What should I build for this workload, what does each part buy me, and how should I compare choices?**

This is the first week where the course stops preparing the laboratory and starts using it to reason about a machine.

## The useful prior belief

Most of us begin with some version of this model:

> Bigger numbers make a better computer.

That belief is not stupid. More capacity, more cores, a larger GPU, a higher clock, and a larger budget often can buy capability.

The problem is that **“better” has no meaning until we name the workload and the constraint.**

A machine is a set of negotiated choices. Money spent in one place is money not spent somewhere else. A part can be impressive and still be the wrong answer to the problem.

## Model 1 - workload comes before specification

Start with verbs, not components.

A workload says what the computer has to *do*:

- compile and run many development tasks;
- render frames interactively;
- encode/edit media;
- hold large working data sets;
- move data quickly;
- perform lots of independent arithmetic;
- stay responsive while several things happen at once.

A specification is evidence about a component. It is not automatically evidence that the component matters to your workload.

When you see a large number, ask:

1. What resource does this number describe?
2. What workload behavior would care about that resource?
3. What did I give up to buy more of it?
4. What evidence would tell me the resource is actually the constraint?

Week 5 will not answer #4 completely. That is intentional. Weeks 8, 10, 12, and 13 will give us better measurement tools.

## Model 2 - first ask “would it run?”

Before performance, the machine must be coherent enough to exist.

Your bounded compatibility checklist is:

- **CPU ↔ motherboard:** supported socket/platform and reasonable firmware/chipset support;
- **motherboard ↔ memory:** correct memory generation/type and supported capacity/configuration;
- **storage ↔ motherboard:** compatible M.2/NVMe/SATA interface and available slot/port;
- **motherboard/GPU/cooler ↔ case:** form factor and physical clearance;
- **CPU/GPU ↔ power supply:** adequate power budget and required connectors;
- **graphics path:** either a usable integrated-graphics path or a discrete GPU when the chosen parts/workload need one.

A builder website can help catch mistakes. It is **not the source of truth for why the parts fit**. When a compatibility claim matters, prefer the official specification page for the exact component.

## Model 3 - capacity, latency, and bandwidth are different questions

Three numbers are going to haunt this course in useful ways:

- **Capacity:** how much can be held?
- **Latency:** how long until one requested thing becomes available?
- **Bandwidth:** how much can move or complete per unit time once work is flowing?

Those are not interchangeable.

A storage device can have enormous capacity and still be a poor answer to a latency-sensitive problem. A component can advertise huge throughput and still make dependent work wait.

For now, treat the hierarchy qualitatively:

| Layer | Typical role | Capacity tendency | Separately purchased? | Persistent? |
|---|---|---|---|---|
| L1/L2/L3 cache | keep recently/usefully located data close to CPU execution | small relative to RAM | no | no |
| RAM | active program/data working space | much larger than cache | yes | no |
| SSD/NVMe | persistent local storage | much larger again | yes | yes |
| optional HDD/other storage | inexpensive bulk persistence | very large | yes | yes |

We are **not** memorizing a universal nanosecond table this week. Week 10 will make memory behavior hurt enough to measure.

## Model 4 - price is evidence; Dollars-Per is a model

Week 5 preserves the useful historical instinct of **Dollars Per**.

Retail capacity metrics can be literal:

- RAM price / RAM GB;
- storage price / storage TB.

But even correct arithmetic can produce a bad decision rule.

### Synthetic teaching example

These numbers are invented for the lesson. They are **not** current product recommendations.

| Option | Price | Advertised physical cores | Naive $/core |
|---|---:|---:|---:|
| CPU A | $280 | 8 | $35.00 |
| CPU B | $390 | 12 | $32.50 |

CPU B “wins” dollars per core.

Does that prove CPU B is the better use of the budget?

No.

The metric has not told us:

- whether our workload scales across those cores;
- whether the cores are architecturally equivalent;
- single-thread behavior;
- memory behavior;
- power/thermal limits;
- whether spending the extra $110 somewhere else helps more.

The arithmetic can be true while the conclusion is nonsense.

That is why Week 5 metrics are **hypotheses with units**, not verdicts.

## The $1,500 constraint

Everyone gets the same hypothetical tower budget: **$1,500 USD**.

The equality is important. We are comparing decisions, not purchasing power.

A useful first look is **budget share**:

\[
\text{budget share} = \frac{\text{component price}}{1500} \times 100\%
\]

If your design spends 40% of its budget on one component, that is a design statement even before we know whether it is a good one.

## The controlled perturbation

After you build one compatible baseline, you will change it once while keeping the workload and total budget approximately fixed.

Move roughly **$100-$200** from one category to another.

Examples:

- CPU → GPU;
- storage capacity → RAM;
- discrete GPU → stronger CPU/RAM/storage when integrated graphics is enough;
- premium motherboard/case → a resource closer to the workload.

This is the first tiny version of what the whole semester will do:

> **Hold the question mostly still. Make one architectural resource different. See whether the workload story changes.**

## AI Fluency Lens 5 - Select the Right Model

Hardware recommendations are a great place to watch AI become confidently conditional.

Ask for two recommendations under meaningfully different framing. You may use:

- two available models;
- one model with two different roles/prompts;
- course-provided recommendation samples if AI access is unavailable.

Useful contrast:

- “maximize interactive/gaming performance under $1,500”;
- “maximize development/container responsiveness and long-lived utility under $1,500.”

Do not score the recommendations by how authoritative they sound.

Instead ask:

- What workload did the recommendation assume?
- What metric did it seem to optimize?
- Which compatibility/spec claims can I independently verify?
- Which recommendation changes when I change the workload?

**AI output is a candidate design or hypothesis. It is not price, compatibility, or specification evidence.**

## Scope and limitation

This week can support claims such as:

- this set of parts is compatible under the evidence I checked;
- this build spends more of the budget on resource X than resource Y;
- this storage choice offers a lower observed $/TB on the date I checked;
- this design reflects my current hypothesis about the workload bottleneck.

This week cannot yet support claims such as:

- this CPU is 23% faster for my workload because it has more cores;
- this larger cache guarantees better performance;
- this GPU will always be the bottleneck;
- this $/core number measures actual performance value.

Those require evidence we have not earned yet.

## Prediction for Wednesday

Before looking at current parts, write:

> **Under the $1,500 constraint, I think ______ deserves the largest share of my budget for my workload because ______. I would move about $150 somewhere else if I found evidence that ______.**

Keep this prediction. Friday needs it.

## The unresolved question

You can make a machine that fits together and calculate several perfectly correct metrics.

**Will those metrics actually tell you what the workload cares about?**

Today we build the first story. The rest of the course gets to attack it.
