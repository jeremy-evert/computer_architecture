[CmdletBinding()]
param(
    [switch]$KeepTestEnvironment
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$AgentDir = Join-Path $Root 'agents'
$RunStamp = Get-Date -Format 'yyyy-MM-dd_HH-mm-ss'
$RunDir = Join-Path $Root (Join-Path 'reports' $RunStamp)
New-Item -ItemType Directory -Path $RunDir -Force | Out-Null

$transcript = Join-Path $RunDir 'mother-script-transcript.txt'
Start-Transcript -Path $transcript -Force | Out-Null
try {
    Write-Host "Computer Architecture readiness run: $RunStamp" -ForegroundColor Cyan
    Write-Host "Root: $Root"
    Write-Host "Reports: $RunDir"

    $agents = @(Get-ChildItem -Path $AgentDir -Filter '[0-9][0-9]-*.ps1' -File | Sort-Object Name)
    if ($agents.Count -eq 0) { throw "No agent scripts were found in $AgentDir" }

    $results = @()
    foreach ($agent in $agents) {
        Write-Host "`n==> Running $($agent.Name)" -ForegroundColor Yellow
        try {
            $result = & $agent.FullName -RunDir $RunDir -KeepTestEnvironment:$KeepTestEnvironment
            if ($null -eq $result) { throw "Agent returned no result object." }
            $results += $result
        }
        catch {
            $results += [pscustomobject]@{
                Agent = $agent.Name
                Status = 'FAIL'
                Summary = $_.Exception.Message
                Report = $null
            }
        }
    }

    $summaryJson = Join-Path $RunDir 'run-summary.json'
    $summaryText = Join-Path $RunDir 'run-summary.txt'
    $results | ConvertTo-Json -Depth 8 | Set-Content -Path $summaryJson -Encoding UTF8
    $results | Format-Table -AutoSize | Out-String -Width 240 | Set-Content -Path $summaryText -Encoding UTF8
    $results | Format-Table -AutoSize

    $failed = @($results | Where-Object Status -ne 'PASS')
    Write-Host "Durable report: $summaryText" -ForegroundColor Cyan
    if ($failed.Count -gt 0) {
        Write-Host "$($failed.Count) agent(s) did not pass. Read the report above." -ForegroundColor Red
        exit 1
    }
    Write-Host 'All readiness agents passed.' -ForegroundColor Green
    exit 0
}
finally {
    try { Stop-Transcript | Out-Null } catch { }
}
