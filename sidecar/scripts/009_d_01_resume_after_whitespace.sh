#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

JOB_BRANCH="golem/009-d01-canonical-launch-source"
LAUNCH_REF="origin/savnac/architecture-launch-readiness"
REPORT_REL="sidecar/reports/009_d_01_reconcile_canonical_launch_source.md"

say() { printf '\n==> %s\n' "$*"; }
die() { printf '\nD01 RESUME STOP: %s\n' "$*" >&2; exit 1; }

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
[[ -n "$ROOT" ]] || die "Run this from inside the computer_architecture Git repository."
cd "$ROOT"

ORIGIN_URL="$(git remote get-url origin 2>/dev/null || true)"
[[ "$ORIGIN_URL" =~ github\.com[:/]jeremy-evert/computer_architecture(\.git)?$ ]] \
  || die "origin is not jeremy-evert/computer_architecture: $ORIGIN_URL"
[[ "$(git branch --show-current)" == "main" ]] \
  || die "Base checkout must be on main. Current branch: $(git branch --show-current)"
[[ -z "$(git status --porcelain)" ]] \
  || die "Base checkout is dirty. I will not touch or stash Jeremy's existing work."

say "Fetching current GitHub truth"
git fetch --prune origin
MAIN_SHA="$(git rev-parse origin/main)"
LOCAL_SHA="$(git rev-parse HEAD)"
LAUNCH_SHA="$(git rev-parse "$LAUNCH_REF" 2>/dev/null || true)"
[[ -n "$LAUNCH_SHA" ]] || die "Missing $LAUNCH_REF after fetch."
[[ "$LOCAL_SHA" == "$MAIN_SHA" ]] \
  || die "Local main is not current origin/main. Run git pull --ff-only, then rerun this resume script."

if git ls-remote --exit-code --heads origin "$JOB_BRANCH" >/dev/null 2>&1; then
  die "Remote $JOB_BRANCH already exists. Do not resume over pushed evidence; Foreman must inspect it."
fi
if ! git show-ref --verify --quiet "refs/heads/$JOB_BRANCH"; then
  die "Expected failed local branch $JOB_BRANCH does not exist. Use the primary d01 runner instead."
fi

WT="${ARCH_D01_WORKTREE:-$(dirname "$ROOT")/computer_architecture-009-d01}"
[[ -d "$WT/.git" || -f "$WT/.git" ]] || die "Expected failed worktree is missing: $WT"
WT_BRANCH="$(git -C "$WT" branch --show-current)"
[[ "$WT_BRANCH" == "$JOB_BRANCH" ]] \
  || die "Worktree $WT is on $WT_BRANCH, not $JOB_BRANCH. Refusing to touch it."

BRANCH_SHA="$(git rev-parse "$JOB_BRANCH")"
AHEAD_OF_MAIN="$(git rev-list --count "$MAIN_SHA..$JOB_BRANCH")"
[[ "$AHEAD_OF_MAIN" == "0" ]] \
  || die "$JOB_BRANCH contains commits not in current main. Foreman review required; no automatic resume."

MERGE_BASE="$(git merge-base "$MAIN_SHA" "$LAUNCH_SHA")"
read -r MAIN_ONLY LAUNCH_ONLY < <(git rev-list --left-right --count "$MAIN_SHA...$LAUNCH_SHA")
printf 'current main: %s\nfailed branch base: %s\nlaunch: %s\n' "$MAIN_SHA" "$BRANCH_SHA" "$LAUNCH_SHA"
printf 'divergence now: main-only=%s launch-only=%s\n' "$MAIN_ONLY" "$LAUNCH_ONLY"

