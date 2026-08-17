# Monday - Think / Frame: More Compute Is Not a Verdict

## Machine question

> **What does it cost a machine to make a better Farkle decision, and when is that extra cost actually worth paying?**

Week 16 does not add a new Computer Architecture mechanism. Instead, it gives the ideas you already have one playful workload to argue about.

The shared program can make a Farkle decision in several ways. Some are cheap rules. Some spend time learning before play. Some spend computation while deciding whether to roll again.

The trap is to ask only:

> Which strategy wins more?

An architect asks a harder question:

> What did the additional effectiveness cost, and did that trade make sense for the objective I actually care about?

## Keep two axes separate

There are two different knobs in this experiment.

### Axis 1 - algorithmic effort

The software may spend more or less work making a decision.

- `bank_at_300`: tiny rule, almost no preparation;
- `learner:500`: modest preparation, cheap decisions after training;
- `learner:2000`: more preparation, still cheap decisions after training;
- `rollout:10`: little preparation, extra work at decision time;
- `rollout:25`: still more decision-time work.

### Axis 2 - execution substrate

The same fixed workload may later run on different machines or execution environments.

A faster CPU might run the exact same strategy faster. A future verified accelerator backend might change the shape again. But **algorithm choice and machine choice are not the same variable**.

If we change both at once and declare a winner, we no longer know what bought the improvement.

## Four currencies

### 1. Effectiveness

How well did the strategy play under the fixed benchmark?

### 2. Preparation cost

What did we spend before gameplay? Training turns and training wall time belong here.

### 3. Operating cost

What did we spend during gameplay? Evaluation time and games per second belong here.

### 4. Machine / environment cost

What machine actually executed the workload? What execution path was used? A GPU sitting idle in the chassis does not count as accelerator work.

## Amortization

Preparation and operation create an interesting architecture question.

Suppose one strategy takes longer to train but then plays cheaply. Another starts immediately but pays extra compute on every decision.

The correct choice may depend on how many games you expect to run.

That is an amortization question:

> When does the up-front cost become small enough, per game, that the more expensive preparation was worth it?

You do not need a new formula unit here. You need to recognize the shape of the tradeoff.

## Throughput is noisy

Wall-clock timing is not a law of nature. Background processes, CPU scheduling, temperature, and other machine activity can perturb one timing.

That is why the Architecture runner repeats each measurement and reports:

- median games per second;
- minimum observed games per second;
- maximum observed games per second.

One fast stopwatch reading is a story. Repeated evidence is a better story.

## Correctness comes first

A machine that completes more **wrong** games per second is not the champion.

The shared core preserves:

- balanced starters;
- raw wins and ties;
- raw turns and Farkles;
- deterministic seeds;
- a fixed game contract.

Architecture performance only matters after that computational contract holds.

## Your prediction

Before running Wednesday's experiment, choose **two** fixed strategies from the Week 16 menu.

Write four short predictions:

1. Which strategy will have the higher effectiveness for the fixed workload?
2. Which will cost more to prepare?
3. Which will cost more while playing?
4. Under one objective you name, do you expect the extra computation to be worth paying for?

Your objective might be:

- highest win rate;
- most valid games per second;
- lowest preparation burden;
- simplest adequate architecture;
- cheapest path to a declared effectiveness floor.

There is no requirement that one strategy win all of those.

## Scope

This model does **not** prove that one machine is universally better. It does not establish energy use, purchase price, GPU speedup, or cloud cost unless those things are actually measured later with a compatible receipt.

Wednesday's unresolved question is simple:

> **When the machine runs the fixed workload, what does the extra compute actually buy?**
