# AGENTS.md

## Shared Rules

Read and follow the shared instructions in `../AGENTS.md`.

## Repository Purpose

This repository contains the durable, Git-tracked source for COMSC-3013 Computer Architecture course planning and materials.

## Autonomous Prompt Workflow

Treat durable prompts in `readiness/prompts/` as authorized requests to complete the full repository workflow. Work evidence-first from the prompt to durable artifacts: inspect the current state, implement the requested outcome, validate it, preserve raw evidence, write the corresponding report, commit, push, and verify synchronization. Do not stop between ordinary stages or repeatedly ask for permission to perform actions the active prompt already requires.

Standing authorization covers necessary in-scope reading, searching, file creation and editing, directly required removal of obsolete generated files, repository scripts, validation, evidence and report generation, Git inspection, fast-forward-only pull, staging, commit, push, and final synchronization checks within `D:\git\computer_architecture`.

Standing authorization does not cover force pushes, history rewriting, deletion of remote branches, credentials or secrets, machine-wide configuration, system-wide installation, unrelated repositories or source artifacts, destructive changes outside this repository, or access to protected data. Never expose secrets. Stop when synchronization would require a merge, rebase, force operation, or history rewrite.

Host security and sandbox controls still apply. When the host requires approval, group related operations into the smallest practical number of approval requests, record the interruption and result, and continue after approval. The repository authorization cannot bypass a mandatory host control.

## Evidence and Traceability

For every durable prompt, create and continuously maintain:

`readiness/raw/YYYY-MM-DD_HH-mm-ss/prompt-NNN/working-notes.md`

Start the notes before implementation and update them as work proceeds rather than reconstructing them at the end. Record the prompt, timestamps, initial and final Git state, inspected files and evidence, findings, plan, created/modified/removed files, commands and outcomes, errors and corrections, validation, commit identifier, and push result.

Place evidence from every subagent, helper script, and significant child process under the same timestamped prompt directory. Preserve command text, stdout, stderr, exit code, and timing when practical. Judge native command success by its exit code and expected output, not merely by whether stderr contains text.

Create the matching completion report at:

`readiness/Reports/YYYY-MM-DD_HH-mm-ss/NNN-<prompt-name>-report.md`

The report must link the source prompt and raw evidence and identify the pre-work repository state, requested outcome, changes, validation, commit, push, final state, and unresolved items. Clearly distinguish observed evidence, interpretation, and unresolved uncertainty. Do not claim validation passed without supporting raw evidence.

## Git Safety-Belt Policy

Always treat Git like a safety belt and make sure the repository is caught up before leaving or stopping for the prompt. Check the configured upstream, commit completed in-scope work, push it when appropriate, and report any intentional exception.

Before editing, confirm the repository root, branch, status, remote, and fast-forward-only synchronization. Preserve unrelated user changes and never stage or overwrite them. During work, inspect diffs and keep changes scoped to the prompt. At completion, validate, run `git diff --check`, review the final diff, stage only in-scope files, commit descriptively, push without force, verify local HEAD equals the upstream branch, and verify the working tree is clean.

Do not commit virtual environments, credentials, caches, model files, or generated artifacts that repository policy excludes.

## Validation

Run relevant repository-native validation when it exists, plus `git diff --check` before committing.
