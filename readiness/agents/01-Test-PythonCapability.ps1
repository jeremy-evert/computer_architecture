[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$RunDir,
    [switch]$KeepTestEnvironment
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$agentName = '01-Test-PythonCapability'
$agentReport = Join-Path $RunDir "$agentName.json"
$venvDir = Join-Path $RunDir 'python-test-venv'
$plotFile = Join-Path $RunDir 'matplotlib-smoke-test.png'

function Invoke-Captured {
    param([string]$Exe, [string[]]$Arguments)
    $output = & $Exe @Arguments 2>&1 | Out-String
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output.Trim() }
}

function Find-Python {
    $candidates = @(
        @{ Exe='py'; Prefix=@('-3') },
        @{ Exe='python'; Prefix=@() },
        @{ Exe='python3'; Prefix=@() }
    )
    foreach ($candidate in $candidates) {
        $cmd = Get-Command $candidate.Exe -ErrorAction SilentlyContinue
        if ($null -eq $cmd) { continue }
        $probeArgs = @($candidate.Prefix) + @('-c', 'import sys; print(sys.executable); print(sys.version.split()[0])')
        try {
            $probe = Invoke-Captured -Exe $candidate.Exe -Arguments $probeArgs
            if ($probe.ExitCode -eq 0) {
                return [pscustomobject]@{ Exe=$candidate.Exe; Prefix=@($candidate.Prefix); Probe=$probe.Output }
            }
        } catch { }
    }
    return $null
}

$started = Get-Date
$detail = [ordered]@{
    Agent = $agentName
    Started = $started.ToString('o')
    Status = 'FAIL'
    PythonLauncher = $null
    PythonProbe = $null
    VenvCreated = $false
    PipAvailable = $false
    PackageInstalled = $false
    ImportWorked = $false
    PlotCreated = $false
    InstalledPackage = 'matplotlib'
    PackageVersion = $null
    TestEnvironmentKept = [bool]$KeepTestEnvironment
    TestEnvironmentPath = $venvDir
    PlotPath = $plotFile
    Error = $null
}

try {
    $python = Find-Python
    if ($null -eq $python) { throw 'No working Python 3 launcher was found (tried py -3, python, and python3).' }
    $detail.PythonLauncher = (($python.Exe + ' ' + ($python.Prefix -join ' ')).Trim())
    $detail.PythonProbe = $python.Probe

    if (Test-Path $venvDir) { Remove-Item $venvDir -Recurse -Force }
    $venvArgs = @($python.Prefix) + @('-m', 'venv', $venvDir)
    $venv = Invoke-Captured -Exe $python.Exe -Arguments $venvArgs
    if ($venv.ExitCode -ne 0) { throw "Python exists, but venv creation failed: $($venv.Output)" }
    $detail.VenvCreated = $true

    $venvPython = Join-Path $venvDir 'Scripts\python.exe'
    if (-not (Test-Path $venvPython)) { $venvPython = Join-Path $venvDir 'bin/python' }
    if (-not (Test-Path $venvPython)) { throw 'The virtual environment was created, but its Python executable was not found.' }

    $pip = Invoke-Captured -Exe $venvPython -Arguments @('-m','pip','--version')
    if ($pip.ExitCode -ne 0) {
        $ensure = Invoke-Captured -Exe $venvPython -Arguments @('-m','ensurepip','--upgrade')
        $pip = Invoke-Captured -Exe $venvPython -Arguments @('-m','pip','--version')
    }
    if ($pip.ExitCode -ne 0) { throw "pip is unavailable inside the virtual environment: $($pip.Output)" }
    $detail.PipAvailable = $true

    $install = Invoke-Captured -Exe $venvPython -Arguments @('-m','pip','install','--disable-pip-version-check','matplotlib')
    if ($install.ExitCode -ne 0) { throw "pip could not install matplotlib. Network filtering or package access may be the cause: $($install.Output)" }
    $detail.PackageInstalled = $true

    $smoke = @'
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from pathlib import Path
out = Path(r"PLOT_PATH")
fig, ax = plt.subplots()
ax.plot([0, 1, 2, 3], [0, 1, 4, 9], marker="o")
ax.set(title="Computer Architecture Python Readiness", xlabel="Input", ylabel="Input squared")
fig.tight_layout()
fig.savefig(out)
print(matplotlib.__version__)
'@.Replace('PLOT_PATH', $plotFile.Replace('\','\\'))
    $smokeFile = Join-Path $RunDir 'matplotlib_smoke_test.py'
    Set-Content -Path $smokeFile -Value $smoke -Encoding UTF8
    $test = Invoke-Captured -Exe $venvPython -Arguments @($smokeFile)
    if ($test.ExitCode -ne 0) { throw "matplotlib installed, but the import/plot smoke test failed: $($test.Output)" }
    $detail.ImportWorked = $true
    $detail.PackageVersion = $test.Output.Split([Environment]::NewLine)[-1].Trim()
    $detail.PlotCreated = Test-Path $plotFile
    if (-not $detail.PlotCreated) { throw 'The smoke test ran but did not create its PNG artifact.' }

    $freeze = Invoke-Captured -Exe $venvPython -Arguments @('-m','pip','freeze')
    Set-Content -Path (Join-Path $RunDir 'python-test-pip-freeze.txt') -Value $freeze.Output -Encoding UTF8
    $detail.Status = 'PASS'
}
catch {
    $detail.Error = $_.Exception.Message
}
finally {
    $detail.Finished = (Get-Date).ToString('o')
    $detail | ConvertTo-Json -Depth 8 | Set-Content -Path $agentReport -Encoding UTF8
    if ((-not $KeepTestEnvironment) -and (Test-Path $venvDir)) {
        Remove-Item $venvDir -Recurse -Force -ErrorAction SilentlyContinue
        $detail.TestEnvironmentPath = 'Removed after test; rerun parent with -KeepTestEnvironment to retain it.'
        $detail | ConvertTo-Json -Depth 8 | Set-Content -Path $agentReport -Encoding UTF8
    }
}

if ($detail.Status -eq 'PASS') {
    [pscustomobject]@{ Agent=$agentName; Status='PASS'; Summary='Python, venv, pip, package installation, import, and plot creation all worked.'; Report=$agentReport }
} else {
    [pscustomobject]@{ Agent=$agentName; Status='FAIL'; Summary=$detail.Error; Report=$agentReport }
}
