# Wednesday - Investigate / Break / Measure: Make the Machine Pay the Bill

Use the fixed shared workload. Do not rewrite Farkle to make your favorite strategy look good.

The experiment grammar is:

> **Predict -> Hold the workload still -> Run -> Measure -> Compare -> Explain -> Revise**

## Controlled variable

Your main software variable is the strategy or effort level.

Choose two from:

- `bank_at_300`
- `learner:500`
- `learner:2000`
- `rollout:10`
- `rollout:25`

Keep these fixed between the runs you compare:

- game rules;
- target score;
- game count;
- deterministic seed;
- host/execution lane.

## Step 1 - Verify the execution lane

From the repository root:

```bash
cd weeks/week-16
PYTHONPATH=code python3 -m architecture_farkle.cli host
```

On Windows PowerShell, `python` may be your launcher instead of `python3`.

The required path should report:

```text
execution_mode: native-python-cpu
accelerator_used: false
```

A GPU may physically exist in the machine. This command does not use it.

## Step 2 - Run your declared comparison

Example:

```bash
PYTHONPATH=code python3 -m architecture_farkle.cli compare \
  --strategy-a learner:2000 \
  --strategy-b bank_at_425 \
  --games 500 \
  --seed 6262 \
  --repeats 3 \
  --lane-label student-cpu \
  --out-dir artifacts/my-comparison
```

If your first chosen strategy is different, replace only `--strategy-a`.

If you want to compare two members of the fixed menu directly, use the second one as `--strategy-b` while preserving the same game count, seed, repeats, and lane.

## Step 3 - Inspect the receipt, not just the terminal

The run writes:

```text
artifacts/my-comparison/architecture_farkle_receipt.json
artifacts/my-comparison/architecture_farkle_trials.csv
```

Find evidence for all four currencies.

### Effectiveness

- `win_rate_a`
- `wins_a`, `wins_b`, `ties`
- `starts_a`, `starts_b`

### Preparation

- `preparation_seconds_a`
- `training_turns_a`
- `model_size_bytes_a`

### Operation

- `evaluation_seconds`
- `games_per_second`
- summary median/min/max throughput

### Machine / environment

- hostname;
- CPU model;
- logical CPU count;
- execution mode;
- lane label;
- accelerator-used flag.

## Step 4 - Ask the Architecture question

Do not report only:

> Strategy A won more.

Instead ask:

- How much more effective was it?
- Where did it pay its cost: before play or during play?
- How large was the throughput difference?
- How noisy were the repeated timings?
- Under my objective, did that extra work purchase enough improvement?

## Optional fixed suite

The instructor may run the complete bounded suite:

```bash
PYTHONPATH=code python3 -m architecture_farkle.cli suite \
  --games 100 \
  --seed 6262 \
  --repeats 3 \
  --lane-label local-cpu \
  --out-dir artifacts/fixed-suite
```

The suite is useful for a class discussion or Stack Showcase. You are not required to optimize every strategy.

## What this experiment does not prove

A local CPU timing does not by itself establish:

- energy consumption;
- purchase price;
- GPU performance;
- cloud cost;
- compiler speedup;
- container overhead;
- performance on another student's machine.

Those would require additional controlled evidence.

## Before Friday

Write down one sentence that begins:

> **The extra computation bought...**

Then decide whether what it bought was worth paying for under the objective you named Monday.
