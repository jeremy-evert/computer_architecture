#!/usr/bin/env bash
set -Eeuo pipefail

if [[ "${1:-}" == "--smoke" ]]; then
    for instrument in uname lscpu free ps file od; do
        command -v "${instrument}" >/dev/null
    done
    echo "Architecture Telescope smoke test: required instruments available"
    exit 0
fi

cat <<'RECEIPT'
ARCHITECTURE TELESCOPE — OBSERVATION RECEIPT

Question:

Instrument:

Observation (quote only the relevant raw output):

Interpretation (what does that observation support?):

Boundary (what does it not establish?):

Revision (how would you ask the question more precisely next time?):
RECEIPT
