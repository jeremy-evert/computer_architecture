<#
.SYNOPSIS
    Durable Computer Architecture container workbench for Week 03.

.DESCRIPTION
    Creates and manages a dedicated Podman image for Computer Architecture.
    The repository is bind-mounted at /workspace. Probe receipts and image
    identity evidence are written under evidence/container-architecture/.

    This tool is optional enrichment. It does not replace the course archprobe
    execution path and does not modify lab/Containerfile.

.EXAMPLE
    .\computer-architecture-container.ps1 -Mode Setup

.EXAMPLE
    .\computer-architecture-container.ps1 -Mode Probe

.EXAMPLE
    .\computer-architecture-container.ps1 -Mode Shell
#>

[CmdletBinding()]
param(
    [ValidateSet('Help', 'Setup', 'Build', 'Probe', 'Shell', 'Status', 'Clean', 'Push')]
    [string]$Mode = 'Help'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RepositoryRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ContainerDirectory = Join-Path $RepositoryRoot 'containers\computer-architecture'
$ContainerfilePath = Join-Path $ContainerDirectory 'Containerfile'
$ProbePath = Join-Path $ContainerDirectory 'arch-container-probe.sh'
$EvidenceDirectory = Join-Path $RepositoryRoot 'evidence\container-architecture'
$ImageName = 'localhost/computer-architecture-lab:week03'
$GhcrImageName = 'ghcr.io/jeremy-evert/computer-architecture-lab:week03'
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Write-Section([string]$Text) {
    Write-Host ''
    Write-Host "==> $Text" -ForegroundColor Cyan
}

function Assert-Podman {
    if (-not (Get-Command podman -ErrorAction SilentlyContinue)) {
        throw 'Podman is not available on PATH. Verify it with: podman --version'
    }

    & podman info *> $null
    if ($LASTEXITCODE -ne 0) {
        throw 'Podman is installed but not ready. Run: podman info'
    }
}

function Invoke-Podman([string[]]$Arguments, [string]$Description) {
    Write-Section $Description
    & podman @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Description failed with exit code $LASTEXITCODE."
    }
}

function Write-ContainerFiles {
    Write-Section 'Writing the dedicated Computer Architecture container files'

    New-Item -ItemType Directory -Force -Path $ContainerDirectory | Out-Null
    New-Item -ItemType Directory -Force -Path $EvidenceDirectory | Out-Null

    $containerfile = @'
FROM docker.io/library/debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        binutils \
        build-essential \
        ca-certificates \
        file \
        git \
        procps \
        python3 \
        strace \
        util-linux \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY arch-container-probe.sh /usr/local/bin/arch-container-probe
RUN chmod 0755 /usr/local/bin/arch-container-probe
CMD ["/bin/bash"]
'@

    $probe = @'
#!/usr/bin/env bash
set -Eeuo pipefail

timestamp="$(date -u +"%Y-%m-%dT%H-%M-%SZ")"
evidence_directory="/workspace/evidence/container-architecture"
report="${evidence_directory}/architecture-container-${timestamp}.txt"
mkdir -p "${evidence_directory}"

{
    echo "COMPUTER ARCHITECTURE CONTAINER RECEIPT"
    echo "======================================="
    echo "Recorded UTC: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
    echo "Working directory: $(pwd)"
    echo

    echo "[CONTAINER USER SPACE]"
    cat /etc/os-release
    echo

    echo "[HOST-SUPPLIED KERNEL VIEW]"
    uname -a
    echo

    echo "[MACHINE AND CPU VIEW]"
    uname -m
    lscpu
    echo

    echo "[MEMORY VIEW]"
    free -h
    echo

    echo "[FILESYSTEM VIEW]"
    df -h
    echo

    echo "[TOOLS]"
    gcc --version | head -n 1
    objdump --version | head -n 1
    readelf --version | head -n 1
    python3 --version
    echo

    echo "[IDENTITY]"
    id
    echo

    echo "[REPOSITORY STATE]"
    if git -C /workspace rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Commit: $(git -C /workspace rev-parse HEAD)"
        echo "Branch: $(git -C /workspace branch --show-current)"
        git -C /workspace status --short
    else
        echo "/workspace is not recognized as a Git working tree."
    fi
    echo

    echo "[BOUNDED REPRODUCIBILITY CLAIM]"
    echo "Most likely held constant by this image:"
    echo "  - Debian user-space files"
    echo "  - installed compiler and binary-analysis tools"
    echo "  - working directory and default command"
    echo
    echo "Still dependent on the host or runtime:"
    echo "  - CPU architecture and exposed CPU capabilities"
    echo "  - kernel exposed to the container"
    echo "  - available processors and memory"
    echo "  - bind-mounted repository contents"
    echo "  - Podman runtime configuration"
    echo "  - execution performance"
} | tee "${report}"

echo
echo "Receipt written to ${report}"
'@

    [System.IO.File]::WriteAllText($ContainerfilePath, $containerfile, $Utf8NoBom)
    [System.IO.File]::WriteAllText($ProbePath, ($probe -replace "`r`n", "`n"), $Utf8NoBom)

    Write-Host "Created: $ContainerfilePath" -ForegroundColor Green
    Write-Host "Created: $ProbePath" -ForegroundColor Green
}

