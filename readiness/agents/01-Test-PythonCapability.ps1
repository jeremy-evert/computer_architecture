[CmdletBinding()]
param(
 [Parameter(Mandatory=$true)][string]$RawRunDir,
 [Parameter(Mandatory=$true)][string]$ReportRunDir,
 [switch]$KeepTestEnvironment
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$Name='01-Test-PythonCapability'
$Raw=Join-Path $RawRunDir $Name
$Report=Join-Path $ReportRunDir "$Name.json"
New-Item -ItemType Directory -Force -Path $Raw | Out-Null
function Run-Recorded {
 param([string]$Exe,[string[]]$Args,[string]$Step)
 $Out=Join-Path $Raw "$Step.stdout.txt";$Err=Join-Path $Raw "$Step.stderr.txt"
 (($Exe+' '+($Args -join ' ')).Trim()) | Set-Content (Join-Path $Raw "$Step.command.txt") -Encoding UTF8
 $P=Start-Process -FilePath $Exe -ArgumentList $Args -Wait -PassThru -NoNewWindow -RedirectStandardOutput $Out -RedirectStandardError $Err
 [pscustomobject]@{ExitCode=$P.ExitCode;StdOut=if(Test-Path $Out){Get-Content $Out -Raw}else{''};StdErr=if(Test-Path $Err){Get-Content $Err -Raw}else{''}}
}
function Find-Python {
 $i=0
 foreach($C in @(@{E='py.exe';P=@('-3')},@{E='python.exe';P=@()},@{E='python3.exe';P=@()})){
  $i++
  if(Get-Command $C.E -ErrorAction SilentlyContinue){
   $X=Run-Recorded $C.E (@($C.P)+@('-c','import sys; print(sys.executable); print(sys.version)')) ("01-python-probe-$i")
   if($X.ExitCode -eq 0){return [pscustomobject]@{Exe=$C.E;Prefix=@($C.P);Probe=$X}}
  }
 }
 return $null
}
$D=[ordered]@{Agent=$Name;Started=(Get-Date).ToString('o');Status='FAIL';PythonLauncher=$null;PythonProbe=$null;VenvCreated=$false;PipAvailable=$false;PackageInstalled=$false;ImportWorked=$false;PlotCreated=$false;PackageVersion=$null;RawEvidenceDirectory=$Raw;TestEnvironmentPath=$null;Error=$null}
$Temp=Join-Path ([IO.Path]::GetTempPath()) ("computer-architecture-readiness-"+(Get-Date -Format yyyyMMddHHmmss)+"-$PID")
$D.TestEnvironmentPath=$Temp
try{
 Write-Host '  [1/6] Locate Python 3'
 $Py=Find-Python;if($null -eq $Py){throw 'No working Python 3 launcher found. See raw probes.'}
 $D.PythonLauncher=(($Py.Exe+' '+($Py.Prefix -join ' ')).Trim());$D.PythonProbe=$Py.Probe.StdOut.Trim()
 Write-Host '  [2/6] Create isolated virtual environment'
 $X=Run-Recorded $Py.Exe (@($Py.Prefix)+@('-m','venv',$Temp)) '02-create-venv';if($X.ExitCode -ne 0){throw "venv failed with exit code $($X.ExitCode)."};$D.VenvCreated=$true
 $VP=Join-Path $Temp 'Scripts\python.exe';if(-not(Test-Path $VP)){$VP=Join-Path $Temp 'bin/python'};if(-not(Test-Path $VP)){throw 'venv Python executable not found.'}
 Write-Host '  [3/6] Verify pip'
 $X=Run-Recorded $VP @('-m','pip','--version') '03-pip-version'
 if($X.ExitCode -ne 0){$null=Run-Recorded $VP @('-m','ensurepip','--upgrade') '03b-ensurepip';$X=Run-Recorded $VP @('-m','pip','--version') '03c-pip-retry'}
 if($X.ExitCode -ne 0){throw "pip failed with exit code $($X.ExitCode)."};$D.PipAvailable=$true
 Write-Host '  [4/6] Install matplotlib'
 $X=Run-Recorded $VP @('-m','pip','install','--disable-pip-version-check','matplotlib') '04-install-matplotlib';if($X.ExitCode -ne 0){throw "install failed with exit code $($X.ExitCode)."};$D.PackageInstalled=$true
 Write-Host '  [5/6] Import matplotlib and create PNG'
 $Png=Join-Path $Raw 'matplotlib-smoke-test.png';$Smoke=Join-Path $Raw 'matplotlib-smoke-test.py'
 $Code=@("import matplotlib","matplotlib.use('Agg')","import matplotlib.pyplot as plt","fig, ax = plt.subplots()","ax.plot([0,1,2,3],[0,1,4,9],marker='o')","ax.set(title='Computer Architecture Python Readiness',xlabel='Input',ylabel='Input squared')","fig.tight_layout()","fig.savefig(r'$Png')","print(matplotlib.__version__)")
 $Code | Set-Content -LiteralPath $Smoke -Encoding UTF8
 $X=Run-Recorded $VP @($Smoke) '05-matplotlib-smoke-test';if($X.ExitCode -ne 0){throw "smoke test failed with exit code $($X.ExitCode)."}
 $D.ImportWorked=$true;$D.PackageVersion=$X.StdOut.Trim();$D.PlotCreated=Test-Path $Png;if(-not $D.PlotCreated){throw 'No PNG was created.'}
 Write-Host '  [6/6] Record installed packages'
 $X=Run-Recorded $VP @('-m','pip','freeze') '06-pip-freeze';if($X.ExitCode -ne 0){throw "pip freeze failed with exit code $($X.ExitCode)."}
 $D.Status='PASS'
}catch{$D.Error=$_.Exception.Message}
finally{$D.Finished=(Get-Date).ToString('o');if((-not $KeepTestEnvironment)-and(Test-Path $Temp)){Remove-Item $Temp -Recurse -Force -ErrorAction SilentlyContinue;$D.TestEnvironmentPath='Removed after test; use -KeepTestEnvironment to retain.'};$D|ConvertTo-Json -Depth 10|Set-Content $Report -Encoding UTF8}
if($D.Status -eq 'PASS'){[pscustomobject]@{Agent=$Name;Status='PASS';Summary='Python, venv, pip, matplotlib install, import, and PNG creation worked.';Report=$Report}}
else{[pscustomobject]@{Agent=$Name;Status='FAIL';Summary=$D.Error;Report=$Report}}
