# Week 16 - Farkle + Machine Learning (Nov 30-Dec 4)

## Status

**Runnable canonical-shared consumer authored on `farkle/shared-core-architecture-brandy`; real Brandy CPU validation and deck compilation remain release gates.**

The former Architecture-capstone framing is retired. Week 16 is a joyful shared application/fun week after the Week 14 technical finale and Week 15 asynchronous wind-down.

Student teaching package:

`weeks/week-16/`

Canonical generated computational package:

`weeks/week-16/code/farkle_ml/`

Architecture-owned execution evidence layer:

`weeks/week-16/code/architecture_farkle/`

One-command runtime validator:

```text
python scripts/validate_week16_farkle.py
```

## Weekly Focus

**What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

Computer Architecture may naturally echo through the student's decisions, but no new Architecture theory, Machine Dossier layer, or checkpoint is introduced.

The software problem stays fixed through the canonical `Farkle_and_Machine_Learning` core. Students compare a small prescribed strategy/effort menu while the course-owned wrapper records preparation, operation, effectiveness, and actual execution context.

## Shared design doctrine

The full cross-course Architecture/Farkle vision lives in the canonical shared repository rather than being re-invented here:

- `planning/architecture-cost-effectiveness-lens.md`
- `planning/hardware-lane-and-receipt-map.md`

This course consumes the smallest student-facing slice of that doctrine.

## Required execution lane

The required path is explicitly:

- native Python;
- CPU;
- ordinary supported student computer;
- repeated timings;
- JSON/CSV evidence;
- no paid AI/API;
- no GPU/cloud/NRP/Kubernetes requirement.

A physically present GPU does not count as accelerator evidence. A future accelerator lane must separately prove actual dispatch, benchmark equivalence, and recorded backend identity.

## Fixed strategy menu

The canonical bounded menu is:

1. `bank_at_300` - cheap human threshold;
2. `learner:500` - small training/preparation budget;
3. `learner:2000` - larger training/preparation budget;
4. `rollout:10` - modest decision-time simulation;
5. `rollout:25` - larger decision-time simulation.

The usual comparison baseline is `bank_at_425`.

A normal student needs only **one execution lane and two fixed strategies**.

## Cost / effectiveness vocabulary

Keep currencies separate rather than hiding them in one score.

### Effectiveness

- win rate against the same fixed opponent/workload;
- raw wins/ties and balanced starts;
- deterministic outcome stability.

### Preparation

- training turns;
- preparation wall time;
- model/table size when applicable.

### Operation

- evaluation wall time;
- games per second;
- repeated timing median/min/max.

### Machine / environment

- actual host and CPU;
- logical CPU count;
- execution mode;
- declared hardware lane;
- accelerator-used flag.

Training cost matters. A learned strategy may pay up front and play cheaply. A rollout strategy may pay little up front and spend compute at every decision. A simple threshold may be nearly free and remain rational under some objectives.

## Monday - Think / Frame

**AI Fluency Lens 16: Reflect and Improve.**

Students separate algorithmic effort from execution substrate, name one objective, choose two fixed strategies, and predict:

- effectiveness;
- preparation cost;
- operating cost;
- whether the extra computation will be worth paying for.

No new Architecture mechanism is introduced.

## Wednesday - Investigate / Break / Measure

**Professional Minds: _Generative AI Design Patterns_ reflection.**

Students run the fixed shared workload through the validated CPU path. The Architecture wrapper repeats timings, records host facts, preserves shared effectiveness evidence, and emits machine-readable receipts.

The student experiment grammar is:

> **Predict -> Hold the workload still -> Run -> Measure -> Compare -> Explain -> Revise**

The fixed workload prevents students from winning by rewriting the game or weakening correctness.

## Friday - Explain / Defend

**Professional Minds: semester reflection - What kind of professional do I want to become?**

Students make one bounded architectural judgment:

> **For this Farkle workload, on this execution lane, under this objective, I would choose this architecture because the additional effectiveness is or is not worth the additional cost.**

The receipt requires:

- bounded claim;
- concrete effectiveness/cost/context evidence;
- one prior Architecture concept;
- one limitation;
- defend/revise/qualify/refuse after evidence;
- AI/tool use plus independent verification when relevant.

## Machine Dossier role

**NO CHANGE.**

The technical Machine Dossier froze in Week 14. Students may consult prior evidence or concepts, but Week 16 does not add a new dossier layer.

## Optional Stack Showcase / hardware zoo

After the required CPU path is GREEN, the instructor may execute the same receipt contract on additional verified hardware lanes. Potential lanes include Brandy, Maise, April, a GTX 1080-class desktop, and later NRP professional-GPU hardware.

Those are enrichment/research receipts, not a student grading requirement. Cross-machine claims must keep the workload contract fixed and record the actual executing hardware/backend.

## Competition equity

Expensive hardware must not determine the student's grading ceiling. The required student work can be completed on one ordinary CPU lane.

Playful categories such as Top 500, Green 500, Bottom Dollar, or Training Miser belong to optional showcase surfaces only. They do not create new grading categories.

## Infrastructure scope fence

Do **not** turn Week 16 into a production tournament platform, generalized Kubernetes submission system, persistent web service, or semester-long infrastructure project.

The course is done when the learning game works and students can make a defensible cost-versus-effectiveness judgment.

## Release gates

Before the package is marked GREEN on `main`:

1. run `python scripts/validate_week16_farkle.py` on a real Brandy checkout and retain the GREEN raw receipt;
2. compile `weeks/week-16/monday.tex` with the course LaTeX toolchain and record the result in `weeks/week-16/_validation.md`;
3. confirm no hidden GPU/private-host/paid-tool dependency entered the required path;
4. keep larger hardware-lane experiments explicitly optional.