function Build-Image {
    Assert-Podman
    if (-not (Test-Path $ContainerfilePath) -or -not (Test-Path $ProbePath)) {
        Write-ContainerFiles
    }

    New-Item -ItemType Directory -Force -Path $EvidenceDirectory | Out-Null

    Invoke-Podman -Description 'Building the dedicated Computer Architecture image' -Arguments @(
        'build',
        '--tag', $ImageName,
        '--file', $ContainerfilePath,
        $ContainerDirectory
    )

    Write-Section 'Recording image identity'
    $identity = & podman image inspect --format 'Image={{.Id}} Created={{.Created}} Names={{.RepoTags}}' $ImageName
    if ($LASTEXITCODE -ne 0) {
        throw 'Image inspection failed.'
    }
    $identity | Tee-Object -FilePath (Join-Path $EvidenceDirectory 'image-identity.txt')
}

function Assert-Image {
    Assert-Podman
    & podman image exists $ImageName
    if ($LASTEXITCODE -ne 0) {
        throw "The image does not exist yet. Run: .\computer-architecture-container.ps1 -Mode Setup"
    }
}

function Invoke-Probe {
    Assert-Image
    New-Item -ItemType Directory -Force -Path $EvidenceDirectory | Out-Null

    Invoke-Podman -Description 'Running the Computer Architecture reproducibility probe' -Arguments @(
        'run', '--rm',
        '--name', 'computer-architecture-probe',
        '--volume', "${RepositoryRoot}:/workspace:Z",
        '--workdir', '/workspace',
        $ImageName,
        'arch-container-probe'
    )
}

function Push-Workbench {
    Assert-Image
    Write-Section 'Logging in to ghcr.io'
    Write-Host 'You need a GitHub classic personal access token scoped to write:packages.' -ForegroundColor Yellow
    Write-Host 'Create one here: https://github.com/settings/tokens/new?scopes=write:packages' -ForegroundColor Yellow
    Write-Host 'Paste the token at the hidden Password prompt below. Never your GitHub account password.' -ForegroundColor Yellow

    & podman login ghcr.io --username jeremy-evert
    if ($LASTEXITCODE -ne 0) {
        throw 'podman login failed.'
    }

    Write-Section 'Tagging the image for GHCR'
    & podman tag $ImageName $GhcrImageName
    if ($LASTEXITCODE -ne 0) {
        throw 'podman tag failed.'
    }

    Invoke-Podman -Description 'Pushing to GitHub Container Registry' -Arguments @(
        'push', $GhcrImageName
    )

    Write-Host ''
    Write-Host "Pushed: $GhcrImageName" -ForegroundColor Green
    Write-Host 'New GitHub packages are private by default.' -ForegroundColor Yellow
    Write-Host 'Make it pullable by anyone: GitHub profile -> Packages -> computer-architecture-lab -> Package settings -> Change visibility -> Public.' -ForegroundColor Yellow
}

