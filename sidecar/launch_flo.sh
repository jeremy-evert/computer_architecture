#!/usr/bin/env bash
set -euo pipefail

ARCH_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
FOREMAN_INTERFACE_DIR="${FOREMAN_INTERFACE_DIR:-$ARCH_ROOT/../foreman_interface}"
COURSE_FOUNDRY_DIR="${COURSE_FOUNDRY_DIR:-$ARCH_ROOT/../course_foundry}"
CANVAS_ENV="${CANVAS_ENV:-$HOME/.config/canvas/canvas.env}"
MODE="${1:-preflight}"

fail() {
  echo "FLO LAUNCH STOP: $*" >&2
  exit 1
}

require_repo() {
  local path="$1" label="$2"
  [[ -d "$path" ]] || fail "$label directory not found: $path"
  git -C "$path" rev-parse --is-inside-work-tree >/dev/null 2>&1 \
    || fail "$label is not a Git worktree: $path"
  git -C "$path" remote get-url origin >/dev/null 2>&1 \
    || fail "$label has no origin remote: $path"
}

case "$MODE" in
  preflight)
    JOB_PROMPT="$ARCH_ROOT/sidecar/jobs/009_architecture_preflight_to_green_to_write.md"
    ;;
  production)
    JOB_PROMPT="$ARCH_ROOT/sidecar/jobs/009_architecture_production_closeout.md"
    ;;
  *)
    fail "usage: ./sidecar/launch_flo.sh [production]"
    ;;
esac

command -v git >/dev/null 2>&1 || fail "git is not available on PATH."
command -v claude >/dev/null 2>&1 || fail "claude is not available on PATH."

require_repo "$ARCH_ROOT" "computer_architecture"
require_repo "$FOREMAN_INTERFACE_DIR" "foreman_interface"
require_repo "$COURSE_FOUNDRY_DIR" "course_foundry"

ORIGIN_URL="$(git -C "$ARCH_ROOT" remote get-url origin 2>/dev/null || true)"
[[ "$ORIGIN_URL" =~ github\.com[:/]jeremy-evert/computer_architecture(\.git)?$ ]] \
  || fail "Architecture origin is not jeremy-evert/computer_architecture: $ORIGIN_URL"

for required in \
  "$JOB_PROMPT" \
  "$ARCH_ROOT/sidecar/FLO_BURN.md" \
  "$FOREMAN_INTERFACE_DIR/FOREMAN.md" \
  "$FOREMAN_INTERFACE_DIR/contracts/owner_foreman.md" \
  "$FOREMAN_INTERFACE_DIR/contracts/foreman_worker.md" \
  "$FOREMAN_INTERFACE_DIR/spells/dispatch.md" \
  "$FOREMAN_INTERFACE_DIR/spells/golem.md"
do
  [[ -r "$required" ]] || fail "required file is missing or unreadable: $required"
done

[[ -r "$CANVAS_ENV" ]] || fail "Canvas environment file is missing or unreadable: $CANVAS_ENV"
[[ -x "$COURSE_FOUNDRY_DIR/.venv/bin/python3" ]] \
  || fail "Course Foundry virtualenv Python is missing: $COURSE_FOUNDRY_DIR/.venv/bin/python3"

