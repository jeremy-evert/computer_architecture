#!/usr/bin/env bash
set -Eeuo pipefail

PROMPT_REL="sidecar/prompts/009_d_05_reconcile_savnac_fixed_point.md"
ACCEPTANCE_REL="sidecar/reports/009_d_04_foreman_acceptance.md"
D04_REPORT_REL="sidecar/reports/009_d_04_rebaseline_savnac.md"
D04_RECEIPT_REL="sidecar/runs/009_d_04_savnac_rebaseline_receipt.md"
JOB_BRANCH="golem/009-d05-savnac-fixed-point"
D04_SOURCE_SHA="7ce6cd6b591aa29fc05d114b0afb1c224f4f2222"

say() { printf '\n==> %s\n' "$*"; }
die() { printf '\nD05 LAUNCH STOP: %s\n' "$*" >&2; exit 1; }

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
[[ -n "$ROOT" ]] || die "Run this from inside jeremy-evert/computer_architecture."
cd "$ROOT"

ORIGIN_URL="$(git remote get-url origin 2>/dev/null || true)"
[[ "$ORIGIN_URL" =~ github\.com[:/]jeremy-evert/computer_architecture(\.git)?$ ]] \
  || die "origin is not jeremy-evert/computer_architecture: $ORIGIN_URL"

[[ "$(git branch --show-current)" == "main" ]] \
  || die "Base checkout must be on main. Current branch: $(git branch --show-current)"

# Preserve human/runtime dirt. Tracked changes are a hard stop; untracked files
# are recorded and left alone because d04 observed sidecar/raw/ in the base
# checkout after its run.
TRACKED_DIRT="$(git status --porcelain --untracked-files=no)"
[[ -z "$TRACKED_DIRT" ]] || die "Architecture base checkout has tracked changes. Refusing to stash, reset, clean, or overwrite them."
if [[ -n "$(git status --porcelain)" ]]; then
  say "Preserving pre-existing untracked Architecture base-checkout dirt"
  git status --short
fi

command -v codex >/dev/null 2>&1 || die "codex is not available on PATH."

say "Synchronizing canonical Architecture main"
git fetch origin
git pull --ff-only origin main

for required in "$PROMPT_REL" "$ACCEPTANCE_REL" "$D04_REPORT_REL" "$D04_RECEIPT_REL"; do
  [[ -f "$required" ]] || die "Missing required d05 predecessor evidence: $required"
done

grep -q 'ACCEPTED / PROMOTED' "$ACCEPTANCE_REL" \
  || die "d04 acceptance report is not ACCEPTED / PROMOTED."
grep -q 'EXPECTED_MATERIAL_DELTA' "$ACCEPTANCE_REL" \
  || die "d04 acceptance report does not authorize the conditional d05 path."

MAIN_SHA="$(git rev-parse HEAD)"
printf 'Architecture main at launch: %s\n' "$MAIN_SHA"
printf 'Accepted d04 source SHA: %s\n' "$D04_SOURCE_SHA"

if git ls-remote --exit-code --heads origin "$JOB_BRANCH" >/dev/null 2>&1; then
  die "Remote job branch $JOB_BRANCH already exists. Foreman must inspect prior evidence before another run."
fi

