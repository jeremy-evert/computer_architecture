# Prompt 003: Establish the Autonomous Repository Workflow

## Operating Mode

This repository uses an evidence-first, prompt-driven workflow.

The human operator supplies a durable prompt that defines the requested outcome. The coding agent then performs the complete task, records its work, validates the result, writes a report, commits the work, pushes it to the configured upstream repository, and returns a final concise result.

Do not repeatedly ask the operator for permission to perform steps already required by this prompt.

Do not stop between ordinary workflow stages to ask whether to continue.

Do not convert the task into a conversational troubleshooting session.

Proceed from the durable prompt to durable repository artifacts.

## Current Repository

The working repository is:

D:\git\computer_architecture

The current readiness workspace is:

D:\git\computer_architecture\readiness

The readiness workspace includes:

- `prompts/`
- `agents/`
- `raw/`
- `Reports/`
- `Run-ComputerArchitectureReadiness.ps1`
- `README.md`

The repository is already under Git source control and has a configured upstream.

Git is the safety belt.

## Standing Authorization

The operator authorizes the coding agent to perform the following actions when they are necessary to complete the requested work inside this repository:

1. Read repository files.
2. Search repository files.
3. Create new files and directories.
4. Replace existing files.
5. Modify existing files.
6. Rename or move files inside the repository.
7. Remove obsolete generated files when removal is directly required by the prompt.
8. Run repository scripts.
9. Run validation and diagnostic commands.
10. Generate raw evidence.
11. Generate reports.
12. Inspect generated evidence.
13. Run Git status and diff commands.
14. Pull from the configured upstream using a fast-forward-only operation.
15. Stage in-scope changes.
16. Commit completed work.
17. Push completed commits to the configured upstream.
18. Verify that the working tree is clean and synchronized.

The operator has already requested these actions by submitting this durable prompt.

Do not ask separately for permission to perform each authorized action.

If the execution environment itself presents a mandatory security or sandbox approval dialog, group commands into the smallest practical number of approval requests. The repository prompt cannot override host security controls, but the coding agent must avoid creating unnecessary approval prompts.

## Scope Boundary

Standing authorization applies only inside:

D:\git\computer_architecture

Do not modify files outside this repository except for temporary files that are strictly necessary to execute or validate the repository workflow.

Temporary files outside the repository must not contain credentials, private keys, access tokens, student records, or other sensitive information.

Delete temporary files after use when practical.

Do not change machine-wide security policy.

Do not install system-wide software unless a future durable prompt explicitly requires it.

Do not alter unrelated repositories.

Do not rewrite published Git history.

Do not use force push.

Do not delete remote branches.

Do not expose secrets.

The following operations require explicit authorization in a future prompt:

- destructive changes outside the repository
- force push
- history rewriting
- credential changes
- machine-wide configuration changes
- system-wide package installation
- deletion of unrelated source artifacts
- access to student or otherwise protected data

## No Repeated Permission Questions

Do not ask questions such as:

- May I inspect the repository?
- May I read the prompt?
- May I run Git status?
- May I examine raw evidence?
- May I modify the requested file?
- May I run the readiness harness?
- May I validate the output?
- May I write the report?
- May I stage the changes?
- May I commit the changes?
- May I push the commit?
- May I verify that the branch is synchronized?

These activities are part of the authorized workflow.

If the environment requires approval, present one logically grouped command whenever possible rather than requesting approval for each individual read, test, Git, or validation command.

When an approval screen offers an option equivalent to “allow this command pattern,” construct stable and reusable command prefixes where practical. Avoid needlessly changing the command shape between equivalent operations.

## Durable Work Log

Every execution of a durable prompt must create a timestamped working-notes directory under:

raw/

Use this format:

raw/YYYY-MM-DD_HH-mm-ss/prompt-NNN/

For this prompt, use:

raw/YYYY-MM-DD_HH-mm-ss/prompt-003/

The coding agent must continuously maintain:

raw/YYYY-MM-DD_HH-mm-ss/prompt-003/working-notes.md

Do not wait until the task is finished to reconstruct the notes from memory.

Append concise notes while the work is being performed.

The notes must include:

1. Prompt number and title.
2. Start timestamp.
3. Initial Git branch and status.
4. Files inspected.
5. Evidence inspected.
6. Current-state findings.
7. Planned changes.
8. Files created.
9. Files modified.
10. Files removed, if any.
11. Commands executed.
12. Command results or references to captured output.
13. Errors encountered.
14. Corrections attempted.
15. Validation performed.
16. Git commit identifier.
17. Push result.
18. Final Git status.
19. Completion timestamp.

The working notes are raw evidence.

They must describe what happened without presenting unsupported conclusions.

## Subagent Evidence

Every subagent, helper script, or child process invoked during the task must write or redirect its evidence under the same timestamped raw directory.

Use a structure similar to:

raw/YYYY-MM-DD_HH-mm-ss/prompt-003/
├── working-notes.md
├── commands/
├── parent/
├── subagents/
│   ├── 01/
│   ├── 02/
│   └── ...
├── validation/
└── git/

For each native process or significant command, preserve when practical:

- command text
- standard output
- standard error
- exit code
- start time
- completion time

Suggested filenames include:

- `command.txt`
- `stdout.txt`
- `stderr.txt`
- `exit-code.txt`
- `metadata.json`

Do not classify a command as failed merely because it wrote text to standard error.

