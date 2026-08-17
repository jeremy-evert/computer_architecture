# Wednesday - Produce a reproducibility receipt

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

```bash
rm -rf /tmp/arch-week03-a /tmp/arch-week03-b
./lab/bin/archprobe --out-dir /tmp/arch-week03-a
./lab/bin/archprobe --out-dir /tmp/arch-week03-b
```

Inspect the friendly summaries and structured receipts.

```bash
cat /tmp/arch-week03-a/machine.txt
cat /tmp/arch-week03-b/machine.txt
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

## Optional container enrichment

If you already have a supported Docker/Podman environment, you may explore the course `Containerfile`. This is enrichment only. Do not install or reconfigure a machine merely to satisfy Week 3.
