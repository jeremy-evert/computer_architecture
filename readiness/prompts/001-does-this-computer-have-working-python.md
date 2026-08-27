# Prompt 001: Does This Computer Have Working Python?

## Goal
Build a durable, inspectable Computer Architecture readiness harness. The parent runs numbered agents. Agent 01 must prove whether the computer can locate Python 3, create a virtual environment, use pip, install matplotlib, import it, and create a PNG.

## Evidence policy
- Store command lines, stdout, stderr, transcripts, and generated test artifacts in `raw/<timestamp>/`.
- Store readable and JSON summaries in `Reports/<timestamp>/`.
- Judge process success by exit code. Preserve stderr as evidence, but do not automatically call stderr a failure.
- Keep source, prompts, raw evidence, and reports in Git.
- Put the disposable virtual environment in the operating-system temporary directory, not the repository.

## Index
Prompt `001` corresponds to agent `01-Test-PythonCapability.ps1`.
