# Computer Architecture Readiness Harness

This is an auditable parent/subagent PowerShell harness for Windows.

## Files

- `Run-ComputerArchitectureReadiness.ps1`: mother script; runs every `agents/NN-*.ps1` in filename order.
- `agents/01-Test-PythonCapability.ps1`: detects Python 3, creates an isolated virtual environment, verifies pip, installs matplotlib, imports it, and creates a PNG plot.
- `reports/<timestamp>/`: durable JSON, text transcript, `pip freeze`, smoke-test source, and PNG evidence.

The test installs only inside a disposable virtual environment. By default that environment is removed after testing, while all reports remain. Use `-KeepTestEnvironment` if you want to inspect the virtual environment too.

## Run from PowerShell

```powershell
Set-Location "$HOME\Downloads\computer_architecture_readiness"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File ".\Run-ComputerArchitectureReadiness.ps1"
```

To retain the test environment:

```powershell
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File ".\Run-ComputerArchitectureReadiness.ps1" -KeepTestEnvironment
```

A passing run proves that this machine can launch Python 3, create a venv, use pip, reach a package index, install matplotlib into the isolated venv, import it, and execute a non-interactive plot.