function Enter-Shell {
    Assert-Image
    Write-Section 'Entering the Computer Architecture workbench'
    Write-Host 'Repository mount: /workspace' -ForegroundColor Green
    Write-Host 'Leave the container with: exit' -ForegroundColor Green

    & podman run --rm --interactive --tty `
        --name computer-architecture-shell `
        --volume "${RepositoryRoot}:/workspace:Z" `
        --workdir /workspace `
        $ImageName /bin/bash

    if ($LASTEXITCODE -ne 0) {
        throw "Interactive container exited with code $LASTEXITCODE."
    }
}

function Show-Status {
    Assert-Podman
    Write-Section 'Container workbench status'
    Write-Host "Repository: $RepositoryRoot"
    Write-Host "Image:      $ImageName"
    Write-Host "Evidence:   $EvidenceDirectory"
    Write-Host ''

    & podman image inspect --format 'Image={{.Id}}`nCreated={{.Created}}`nNames={{.RepoTags}}' $ImageName
    if ($LASTEXITCODE -ne 0) {
        Write-Host 'Image has not been built.' -ForegroundColor Yellow
    }

    Write-Host ''
    Get-ChildItem -Path $EvidenceDirectory -File -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object LastWriteTime, Length, Name |
        Format-Table -AutoSize
}

function Remove-WorkbenchImage {
    Assert-Podman
    Write-Section 'Removing the dedicated image'
    & podman image rm $ImageName
    if ($LASTEXITCODE -ne 0) {
        throw 'The image could not be removed. It may already be absent or in use.'
    }
    Write-Host 'Repository files and evidence were preserved.' -ForegroundColor Green
}

function Show-Help {
    @"
Computer Architecture Container Workbench
=========================================

Run this script from the repository root.

First use:
  .\computer-architecture-container.ps1 -Mode Setup

Later uses:
  .\computer-architecture-container.ps1 -Mode Probe
      Run the bounded environment probe and save a timestamped receipt.

  .\computer-architecture-container.ps1 -Mode Shell
      Enter the dedicated interactive Linux workbench. Type exit to leave.

  .\computer-architecture-container.ps1 -Mode Build
      Regenerate the supporting files and rebuild the image.

  .\computer-architecture-container.ps1 -Mode Status
      Show image identity and saved evidence.

  .\computer-architecture-container.ps1 -Mode Clean
      Remove only the built image. Preserve source files and evidence.

  .\computer-architecture-container.ps1 -Mode Push
      Publish the image to GHCR (ghcr.io/jeremy-evert/computer-architecture-lab)
      so it can be pulled on another machine. Requires a GitHub classic
      personal access token scoped to write:packages.

  .\computer-architecture-container.ps1 -Mode Help
      Display this reference.

Recommended Week 03 evidence sequence:
  .\computer-architecture-container.ps1 -Mode Setup
  .\computer-architecture-container.ps1 -Mode Probe
  .\computer-architecture-container.ps1 -Mode Probe
  .\computer-architecture-container.ps1 -Mode Status

Generated repository paths:
  containers\computer-architecture\Containerfile
  containers\computer-architecture\arch-container-probe.sh
  evidence\container-architecture\

Course boundary:
  This is optional container enrichment. It does not replace archprobe and
  it does not modify lab\Containerfile.
"@
}

switch ($Mode) {
    'Help'   { Show-Help }
    'Setup'  { Write-ContainerFiles; Build-Image; Invoke-Probe }
    'Build'  { Write-ContainerFiles; Build-Image }
    'Probe'  { Invoke-Probe }
    'Shell'  { Enter-Shell }
    'Status' { Show-Status }
    'Clean'  { Remove-WorkbenchImage }
    'Push'   { Push-Workbench }
}
