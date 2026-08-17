# Wednesday - Produce a reproducibility receipt

Use the validated repository-local laboratory path from the course repository root.

## 1. Check the laboratory

```bash
./lab/bin/archlab doctor
```

Record the tool/health information that matters. If your platform cannot execute the wrapper, use the course-provided fallback receipt and identify it as fallback evidence.

## 2. Capture the visible machine/environment

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

## 3. Compare two runs

Identify:

- fields that should remain stable for this environment;
- fields that may legitimately change, such as timestamps;
- facts that describe the **visible execution environment** but may not describe the entire physical host.

## 4. Reproducibility receipt

Submit:

1. source/version or course snapshot used;
2. exact commands;
3. execution environment/scope;
4. relevant tool facts;
5. evidence from both runs;
6. one stable observation;
7. one expected difference;
8. one limitation another person should know before comparing results.

## Optional container enrichment

If you already have a supported Docker/Podman environment, you may explore the course `Containerfile`. This is enrichment only. Do not install or reconfigure a machine merely to satisfy Week 3.
