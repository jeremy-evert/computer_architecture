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