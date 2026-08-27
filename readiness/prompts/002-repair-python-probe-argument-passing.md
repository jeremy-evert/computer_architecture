# Prompt 002: Repair Python Probe Argument Passing

## Current State

Prompt 001 established the initial Computer Architecture readiness framework.

The repository now contains:

- prompts/
- agents/
- raw/
- Reports/

The readiness framework successfully:

1. launched the parent PowerShell script
2. discovered numbered agents
3. launched Agent 01
4. created durable evidence
5. created durable reports
6. committed and pushed those artifacts to Git

The readiness framework did NOT successfully test Python.

The failure occurred before Python capability validation began.

---

## Evidence

### Raw command

Agent 01 generated:

01-python-probe-1.command.txt

containing:

py.exe

### Transcript

The run transcript recorded:

Cannot validate argument on parameter 'ArgumentList'.
The argument is null, empty, or an element of the argument
collection contains a null value.

Agent 01 therefore failed during process-launch preparation.

---

## Interpretation

This failure indicates a readiness-harness defect.

Evidence does not support any conclusion regarding:

- Python availability
- virtual environment support
- pip functionality
- package installation
- matplotlib functionality

None of those stages were reached.

The repository therefore remains in UNKNOWN state regarding Python readiness.

---

## Goal

Create a replacement version of:

agents/01-Test-PythonCapability.ps1

that:

1. correctly constructs process argument lists
2. records command lines
3. records stdout
4. records stderr
5. records exit codes
6. successfully probes for Python

---

## Success Criteria

Agent 01 successfully completes:

[1/6] Locate Python 3

and records evidence showing one of:

A. Python was located

or

B. Python was not found

without crashing.

The next version must not fail because of a PowerShell
ArgumentList construction error.

---

## Deliverable

Provide only:

1. replacement files
2. newly created files

Do not provide conversational analysis.

The repository is operating under
"evidence first, interpretation second."

Raw evidence belongs in:

raw/

Interpretation belongs in:

Reports/

Source belongs in:

agents/

Intent belongs in:

prompts/