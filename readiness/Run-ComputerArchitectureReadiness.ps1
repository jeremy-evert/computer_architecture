[CmdletBinding()]
param([switch]$KeepTestEnvironment)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$AgentDir = Join-Path $Root 'agents'
$Stamp = Get-Date -Format 'yyyy-MM-dd_HH-mm-ss'
$RawRunDir = Join-Path (Join-Path $Root 'raw') $Stamp
$ReportRunDir = Join-Path (Join-Path $Root 'Reports') $Stamp
New-Item -ItemType Directory -Force -Path $RawRunDir,$ReportRunDir | Out-Null
$Transcript = Join-Path $RawRunDir '00-parent-transcript.txt'
$ExitCode = 1
Start-Transcript -Path $Transcript -Force | Out-Null
try {
    Write-Host "Computer Architecture readiness run: $Stamp" -ForegroundColor Cyan
    Write-Host "Raw evidence: $RawRunDir"
    Write-Host "Reports:      $ReportRunDir"
    $Agents = @(Get-ChildItem -LiteralPath $AgentDir -File | Where-Object Name -Match '^\d{2}-.*\.ps1$' | Sort-Object Name)
    if ($Agents.Count -eq 0) { throw "No numbered agents found in $AgentDir" }
    Write-Host "`nDiscovered agents:" -ForegroundColor Green
    $Agents | ForEach-Object { Write-Host "  $($_.Name)" }
    $Results = foreach ($Agent in $Agents) {
        Write-Host "`n==> Running $($Agent.Name)" -ForegroundColor Yellow
        try {
            $Answer = & $Agent.FullName -RawRunDir $RawRunDir -ReportRunDir $ReportRunDir -KeepTestEnvironment:$KeepTestEnvironment
            if ($null -eq $Answer) { throw 'Agent returned no result object.' }
            $Answer
        } catch {
            [pscustomobject]@{Agent=$Agent.Name;Status='FAIL';Summary=$_.Exception.Message;Report=$null}
        }
    }
    $Json = Join-Path $ReportRunDir 'run-summary.json'
    $Text = Join-Path $ReportRunDir 'run-summary.txt'
    $Results | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $Json -Encoding UTF8
    $Results | Format-List | Out-String -Width 240 | Set-Content -LiteralPath $Text -Encoding UTF8
    Write-Host "`nResults:" -ForegroundColor Cyan
    $Results | Format-Table -AutoSize
    Write-Host "`nReadable report: $Text"
    Write-Host "Raw transcript:  $Transcript"
    if (@($Results | Where-Object Status -ne 'PASS').Count -eq 0) {$ExitCode=0;Write-Host 'All agents passed.' -ForegroundColor Green}
    else {Write-Host 'One or more agents did not pass.' -ForegroundColor Red}
} catch {
    ($_ | Out-String) | Set-Content -LiteralPath (Join-Path $ReportRunDir 'fatal-error.txt') -Encoding UTF8
    Write-Host "Fatal parent error: $($_.Exception.Message)" -ForegroundColor Red
} finally {try {Stop-Transcript | Out-Null} catch {}}
exit $ExitCode
