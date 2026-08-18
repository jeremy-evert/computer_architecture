#!/usr/bin/env bash
set -Eeuo pipefail

PROMPT_REL="sidecar/prompts/009_d_03_validate_current_main_compiler.md"
JOB_BRANCH="golem/009-d03-current-main-compiler"

say() { printf '\n==> %s\n' "$*"; }
die() { printf '\nD03 LAUNCH STOP: %s\n' "$*" >&2; exit 1; }

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
[[ -f "$PROMPT_REL" ]] || die "Missing d03 prompt: $PROMPT_REL"

say "Synchronizing canonical Architecture main"
git fetch origin
git pull --ff-only origin main

MAIN_SHA="$(git rev-parse HEAD)"
printf 'Architecture main under test: %s\n' "$MAIN_SHA"

if git ls-remote --exit-code --heads origin "$JOB_BRANCH" >/dev/null 2>&1; then
  die "Remote job branch $JOB_BRANCH already exists. Foreman must inspect prior evidence before another run."
fi

STARTUP_PROMPT=$(cat <<EOF
You are the project-local execution Foreman for jeremy-evert/computer_architecture Initiative 009 d03.

Read $PROMPT_REL from the current canonical main and execute it exactly as the governing work order.

LOCAL FOREMAN BOUNDARY:
- This is a Computer Architecture-local Foreman run.
- Do NOT use jeremy_task_tracking to choose, log, prioritize, or close work.
- Do NOT read or mutate JTT TASKS.md, FOREMAN_LOG.md, DECISIONS.md, completed_tasks, assistant/luna, or any JTT worktree as part of this run.
- Do NOT dispatch or advance any other course/project task.

GIT / EXECUTION CONTRACT:
- The Architecture main SHA at launch is $MAIN_SHA.
- Use an isolated Architecture branch/worktree named $JOB_BRANCH (or a collision-safe local worktree attached to exactly that branch).
- Preserve all pre-existing dirt everywhere. Never stash, reset, clean, or rewrite another checkout to make validation convenient.
- Shared repositories such as course_foundry, semester_kickoff_week, ai_fluency, and professional_minds are READ-ONLY. Record the exact SHA and dirt state actually consumed.
- If a shared checkout is dirty, do not update it. Record the caveat and determine whether validation can proceed honestly.
- Do not mutate Savnac or production Canvas.
- Do not install or reconfigure environment-wide packages merely to force a pass.

EVIDENCE / STOP CONTRACT:
- Execute the required Architecture source validator and current Course Foundry Architecture compiler/tests described by d03.
- Write the required d03 report and useful bounded receipts under computer_architecture/sidecar only.
- If a shared defect is found, reproduce and classify it, then STOP without patching the shared repository.
- Commit and push only the bounded Architecture d03 evidence branch.
- Do NOT merge to main.
- Do NOT self-certify acceptance.
- Do NOT proceed to d04.
- Stop after the d03 report/receipts are committed and pushed, then tell Jeremy the exact pushed branch and report path.

The external ChatGPT Foreman owns review, acceptance, promotion, and release of d04.
EOF
)

say "Launching Architecture-local Luna Foreman"
printf 'Prompt: %s\n' "$PROMPT_REL"
printf 'Job branch: %s\n' "$JOB_BRANCH"
printf 'JTT: explicitly out of scope\n\n'

exec codex \
  --model gpt-5.6-luna \
  --config 'model_reasoning_effort="medium"' \
  "$STARTUP_PROMPT"