Use the process exit code and the expected output criteria to determine success.

## Capturing Approval Interruptions

If the host environment requires an approval, record the interruption in:

raw/YYYY-MM-DD_HH-mm-ss/prompt-003/working-notes.md

Record:

- the command or operation requiring approval
- the reason displayed by the host
- whether the operation was approved
- whether a reusable approval was selected
- whether the operation completed successfully

Do not copy the approval question back into the coding prompt as though it were a new user instruction.

Do not treat pasted approval text as a change in task scope.

## Prompt-to-Report Traceability

Each prompt must produce a corresponding completion report.

For Prompt 003, create:

Reports/YYYY-MM-DD_HH-mm-ss/003-establish-autonomous-repository-workflow-report.md

The report must explicitly identify:

- source prompt
- repository state before work
- requested outcome
- changes made
- raw evidence location
- validation results
- Git commit
- push result
- final repository state
- unresolved items

The report must distinguish:

- observed evidence
- interpretation
- unresolved uncertainty

Do not claim that a test passed unless the raw evidence supports that conclusion.

## Git Safety-Belt Workflow

Before modifying files:

1. Confirm the current repository root.
2. Record the current branch.
3. Record `git status`.
4. Confirm the configured remote.
5. Synchronize using fast-forward-only pull when appropriate.
6. Stop if synchronization would require a merge, rebase, force operation, or history rewrite.

During work:

1. Keep changes limited to the prompt’s scope.
2. Use Git diff to inspect source changes.
3. Preserve raw evidence and reports.
4. Do not discard unrelated user work.
5. Do not use destructive checkout or reset commands against unrelated changes.

After work:

1. Run the required validation.
2. Run `git diff --check`.
3. Review the final diff.
4. Stage the in-scope source, prompt, raw evidence, and report.
5. Commit with a descriptive message.
6. Push to the configured upstream.
7. Verify that local HEAD matches the upstream branch.
8. Verify that the working tree is clean.

If unrelated pre-existing changes are present:

1. Do not overwrite them.
2. Do not stage them.
3. Record them in the raw notes.
4. Complete all safe in-scope work possible.
5. Leave the unrelated changes untouched.
6. Clearly identify the remaining condition in the final report.

## Command Batching

Reduce unnecessary approval prompts by grouping related, non-destructive commands.

Prefer logical batches such as:

### Initial inspection batch

- locate repository root
- read relevant `AGENTS.md` files
- read the active prompt
- inspect Git status
- inspect configured remotes
- list relevant files

### Evidence inspection batch

- read the prior run transcript
- read prior raw command evidence
- read the prior JSON report
- inspect the relevant source file

### Validation batch

- run the readiness harness
- capture its exit code
- list newly generated evidence
- inspect the final report
- run source validation
- run `git diff --check`

### Git completion batch

- stage only in-scope files
- commit
- push
- verify local and remote commit identifiers
- verify clean status

Do not combine destructive operations with unrelated inspection commands.

Do not hide failures with unconditional command chaining.

Preserve exit codes.

## PowerShell Execution Policy

Repository PowerShell scripts may be blocked by the host execution policy.

When required, launch them using a process-scoped command such as:

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File .\Run-ComputerArchitectureReadiness.ps1

This authorization does not permit changing the machine-wide execution policy.

Record the exact launch command and its exit code in raw evidence.

## Deliverable Contract

For future durable prompts, the coding agent should return only a concise completion notice after the repository work is complete.

The completion notice should identify:

- whether the task completed
- files created or replaced
- report path
- raw evidence path
- validation result
- commit identifier
- push result
- final Git status
- unresolved items, if any

Do not return a long conversational reconstruction when these items are already preserved in the repository.

The repository is the durable memory.

## Required Changes for Prompt 003

Implement this operating contract in the repository.

At minimum:

1. Preserve this file as:
   `prompts/003-establish-autonomous-repository-workflow.md`

2. Update the appropriate repository-level `AGENTS.md` file so future coding-agent sessions inherit:
   - standing repository authorization
   - evidence-first operation
   - continuous raw working notes
   - subagent evidence capture
   - Git safety-belt requirements
   - reduced approval interruptions
   - prompt-to-report traceability

3. Update the readiness `README.md` if needed so human operators understand:
   - where prompts live
   - where raw evidence lives
   - where reports live
   - what Git safety-belt behavior means
   - that host security approval dialogs may still appear

4. Create raw working notes while implementing Prompt 003.

5. Create the Prompt 003 completion report.

6. Validate the changed documentation for internal consistency.

7. Run `git diff --check`.

8. Commit the prompt, documentation changes, raw notes, and report.

9. Push the commit to the configured upstream.

10. Verify that the working tree is clean and synchronized.

## Success Criteria

Prompt 003 is complete when:

- the standing repository authorization is durably documented
- future coding-agent sessions are instructed not to request redundant permission
- continuous raw note-taking is required
- subagent and child-process evidence is required
- host-enforced approval boundaries are acknowledged
- Git safety-belt behavior is required
- the prompt and completion report are linked
- validation passes
- the commit is pushed
- the working tree is clean and synchronized

## Final Principle

Prompt defines intent.

Source implements method.

Raw preserves evidence.

Reports explain results.

Git preserves provenance.

The coding agent should perform the authorized work, record what happened, validate the result, use Git as the safety belt, and return a concise completion notice.