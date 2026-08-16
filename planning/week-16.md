# Week 16 - Farkle + Machine Learning (Nov 30-Dec 4)

## Status
Pinned shared application/fun week. The former Architecture-capstone framing is retired.

## Weekly Focus

**What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

Week 16 is Farkle + Machine Learning across the course family. It should be joyful, bounded, and accessible.

Computer Architecture may naturally echo through the student's decisions, but no new Architecture theory, Machine Dossier layer, or checkpoint is introduced.

The software problem should stay mostly fixed. Students compare a small prescribed set of Farkle/ML strategies or effort levels while changing meaningful execution choices underneath them.

Possible execution dimensions include compiler optimization, container versus bare metal, CPU worker count, optional GPU/accelerator use, and instructor-provided local/cloud/NRP hardware lanes.

The point is not to find one universally best machine. The point is to identify an objective and decide whether additional computational cost purchases enough additional effectiveness to be worth it.

## Cost / effectiveness vocabulary

Keep currencies separate rather than hiding them in one score.

Useful cost dimensions:

- model training/preparation time and compute;
- decision/runtime latency;
- games completed per fixed time window;
- normalized or observed compute/hardware cost;
- hardware/deployment class.

Useful effectiveness dimensions:

- win rate or another fixed tournament success measure;
- expected score/value if useful;
- stability across repeated fixed-seed tournament bundles.

Training cost matters. An expensive model may cost more to prepare but become cheap to use repeatedly. A simulation strategy may cost almost nothing to prepare but spend compute on every decision. A simple heuristic may be nearly free and still be the rational architecture under some objective.

## Monday - Think / Frame / Lecture

**AI Fluency Lens 16: Reflect and Improve.**

Enter the shared workload with a light prediction:

- Which fixed Farkle strategy do I expect to perform best for my objective?
- What do I think will be expensive?
- Which hardware/execution choice do I expect to matter?

No new Architecture lecture/mechanism.

## Wednesday - Investigate / Break / Measure

**Professional Minds: _Generative AI Design Patterns_ - What kind of professional do I want to become?**

Run/play with the shared Farkle + ML experience through the validated CPU-accessible path.

A normal student should need only:

- one hardware/execution lane; and
- two fixed software strategies or effort levels.

Possible instructor-controlled hardware lanes include a constrained Raspberry Pi-class system, a normal laptop-like host, a proper desktop, and a large NRP/instructor-compute lane.

The same fixed artifact may also be used for same-hardware round-robin or throughput comparisons when that materially improves the game.

If an Architecture idea appears naturally, use it to explain the result rather than turning the week into another profiling project.

## Friday - Explain / Defend / Stack Showcase

**Professional Minds: Semester Reflection - What kind of professional do I want to become?**

Make one short architectural judgment:

> For this workload, under this constraint, measured this way, I would choose this architecture because the additional effectiveness is or is not worth the additional cost.

Useful tournament/showcase categories may include:

- raw Farkle effectiveness;
- most valid games in a fixed time window (Top 500);
- effectiveness relative to compute/resource cost (Green 500);
- cheapest architecture reaching a declared effectiveness floor (Bottom Dollar);
- effectiveness relative to training/preparation cost;
- same-hardware round robin.

These are playful evidence surfaces, not separate grading requirements.

**Optional Stack Showcase:** Jeremy runs the fixed workload through interesting parts of the real stack/hardware/tools. This is enrichment only.

## Competition equity

Expensive hardware must not determine the student's grading ceiling.

Instructor-owned execution lanes can make hardware comparisons available without requiring students to own the machines. If ranking is used, performance and rarity/pioneer credit should be treated separately so a popular category is not automatically more valuable and a solo invalid entry is not automatically a winner.

Any submitted artifact executed on instructor infrastructure must pass correctness checks before performance counts.

## Infrastructure scope fence

A small script/runner/static board is welcome if it directly supports the Week 16 game.

Do **not** turn Week 16 into a production tournament platform, generalized Kubernetes submission system, persistent web service, or semester-long infrastructure project. Larger automation ideas belong in future infrastructure work and do not block the learning experience.

## Evidence this week

Shared Farkle + ML application/participation evidence plus a short prediction and Architecture-informed cost-versus-effectiveness judgment.

**No Architecture Checkpoint 4.**

## Machine Dossier role

No expansion. Students may refer to existing dossier evidence if useful.

## Online-delivery note

M/W/F are asynchronous anchors. CPU-only completion is mandatory; GPU/premium AI is optional enrichment.

## Open authoring notes

Keep this week fun. Freeze enough of the software stack to make hardware/execution comparisons meaningful. Do not resurrect the retired heavy Architecture capstone through profiling requirements, multi-layer dossier work, or tournament-infrastructure ambition.