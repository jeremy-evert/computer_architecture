# Instructor plan - Week 3

## Monday recording spine

1. Open with "it worked on my machine."
2. Ask what belongs to the experiment besides source code.
3. Build the reproducibility contract on screen.
4. Explain why containers help without claiming they freeze hardware/timing.
5. Show the repository-local wrapper design and why no mandatory pip install is a feature.
6. End with the Wednesday prediction.

## Wednesday canonical run

```bash
./lab/bin/archlab doctor
./lab/bin/archprobe --out-dir /tmp/arch-week03-a
./lab/bin/archprobe --out-dir /tmp/arch-week03-b
```

Expected shape: core environment facts repeat; timestamps differ; evidence scope remains explicit.

## Friday Stack Showcase

If useful, run the same probe on two instructor-owned machines/environments and show which fields are portable versus substrate-specific. Do not imply students need either machine.
