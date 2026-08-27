# Computer Architecture Readiness

## Structure
- `Run-ComputerArchitectureReadiness.ps1`: parent orchestrator
- `agents/`: numbered PowerShell checks
- `prompts/`: indexed statements of intent
- `raw/`: commands, stdout, stderr, transcripts, and test artifacts
- `Reports/`: readable and JSON conclusions

## Run
```powershell
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File .\Run-ComputerArchitectureReadiness.ps1
```

The bypass applies only to that new PowerShell process. The harness judges native commands by exit code and preserves stderr separately. This prevents an informational matplotlib font-cache message from becoming a false failure.