say "Proving the failed worktree contains only bounded d01 source changes"
git -C "$WT" reset >/dev/null
while IFS= read -r p; do
  [[ -n "$p" ]] || continue
  case "$p" in
    weeks/week-02/*|weeks/week-03/*|weeks/week-04/*|weeks/week-15/*|weeks/week-17/*|\
    assignments/A6-professional-pathway-artifacts.md|assignments/A7-final-reflection.md|\
    docs/course-evaluation.md|scripts/validate_savnac_launch_source.py)
      ;;
    *) die "Unexpected failed-worktree path before resume: $p" ;;
  esac
done < <(git -C "$WT" status --porcelain=v1 -uall | sed -E 's/^.. //')

say "Carrying the bounded failed work forward onto current main"
STASH_NAME="architecture-009-d01-resume-$(date -u +%Y%m%dT%H%M%SZ)"
git -C "$WT" stash push -u -m "$STASH_NAME" >/dev/null
[[ -z "$(git -C "$WT" status --porcelain)" ]] || die "Failed worktree did not become clean after bounded stash."
git -C "$WT" reset --hard "$MAIN_SHA" >/dev/null
set +e
STASH_POP_OUTPUT="$(git -C "$WT" stash pop 2>&1)"
STASH_POP_RC=$?
set -e
printf '%s\n' "$STASH_POP_OUTPUT"
[[ $STASH_POP_RC -eq 0 ]] || die "Bounded d01 changes did not reapply cleanly onto current main."
cd "$WT"

say "Normalizing trailing whitespace in only the bounded d01 source"
find \
  weeks/week-02 weeks/week-03 weeks/week-04 weeks/week-15 weeks/week-17 \
  -type f \( -name '*.md' -o -name '*.tex' \) -print0 \
  | xargs -0 -r sed -i 's/[[:blank:]]\+$//'
for p in \
  assignments/A6-professional-pathway-artifacts.md \
  assignments/A7-final-reflection.md \
  docs/course-evaluation.md \
  scripts/validate_savnac_launch_source.py
do
  [[ -f "$p" ]] || die "Required d01 source is missing after resume: $p"
  sed -i 's/[[:blank:]]\+$//' "$p"
done

say "Rechecking d01 doctrine and boundaries"
for n in $(seq 2 17); do
  w="$(printf '%02d' "$n")"
  [[ -d "weeks/week-$w" ]] || die "Missing weeks/week-$w after reconciliation."
done
grep -q 'Claim -> Evidence -> Gap -> Decision' assignments/A6-professional-pathway-artifacts.md \
  || die "A6 lost the accepted Claim -> Evidence -> Gap -> Decision loop."
grep -qi 'skill gap' assignments/A6-professional-pathway-artifacts.md \
  || die "A6 does not preserve skill-gap doctrine."
grep -qi 'evidence gap' assignments/A6-professional-pathway-artifacts.md \
  || die "A6 does not preserve evidence-gap doctrine."

for p in \
  weeks/week-07/references.md \
  weeks/week-08/references.md \
  weeks/week-10/references.md \
  weeks/week-11/references.md
do
  git diff --quiet "$MAIN_SHA" "$LAUNCH_SHA" -- "$p" \
    || die "$p differs between current main and launch source; Foreman review required."
done
git diff --quiet "$MAIN_SHA" -- docs/professional-pathway.md docs/grading-model.md \
  || die "Resume unexpectedly changed current doctrine."
git diff --quiet "$MAIN_SHA" -- weeks/week-16 scripts/validate_week16_farkle.py \
  || die "Resume unexpectedly changed Week 16."

while IFS= read -r p; do
  [[ -n "$p" ]] || continue
  case "$p" in
    weeks/week-02/*|weeks/week-03/*|weeks/week-04/*|weeks/week-15/*|weeks/week-17/*|\
    assignments/A6-professional-pathway-artifacts.md|assignments/A7-final-reflection.md|\
    docs/course-evaluation.md|scripts/validate_savnac_launch_source.py)
      ;;
    *) die "Unexpected source diff after resume: $p" ;;
  esac
done < <(git status --porcelain=v1 -uall | sed -E 's/^.. //')

git diff --check

say "Staging and committing bounded source reconciliation"
git add -- \
  weeks/week-02 weeks/week-03 weeks/week-04 weeks/week-15 weeks/week-17 \
  assignments/A6-professional-pathway-artifacts.md \
  assignments/A7-final-reflection.md \
  docs/course-evaluation.md \
  scripts/validate_savnac_launch_source.py
git diff --cached --check
git diff --cached --stat
git commit -m "Reconcile Architecture launch source for 009 d01"
SOURCE_COMMIT="$(git rev-parse HEAD)"

say "Running Architecture-local launch-source validator"
set +e
VALIDATOR_OUTPUT="$(python3 scripts/validate_savnac_launch_source.py 2>&1)"
VALIDATOR_RC=$?
set -e
printf '%s\n' "$VALIDATOR_OUTPUT"
[[ $VALIDATOR_RC -eq 0 ]] \
  || die "validate_savnac_launch_source.py returned RED. Branch remains local and is NOT pushed."
VALIDATION_RECEIPT="$(printf '%s\n' "$VALIDATOR_OUTPUT" | tail -n 1)"
[[ -f "$VALIDATION_RECEIPT" ]] \
  || die "Validator passed but its receipt path was not found: $VALIDATION_RECEIPT"
VALIDATION_RECEIPT_REL="${VALIDATION_RECEIPT#$WT/}"
VALIDATION_STATUS="$(grep -m1 -- '- status:' "$VALIDATION_RECEIPT" | sed 's/^[[:space:]]*//')"

