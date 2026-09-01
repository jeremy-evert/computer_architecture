# Wednesday - Produce a reproducibility receipt

Before you begin: this week uses the shared Computing Commons containers and
repeatability lesson. If you have not already worked through it, start at
`computing_commons/curriculum/containers-and-repeatable-environments.md`
(deck: `computing_commons/slides/week3_containers/week3_containers.pdf`).
This page applies that shared concept to Architecture's own question:
**where does the machine end?**

Use the validated repository-local laboratory path from the course repository root.

## 1. Check the laboratory

```bash
./lab/bin/archlab doctor
```

Record the tool/health information that matters.

`archlab doctor` checks the **full semester laboratory**, so it may report `FAIL` when a machine is missing later-semester capabilities such as plotting, RISC-V cross-compilation, PDF tooling, or a newer Python. That diagnostic is useful evidence; it does not by itself mean you failed Week 3.

If `archprobe` can run, continue with the live path below and record the doctor's missing capabilities as part of your environment context.

If the repository-local wrappers cannot run on your platform at all, use the course-provided fallback instead:

- `lab/fallback_data/week05-machine-reference.txt`
- `lab/fallback_data/week05-machine-reference.json`

Those files are a real privacy-safe course `archprobe` receipt captured in a container-visible environment. Identify them explicitly as **course-provided fallback evidence**, not a measurement of your own computer.

## 2. Capture the visible machine/environment

### Live path

Run the probe twice. Leave `--out-dir` off; the wrapper owns a fresh,
timestamped run directory for you each time (under `lab/runs/`, already
excluded from version control), so there is no OS-specific cleanup command
to remember or get wrong:

```bash
./lab/bin/archprobe
./lab/bin/archprobe
```

Each run prints the exact receipt path it wrote, for example
`lab/runs/20260901T144759Z_probe/machine.json`. Inspect the friendly
summaries and structured receipts it reports:

```bash
cat lab/runs/<first-run-timestamp>_probe/machine.txt
cat lab/runs/<second-run-timestamp>_probe/machine.txt
```

### Fallback path

Open the provided text and JSON receipt instead. Do not invent a second run.

Use the receipt schema and its scope/timestamp fields to identify:

- facts you would expect to remain stable across two runs in the same environment;
- facts that may legitimately change between runs, such as timestamps;
- facts that describe the **visible execution environment** but may not describe the entire physical host.

The reasoning ceiling is the same. The only difference is that you are reasoning from a clearly labeled course-provided receipt rather than claiming a local measurement you could not perform.

## 3. Compare the evidence

If you used the live path, compare the two receipts directly.

If you used the fallback path, distinguish **observed fields in the provided receipt** from **predictions about what should remain stable or change on a repeated run**. Do not present a predicted difference as measured evidence.

## 4. Reproducibility receipt

Submit:

1. source/version or course snapshot used;
2. exact commands, or the exact fallback file paths used;
3. execution environment/scope;
4. relevant tool facts;
5. evidence from both live runs, or the clearly labeled course-provided fallback receipt;
6. one stable observation or justified stability prediction;
7. one observed/expected difference, labeled accurately;
8. one limitation another person should know before comparing results.

## The container boundary question (required reasoning, optional execution)

You are required to reason about the container boundary this week, whether
or not you can run a container yourself. The shared Commons lesson
(linked above) already showed you a real, pinned, published container
(`ghcr.io/jeremy-evert/dsct-week3-latex`) and what it does and does not
control.

Using that example plus your own two `archprobe` receipts above, answer:
which of the facts your receipts recorded would most likely stay the same
if this course's own `lab/Containerfile` environment ("the Experimental
Chamber," see `lab/CONTRACT.md`) ran the probe instead of your native
machine ("the Observatory"), and which would most likely still depend on
the host underneath it? You do not need to have Docker/Podman installed to
answer this. Reason from the shared lesson's evidence plus your own
receipts.

If you already have a supported Podman/Docker environment, you may build
and run `lab/Containerfile` yourself and compare that receipt directly
instead of reasoning from the shared example alone:

```bash
cd lab
podman build -t archlab-chamber -f Containerfile .
cd ..
mkdir -p lab/runs/chamber
podman run --rm --userns=keep-id -v "$PWD/lab/runs/chamber:/work" -w /work archlab-chamber archprobe --out-dir /work
cat lab/runs/chamber/machine.txt
```

Note the build context is `lab/` itself, and `--out-dir /work` is required
so the receipt lands in your bind-mounted, host-visible folder instead of
being lost with the disposable container. This is optional execution, not
optional reasoning; do not install or reconfigure a machine merely to run
it, and do not treat container-visible evidence as physical-host truth
either way.
