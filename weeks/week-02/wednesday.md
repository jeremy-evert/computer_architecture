# Wednesday - Verify one machine claim

Today you will create the first **AI investigation receipt** of the semester.

## 1. Choose a claim

Use the claim you predicted Monday, an AI-generated claim, or this no-account fallback:

> The machine architecture reported by Python and the operating system will always describe the physical processor in exactly the same way.

Keep the claim small enough to test today.

## 2. Gather machine evidence

Use Python's standard library so the required path stays portable:

```bash
python3 - <<'PY'
import os, platform, sys
print('python:', sys.version.split()[0])
print('platform.system:', platform.system())
print('platform.machine:', platform.machine())
print('platform.processor:', platform.processor() or '<not reported>')
print('logical_cpus_visible:', os.cpu_count())
PY
```

If available on your system, add one independent operating-system observation such as:

```bash
uname -a
uname -m
```

Windows students may use PowerShell/system-information output instead. The point is the evidence, not a specific shell command.

## 3. Separate observation from interpretation

Record:

- **proposal:** what was claimed;
- **observation:** the relevant command output;
- **evidence source:** machine command, official documentation, or specification;
- **interpretation:** what the observation means;
- **limitation:** what the evidence does not establish.

A container, VM, compatibility layer, remote shell, or subsystem may report a useful execution view without describing every fact about the physical host. That is not an error. It is context.

## 4. Submit the investigation receipt

Your receipt should contain:

1. bounded question/claim;
2. relevant context;
3. AI/tool/fallback proposal;
4. evidence commands and relevant output;
5. conclusion;
6. one revision after verification.

Do not submit a raw AI transcript or an unannotated screenshot dump.