# Refuse interrupted Git operations. Ordinary dirt is intentionally left for
# Flo to inspect and isolate because shared working copies may be in use.
for repo in "$ARCH_ROOT" "$COURSE_FOUNDRY_DIR"; do
  git_dir="$(git -C "$repo" rev-parse --git-dir)"
  case "$git_dir" in
    /*) ;;
    *) git_dir="$repo/$git_dir" ;;
  esac
  [[ ! -e "$git_dir/MERGE_HEAD" ]] || fail "unfinished merge in $repo"
  [[ ! -d "$git_dir/rebase-merge" && ! -d "$git_dir/rebase-apply" ]] \
    || fail "unfinished rebase in $repo"
done

if [[ "$MODE" == "production" ]]; then
  # The preflight Foreman may have promoted evidence from an isolated worktree,
  # so inspect canonical remote main instead of trusting a possibly stale base checkout.
  git -C "$ARCH_ROOT" fetch -q origin main \
    || fail "could not fetch canonical Architecture main before production gate"
  PREFLIGHT_REL="sidecar/reports/009_flo_preflight_to_green_to_write.md"
  PREFLIGHT_TEXT="$(git -C "$ARCH_ROOT" show "origin/main:$PREFLIGHT_REL" 2>/dev/null || true)"
  [[ -n "$PREFLIGHT_TEXT" ]] \
    || fail "production requires promoted preflight report on origin/main: $PREFLIGHT_REL"
  printf '%s\n' "$PREFLIGHT_TEXT" | grep -Fxq '**Verdict:** `GREEN TO WRITE`' \
    || fail "canonical preflight verdict is not GREEN TO WRITE; production authorization cannot be consumed"
fi

cd "$ARCH_ROOT"

export ARCH_FLO_ROOT="$ARCH_ROOT"
export ARCH_FLO_JOB="$JOB_PROMPT"
export ARCH_FLO_FOREMAN_INTERFACE="$FOREMAN_INTERFACE_DIR"
export ARCH_FLO_COURSE_FOUNDRY="$COURSE_FOUNDRY_DIR"
export ARCH_FLO_CANVAS_ENV="$CANVAS_ENV"
export ARCH_FLO_MODE="$MODE"

LAUNCH_UTC="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

if [[ "$MODE" == "production" ]]; then
  AUTHORITY_TEXT=$(cat <<EOF
PRODUCTION AUTHORIZATION:
- The human intentionally invoked ./sidecar/launch_flo.sh production at $LAUNCH_UTC.
- That invocation is fresh explicit authorization ONLY for the bounded Computer Architecture production content/configuration write described in $JOB_PROMPT, and only after every job precondition/freshness gate passes.
- It is not authority for another Canvas course, cross-list/topology changes, unexplained destructive cleanup, or a materially changed production plan.
- Record this launcher timestamp/provenance in the production receipt and report.
EOF
)
else
  AUTHORITY_TEXT=$(cat <<EOF
PRODUCTION AUTHORIZATION:
- NOT GRANTED in this launch.
- SWOSU production Canvas is read-only for this entire shift.
- Savnac course 8 may be reconciled only inside the bounded envelope in $JOB_PROMPT.
EOF
)
fi

STARTUP_PROMPT=$(cat <<EOF
You are Flo, the fresh Claude Sonnet Foreman for exactly one Computer Architecture job.

This is a NEW shift. Do not resume, continue, or inherit an older conversation. Do not select work from JTT.

WORKING DIRECTORY:
$ARCH_ROOT

CANONICAL FOREMAN CONTRACTS — READ THESE FIRST:
1. $FOREMAN_INTERFACE_DIR/contracts/owner_foreman.md
2. $FOREMAN_INTERFACE_DIR/FOREMAN.md
3. $FOREMAN_INTERFACE_DIR/contracts/foreman_worker.md

WHEN YOU DISPATCH BOUNDED WANDAS/WORKERS, ALSO READ:
4. $FOREMAN_INTERFACE_DIR/spells/dispatch.md
5. $FOREMAN_INTERFACE_DIR/spells/golem.md

YOUR ONE JOB:
$JOB_PROMPT

$AUTHORITY_TEXT

Read the job prompt in full and execute it autonomously.

Important launch semantics:
- computer_architecture is the owning worksite and center of gravity.
- Course Foundry/Harbor/foreman_interface are dependencies only when Architecture genuinely requires them.
- Do not modify JTT or take CS1/CS2/DSCT work.
- Preserve unexplained local/shared-worktree dirt; isolate work rather than cleaning someone else's state.
- You may dispatch bounded Wandas/workers yourself under the canonical Foreman/Worker contract. Jeremy is not your message bus.
- Inspect worker receipts yourself, repair/retry bounded failures, and promote accepted Architecture work/evidence yourself.
- Leave reports and receipts exactly where the job requires.
- Do not write Piper's Owner after-action report. Piper evaluates your evidence afterward.
- Keep moving until the job's DONE condition or a genuine stop condition is reached.

Begin now.
EOF
)

CLAUDE_ARGS=(--model sonnet)
if claude --help 2>&1 | grep -q -- '--effort'; then
  CLAUDE_ARGS+=(--effort medium)
fi

echo ">>> Launching fresh Flo for Computer Architecture: $MODE"
echo ">>> Job: $JOB_PROMPT"
echo ">>> Worksite: $ARCH_ROOT"
echo ">>> Launch UTC: $LAUNCH_UTC"
if [[ "$MODE" == "production" ]]; then
  echo ">>> SWOSU production authority: BOUNDED WRITE AUTHORIZED, subject to job freshness gates"
else
  echo ">>> SWOSU production authority: READ ONLY"
fi

# No --continue/--resume flag is used. Every invocation creates a fresh Foreman
# shift while preserving repository-local durable state and evidence.
exec claude "${CLAUDE_ARGS[@]}" "$STARTUP_PROMPT"
