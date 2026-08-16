# Measurement hygiene

The Architecture Laboratory is designed to reveal **shapes and sensitivities**, not to crown the fastest laptop.

## Before a run

1. State the question and prediction.
2. Name the variable you intend to perturb.
3. Keep the workload and other conditions as stable as practical.
4. Run `archlab doctor` and `archprobe` so the receipt records the environment you actually observed.

## During a run

- Prefer repeated or sufficiently long measurements over microsecond theater.
- Expect operating-system scheduling, CPU frequency changes, thermal behavior, virtualization, background work, compiler optimization, caches, TLBs, and prefetchers to affect results.
- Never infer a hardware mechanism solely because one number got bigger.
- When the compiler is part of the hypothesis, save compiler/disassembly evidence too.

## After a run

Use the course grammar:

**predict -> perturb -> run -> measure -> visualize -> explain -> revise**

A strong explanation says:

- what changed;
- which part of the figure/table matters;
- which architecture mechanism plausibly explains the change;
- what competing explanation or limitation still exists;
- what belief or design decision should be revised.

## Cross-machine rule

Raw benchmark scores are not directly comparable across arbitrary machines unless the experiment explicitly controls the relevant differences. Course grading is based on reasoning/evidence, not whose hardware wins.

## Fallback rule

If a machine cannot expose a clean phenomenon after reasonable troubleshooting, use the supplied fallback dataset. Mark it as course-provided evidence and perform the same prediction, visualization, explanation, and revision work. A fallback path does not lower the grading ceiling.