git diff --check

say "Classifying launch-branch provenance for the d01 report"
CLASS_TSV="$(mktemp)"
trap 'rm -f "$CLASS_TSV"' EXIT
classify_path() {
  local p="$1" cls reason
  if ! git cat-file -e "$LAUNCH_SHA:$p" 2>/dev/null; then
    cls="SUPERSEDED"; reason="launch-side deletion is not propagated into newer main"
  elif git cat-file -e "$MAIN_SHA:$p" 2>/dev/null && \
       [[ "$(git rev-parse "$MAIN_SHA:$p")" == "$(git rev-parse "$LAUNCH_SHA:$p")" ]]; then
    cls="SUPERSEDED"; reason="identical content already exists on current main"
  else
    case "$p" in
      weeks/week-02/*|weeks/week-03/*|weeks/week-04/*|weeks/week-15/*|weeks/week-17/*)
        cls="INTEGRATE"; reason="launch-required student-facing week source" ;;
      assignments/A6-professional-pathway-artifacts.md)
        cls="RECONCILE"; reason="required source reconciled to newer main professional-pathway doctrine" ;;
      assignments/A7-final-reflection.md|docs/course-evaluation.md|scripts/validate_savnac_launch_source.py)
        cls="INTEGRATE"; reason="launch-required course-local source/validator" ;;
      weeks/week-07/references.md|weeks/week-08/references.md|weeks/week-10/references.md|weeks/week-11/references.md)
        cls="SUPERSEDED"; reason="reference correction already represented by current-main truth" ;;
      planning/*)
        cls="SUPERSEDED"; reason="newer main planning lineage owns status; d02 follows" ;;
      prompts/*|reports/*|sidecar/prompts/*|sidecar/reports/*|sidecar/runs/*)
        cls="HISTORICAL_ONLY"; reason="receipt/orchestration provenance, not active compiler source" ;;
      *) cls="SUPERSEDED"; reason="newer current-main truth retained" ;;
    esac
  fi
  printf '%s\t%s\t%s\n' "$cls" "$p" "$reason" >> "$CLASS_TSV"
}
while IFS= read -r p; do
  [[ -n "$p" ]] && classify_path "$p"
done < <(git diff --name-only "$MERGE_BASE" "$LAUNCH_SHA")

say "Writing d01 worker report"
mkdir -p "$(dirname "$REPORT_REL")"
{
  cat <<EOF
# 009 d01 - Reconcile canonical Architecture launch source

**Status:** WORKER COMPLETE - AWAITING FOREMAN ACCEPTANCE
**Scope:** \`jeremy-evert/computer_architecture\` only
**Job branch:** \`$JOB_BRANCH\`

## Starting Git truth

- current \`origin/main\`: \`$MAIN_SHA\`
- launch source \`$LAUNCH_REF\`: \`$LAUNCH_SHA\`
- merge base: \`$MERGE_BASE\`
- divergence at resume: main-only **$MAIN_ONLY**, launch-only **$LAUNCH_ONLY**
- prior failed branch base: \`$BRANCH_SHA\`
- reconciliation source commit: \`$SOURCE_COMMIT\`

## Full launch-branch artifact classification

| Class | Path | Reason |
|---|---|---|
EOF
  while IFS=$'\t' read -r cls p reason; do
    printf '| %s | `%s` | %s |\n' "$cls" "$p" "$reason"
  done < "$CLASS_TSV"
  cat <<EOF

## Integrated

- \`weeks/week-02/\`
- \`weeks/week-03/\`
- \`weeks/week-04/\`
- \`weeks/week-15/\`
- \`weeks/week-17/\`
- \`assignments/A7-final-reflection.md\`
- \`docs/course-evaluation.md\`
- \`scripts/validate_savnac_launch_source.py\`

## Reconciled

\`assignments/A6-professional-pathway-artifacts.md\` was reconciled to current accepted \`docs/professional-pathway.md\`: Claim -> Evidence -> Gap -> Decision, explicit skill-gap/evidence-gap distinction, bring-work-forward doctrine, and the 5% + 5% Weeks 14-15 rhythm.

The first d01 attempt stopped safely at \`git diff --check\` on inherited trailing whitespace in three launch-branch Markdown lines. This resume preserved the bounded work, advanced the job branch to current main, normalized trailing blanks only inside d01-owned source, and reran the complete gate.

## Deliberately not integrated

- Current-main \`docs/professional-pathway.md\` and \`docs/grading-model.md\` remained unchanged.
- Week 07/08/10/11 reference files were verified equivalent between current main and launch source.
- Branch planning/status prose was not restored over newer main; d02 owns status reconciliation.
- Old prompts, reports, and raw runs remain historical provenance.
- Week 16 remained unchanged; no Checkpoint 4 or new graded Week 16 burden was introduced.
- No shared repository, Savnac course, or production Canvas course was mutated.

## Validation

- required local Week 02-17 directories: **present**
- A6 / A7 / course-evaluation / launch-source validator: **present**
- professional-pathway doctrine checks: **GREEN**
- Week 07/08/10/11 reference equivalence: **GREEN**
- current doctrine preservation: **GREEN**
- Week 16 preservation: **GREEN**
- \`git diff --check\`: **GREEN**
- \`python3 scripts/validate_savnac_launch_source.py\`: **$VALIDATION_STATUS**
- validation receipt: \`$VALIDATION_RECEIPT_REL\`

## Remaining ambiguity

No known launch-required Architecture-local source remains stranded only on \`savnac/architecture-launch-readiness\`. Any compiler/shared-repository issue discovered later belongs to d03 and was intentionally not repaired here.

## Git note

The exact final branch HEAD cannot be embedded inside a report committed by that same HEAD. The runner prints the exact pushed HEAD; Foreman must verify the remote branch directly.

## Worker boundary

This worker does **not** self-certify or merge. Stop here for Foreman acceptance.
EOF
} > "$REPORT_REL"
sed -i 's/[[:blank:]]\+$//' "$REPORT_REL"

git add -- "$REPORT_REL" "$VALIDATION_RECEIPT_REL"
git diff --cached --check
say "Committing validation receipt and worker report"
git commit -m "Record Architecture 009 d01 validation"
FINAL_SHA="$(git rev-parse HEAD)"

say "Pushing bounded d01 branch"
git push -u origin "$JOB_BRANCH"

printf '\n============================================================\n'
printf 'ARCHITECTURE D01 PUSHED\n'
printf 'branch: %s\n' "$JOB_BRANCH"
printf 'source commit: %s\n' "$SOURCE_COMMIT"
printf 'final branch HEAD: %s\n' "$FINAL_SHA"
printf 'report: %s\n' "$REPORT_REL"
printf 'worktree retained at: %s\n' "$WT"
printf '============================================================\n'
printf '\nTell Foreman: "Architecture d01 pushed."\n'