STARTUP_PROMPT=$(cat <<EOF
You are the bounded Luna execution/validation Golem for jeremy-evert/computer_architecture Initiative 009 d05.

Read $PROMPT_REL from current canonical main and execute it exactly as the governing work order.

PREDECESSOR AUTHORITY:
- External Foreman accepted d04 at $ACCEPTANCE_REL with verdict EXPECTED_MATERIAL_DELTA.
- Accepted d04 report: $D04_REPORT_REL
- Accepted d04 run receipt: $D04_RECEIPT_REL
- The accepted desired-source run used Architecture source SHA $D04_SOURCE_SHA.
- Current main at launcher time is $MAIN_SHA. Any commits after the accepted d04 source SHA must be proven control/evidence-only and must not silently change the desired course source.

WORKSHOP ROLE BOUNDARY:
- You are the execution/validation Golem for this bounded Computer Architecture unit, not the acceptance or promotion Foreman.
- The external ChatGPT Foreman owns review, ACCEPT/RETRY/REJECT, promotion, and release of d06.
- Do NOT use jeremy_task_tracking to choose, log, prioritize, or close work.
- Do NOT read or mutate JTT TASKS.md, FOREMAN_LOG.md, DECISIONS.md, completed_tasks, assistant/luna, or any JTT worktree.
- Do NOT dispatch or advance any other course/project task.

GIT / STATE CONTRACT:
- Use an isolated Architecture branch/worktree named $JOB_BRANCH, or a collision-safe worktree attached to exactly that branch.
- Preserve all pre-existing dirt everywhere. Never stash, reset, clean, or rewrite another checkout.
- The base Architecture checkout may contain pre-existing untracked sidecar/raw/ material. Preserve it and do not stage or copy it into the d05 package.
- Shared repositories, including course_foundry and shared curriculum sources, are READ-ONLY. Record exact SHA and dirt state actually consumed.
- Do not edit compiler/course source during this write gate.

FRESHNESS GATE BEFORE ANY SAVNAC WRITE:
1. Recheck exact Savnac course 8 identity.
2. Recheck current desired-state source roots and prove no student-facing desired source changed since accepted d04.
3. Recheck shared source/compiler SHAs against accepted d04 evidence. Unexpected shared drift is STOP, not permission to improvise.
4. Re-read enrollment/submission state. Unexpected real-student or submission state is STOP.
5. Run the guarded dry-run first.
6. The pre-write dry-run MUST reproduce exactly: 0 create / 7 update / 233 unchanged / 0 delete, with prune_scope=none and the same seven body updates accepted by d04.
7. Any create, delete, group change, kind change, unexpected update, duplicate/orphan, prune scope, or unexplained normalization delta is STOP BEFORE WRITE.

AUTHORIZED NON-PRODUCTION WRITE BOUNDARY:
- This unit is authorized to reconcile ONLY existing Savnac Computer Architecture course id 8 after the freshness gate passes exactly.
- Use the established Course Foundry / Imprint reconcile path. Do not create a new loader.
- Apply only the seven accepted body updates. Expected write envelope: 0 create / 7 update / 0 delete.
- Do not prune.
- Do not create a course.
- Do not write any other Savnac course.
- Do not access or mutate production Canvas.
- Do not mutate shared repositories.

FIXED-POINT PROOF AFTER WRITE:
- Read back course 8 and verify module/order/counts, groups/weights/drop rules, A6/A7/evaluation, Week-16 dead-day behavior, duplicates/orphans, and changed links/files/assets.
- Run an immediate guarded dry-run and require 0 create / 0 update / 0 delete.
- Run a second consecutive guarded dry-run and require the same no-op result so the fixed point is not a one-read accident.
- If convergence fails or a new normalization delta appears, classify it and STOP. Do not weaken comparison rules or patch shared code/source inside d05.

EVIDENCE / STOP CONTRACT:
- Write the required report at sidecar/reports/009_d_05_reconcile_savnac_fixed_point.md and bounded receipts under computer_architecture/sidecar only.
- Record exact pre-write dry-run, live write counts, read-back counts, both post-write fixed-point dry-runs, exact SHAs, and any caveats.
- Commit and push only the bounded Architecture d05 evidence branch.
- Do NOT merge to main.
- Do NOT self-certify acceptance.
- Do NOT execute d06.
- Stop after d05 evidence is committed and pushed, then tell Jeremy the exact branch, report path, write counts, and fixed-point dry-run counts.

The external ChatGPT Foreman owns independent review and promotion.
EOF
)

say "Launching Architecture-local Luna validation Golem for d05"
printf 'Prompt: %s\n' "$PROMPT_REL"
printf 'Job branch: %s\n' "$JOB_BRANCH"
printf 'Savnac authorization: existing course 8 only, bounded 7-update reconcile after exact freshness gate\n'
printf 'Production Canvas: explicitly forbidden\n'
printf 'JTT: explicitly out of scope\n\n'

exec codex \
  --model gpt-5.6-luna \
  --config 'model_reasoning_effort="medium"' \
  "$STARTUP_PROMPT"
