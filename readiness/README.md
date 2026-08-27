# Computer Architecture Readiness

## Structure

- `Run-ComputerArchitectureReadiness.ps1`: parent orchestrator
- `agents/`: numbered PowerShell checks
- `prompts/`: indexed, durable statements of intent for coding-agent work
- `raw/`: timestamped working notes, commands, stdout, stderr, transcripts, and test artifacts
- `Reports/`: timestamped completion reports and machine-readable conclusions

## Durable prompt workflow

Submit work by preserving the request as an indexed Markdown file in `prompts/`. A prompt-driven run proceeds through inspection, implementation, validation, reporting, commit, push, and final synchronization without requiring separate permission at each ordinary stage.

Each run creates continuous working notes at `raw/YYYY-MM-DD_HH-mm-ss/prompt-NNN/working-notes.md`. Evidence from significant commands, helper processes, or subagents belongs beneath that same run directory. The corresponding human-readable completion report is stored at `Reports/YYYY-MM-DD_HH-mm-ss/NNN-<prompt-name>-report.md` and links back to the source prompt and raw evidence.

Git is the workflow's safety belt. Before editing, the agent records the repository root, branch, status, remote, and fast-forward-only synchronization result. After validation, it reviews and stages only in-scope changes, commits them, pushes without rewriting history, and verifies that local HEAD matches the upstream branch and the working tree is clean. Unrelated pre-existing work is preserved and reported rather than overwritten or staged.

The durable prompt grants repository-scoped authorization for the ordinary workflow, but it does not bypass host security. Sandbox or security approval dialogs may still appear when an operation needs access the execution environment has not already granted. The agent groups such requests when practical and records the interruption and outcome in the run notes.

## Run

```powershell
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File .\Run-ComputerArchitectureReadiness.ps1
```

The bypass applies only to that new PowerShell process. The harness judges native commands by exit code and preserves stderr separately. This prevents an informational matplotlib font-cache message from becoming a false failure.
