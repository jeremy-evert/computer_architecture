#!/usr/bin/env bash
set -Eeuo pipefail

PROMPT_REL="sidecar/prompts/009_d_04_rebaseline_savnac.md"
ACCEPTANCE_REL="sidecar/reports/009_d_03_foreman_acceptance.md"
JOB_BRANCH="golem/009-d04-savnac-rebaseline"

say() { printf '\n==> %s\n' "$*"; }
die() { printf '\nD04 LAUNCH STOP: %s\n' "$*" >&2; exit 1; }

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
[[ -n "$ROOT" ]] || die "Run this from inside jeremy-evert/computer_architecture."
cd "$ROOT"

ORIGIN_URL="$(git remote get-url origin 2>/dev/null || true)"
[[ "$ORIGIN_URL" =~ github\.com[:/]jeremy-evert/computer_architecture(\.git)?$ ]] \
  || die "origin is not jeremy-evert/computer_architecture: $ORIGIN_URL"

[[ "$(git branch --show-current)" == "main" ]] \
  || die "Base checkout must be on main. Current branch: $(git branch --show-current)"
[[ -z "$(git status --porcelain)" ]] \
  || die "Architecture base checkout is dirty. Refusing to stash, clean, or overwrite Jeremy's work."

command -v codex >/dev/null 2>&1 || die "codex is not available on PATH."

say "Synchronizing canonical Architecture main"
git fetch origin
git pull --ff-only origin main

[[ -f "$PROMPT_REL" ]] || die "Missing d04 prompt: $PROMPT_REL"
[[ -f "$ACCEPTANCE_REL" ]] || die "Missing accepted d03 evidence: $ACCEPTANCE_REL"
grep -q 'ACCEPTED / PROMOTED' "$ACCEPTANCE_REL" \
  || die "d03 acceptance report does not contain ACCEPTED / PROMOTED."

MAIN_SHA="$(git rev-parse HEAD)"
printf 'Architecture main under test: %s\n' "$MAIN_SHA"

if git ls-remote --exit-code --heads origin "$JOB_BRANCH" >/dev/null 2>&1; then
  die "Remote job branch $JOB_BRANCH already exists. Foreman must inspect prior evidence before another run."
fi

STARTUP_PROMPT=$(cat <<EOF
You are the project-local execution Foreman for jeremy-evert/computer_architecture Initiative 009 d04.

Read $PROMPT_REL from the current canonical main and execute it exactly as the governing work order. d03 has been externally accepted; the acceptance receipt is $ACCEPTANCE_REL.

LOCAL FOREMAN BOUNDARY:
- This is a Computer Architecture-local Foreman run.
- Do NOT use jeremy_task_tracking to choose, log, prioritize, or close work.
- Do NOT read or mutate JTT TASKS.md, FOREMAN_LOG.md, DECISIONS.md, completed_tasks, assistant/luna, or any JTT worktree as part of this run.
- Do NOT dispatch or advance any other course/project task.

GIT / EXECUTION CONTRACT:
- The Architecture main SHA at launch is $MAIN_SHA.
- Use an isolated Architecture branch/worktree named $JOB_BRANCH, or a collision-safe local worktree attached to exactly that branch.
- Preserve all pre-existing dirt everywhere. Never stash, reset, clean, or rewrite another checkout.
- Shared repositories, including course_foundry and shared curriculum sources, are READ-ONLY. Record exact SHA and dirt state actually consumed.
- Build the same current desired-state contract accepted by d03 from explicit recorded source roots.

SAVNAC READ-ONLY CONTRACT:
- Target only the existing Savnac Computer Architecture course id 8.
- Reads, inventory, and guarded dry-run/diff are allowed.
- Do NOT issue any live reconcile/push/update/create/delete/prune request.
- Do NOT supply or infer a live-write confirmation flag or approval.
- Do NOT access or mutate production Canvas.
- Compare current desired/live state against Prompt 006 historical evidence, but do not treat historical counts as current truth when accepted current doctrine differs.

EVIDENCE / VERDICT CONTRACT:
- Perform the semantic checks required by d04, including modules/order, object counts/types, A6/A7/evaluation, groups/weights/drop rules, due/dead-day behavior, Week 1, duplicates/orphans, files/links, and delete/prune scope.
- Return exactly one d04 verdict: ZERO_OR_EQUIVALENT, EXPECTED_MATERIAL_DELTA, or UNEXPLAINED_DELTA.
- Write the required report at sidecar/reports/009_d_04_rebaseline_savnac.md and useful bounded receipts under computer_architecture/sidecar only.
- Commit and push only the bounded Architecture d04 evidence branch.
- Do NOT merge to main.
- Do NOT self-certify acceptance.
- Do NOT execute d05 or d06.
- Stop after the d04 evidence is committed and pushed, then tell Jeremy the exact pushed branch, report path, verdict, and dry-run counts.

The external ChatGPT Foreman owns review, acceptance, promotion, and the decision to skip/release d05 or proceed toward d06.
EOF
)

say "Launching Architecture-local Luna Foreman for d04"
printf 'Prompt: %s\n' "$PROMPT_REL"
printf 'Job branch: %s\n' "$JOB_BRANCH"
printf 'Savnac: course 8, READ-ONLY\n'
printf 'Production Canvas: out of scope\n'
printf 'JTT: explicitly out of scope\n\n'

exec codex \
  --model gpt-5.6-luna \
  --config 'model_reasoning_effort="medium"' \
  "$STARTUP_PROMPT"
