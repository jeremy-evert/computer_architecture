# Friday - Explain / Defend: Was the Extra Compute Worth It?

Submit a short architectural judgment. This is not a screenshot assignment and not a new Machine Dossier checkpoint.

Use your Wednesday JSON/CSV evidence to answer the six parts below.

## 1. Bounded claim

Complete this sentence:

> **For this Farkle workload, on this execution lane, under the objective __________, I would choose __________ because __________.**

Name the actual strategies you compared.

## 2. Evidence that matters

Give at least three concrete pieces of evidence from your receipt.

Include:

- one effectiveness measure;
- one preparation or operating-cost measure;
- one machine/execution-context fact.

Good evidence sounds like:

> The strategy won X of Y games while the comparison won Z, and its repeated CPU throughput had a median of ___ games/s.

Do not paste the entire JSON file.

## 3. Architecture connection

Name **one** prior Architecture idea that helps explain why the cost/result relationship matters.

Possible lenses include:

- latency;
- throughput;
- parallelism;
- locality;
- specialization;
- resource constraints;
- data movement;
- amortization of up-front cost.

Use the idea to explain the evidence. Merely naming a vocabulary word is not enough.

## 4. Limitation

State one thing your run does **not** establish.

Examples:

- it did not measure power;
- it did not execute on the GPU;
- it did not compare two physical machines;
- it did not establish purchase-price efficiency;
- three timing repeats do not capture every source of system noise.

## 5. Revision after evidence

Return to Monday's prediction.

Choose one:

- **DEFEND:** the evidence strengthened my original prediction;
- **REVISE:** I changed the architecture I would choose;
- **QUALIFY:** my prediction was directionally useful but needed a narrower condition;
- **REFUSE:** the evidence is not sufficient to make the broader claim I originally wanted to make.

Explain in two or three sentences.

## 6. AI/tool use and verification

If an AI/tool helped you interpret the receipt, name what it helped with and identify one field or relationship you independently checked in the raw JSON/CSV.

If you did not use one, say so. There is no paid-AI requirement.

## Final one-sentence verdict

End with:

> **The extra computation was / was not worth paying for because __________.**

Different objectives may produce different defensible winners. That is the point.
