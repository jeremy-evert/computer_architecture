#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

JOB_BRANCH="golem/009-d01-canonical-launch-source"
LAUNCH_REF="origin/savnac/architecture-launch-readiness"
REPORT_REL="sidecar/reports/009_d_01_reconcile_canonical_launch_source.md"

say() { printf '\n==> %s\n' "$*"; }
die() { printf '\nD01 STOP: %s\n' "$*" >&2; exit 1; }

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
[[ -n "$LAUNCH_SHA" ]] || die "Missing remote branch $LAUNCH_REF after fetch."
[[ "$LOCAL_SHA" == "$MAIN_SHA" ]] \
  || die "Local main is not current origin/main. Run git pull --ff-only, then rerun this script."

MERGE_BASE="$(git merge-base "$MAIN_SHA" "$LAUNCH_SHA")"
read -r MAIN_ONLY LAUNCH_ONLY < <(git rev-list --left-right --count "$MAIN_SHA...$LAUNCH_SHA")

printf 'main:   %s\nlaunch: %s\nbase:   %s\n' "$MAIN_SHA" "$LAUNCH_SHA" "$MERGE_BASE"
printf 'divergence: main-only=%s launch-only=%s\n' "$MAIN_ONLY" "$LAUNCH_ONLY"

if git show-ref --verify --quiet "refs/heads/$JOB_BRANCH"; then
  die "Local branch $JOB_BRANCH already exists. Refusing to reuse it."
fi
if git ls-remote --exit-code --heads origin "$JOB_BRANCH" >/dev/null 2>&1; then
  die "Remote branch $JOB_BRANCH already exists. Refusing to overwrite prior evidence."
fi

WT="${ARCH_D01_WORKTREE:-$(dirname "$ROOT")/computer_architecture-009-d01}"
[[ ! -e "$WT" ]] || die "Worktree path already exists: $WT"

CLASS_TSV="$(mktemp)"
UNKNOWN_TSV="$(mktemp)"
trap 'rm -f "$CLASS_TSV" "$UNKNOWN_TSV"' EXIT

blob_exists() {
  git cat-file -e "$1:$2" 2>/dev/null
}

same_blob() {
  local a="$1" b="$2" p="$3"
  blob_exists "$a" "$p" && blob_exists "$b" "$p" &&
    [[ "$(git rev-parse "$a:$p")" == "$(git rev-parse "$b:$p")" ]]
}

classify() {
  local p="$1"
  local cls reason

  if ! blob_exists "$LAUNCH_SHA" "$p"; then
    cls="SUPERSEDED"
    reason="launch-side deletion is not propagated into newer main"
  elif same_blob "$MAIN_SHA" "$LAUNCH_SHA" "$p"; then
    cls="SUPERSEDED"
    reason="identical content already exists on current main"
  else
    case "$p" in
      weeks/week-02/*|weeks/week-03/*|weeks/week-04/*|weeks/week-15/*|weeks/week-17/*)
        cls="INTEGRATE"
        reason="launch-required student-facing week source is absent from current main"
        ;;
      assignments/A6-professional-pathway-artifacts.md)
        cls="RECONCILE"
        reason="required source, but newer main professional-pathway doctrine governs wording"
        ;;
      assignments/A7-final-reflection.md|docs/course-evaluation.md|scripts/validate_savnac_launch_source.py)
        cls="INTEGRATE"
        reason="launch-required course-local source/validator is absent from current main"
        ;;
      weeks/week-07/references.md|weeks/week-08/references.md|weeks/week-10/references.md|weeks/week-11/references.md)
        cls="SUPERSEDED"
        reason="reference correction is already represented by current-main truth"
        ;;
      planning/*)
        cls="SUPERSEDED"
        reason="current-main planning lineage is newer; d02 owns status reconciliation"
        ;;
      prompts/*|reports/*|sidecar/prompts/*|sidecar/reports/*|sidecar/runs/*)
        cls="HISTORICAL_ONLY"
        reason="receipt/orchestration provenance, not active compiler source"
        ;;
      README.md|AGENTS.md|.gitignore|course_metadata.yaml|weeks/README.md|sidecar/README.md|sidecar/PLANNING.md|docs/grading-model.md|docs/professional-pathway.md)
        cls="SUPERSEDED"
        reason="newer current-main doctrine/status owns this path"
        ;;
      *)
        cls="UNKNOWN"
        reason="branch delta was not pre-authorized by the d01 reconciliation map"
        ;;
    esac
  fi

  printf '%s\t%s\t%s\n' "$cls" "$p" "$reason" >> "$CLASS_TSV"
  if [[ "$cls" == "UNKNOWN" ]]; then
    printf '%s\t%s\n' "$p" "$reason" >> "$UNKNOWN_TSV"
  fi
}

say "Classifying every launch-branch delta"
while IFS= read -r p; do
  [[ -n "$p" ]] || continue
  classify "$p"
done < <(git diff --name-only "$MERGE_BASE" "$LAUNCH_SHA")

if [[ -s "$UNKNOWN_TSV" ]]; then
  printf '\nUnclassified branch differences:\n' >&2
  cat "$UNKNOWN_TSV" >&2
  die "I found branch changes outside the bounded reconciliation rules. Nothing was edited or pushed."
fi

say "Creating isolated d01 worktree"
git worktree add -b "$JOB_BRANCH" "$WT" "$MAIN_SHA"
cd "$WT"

required_from_launch=(
  "weeks/week-02"
  "weeks/week-03"
  "weeks/week-04"
  "weeks/week-15"
  "weeks/week-17"
  "assignments/A7-final-reflection.md"
  "docs/course-evaluation.md"
  "scripts/validate_savnac_launch_source.py"
)

for p in "${required_from_launch[@]}"; do
  git cat-file -e "$LAUNCH_SHA:$p" 2>/dev/null \
    || die "Expected launch source is missing from $LAUNCH_REF: $p"
  if git cat-file -e "$MAIN_SHA:$p" 2>/dev/null; then
    if same_blob "$MAIN_SHA" "$LAUNCH_SHA" "$p"; then
      continue
    fi
    die "Current main now contains a different $p. Refusing to overwrite newer source."
  fi
done

say "Integrating the proven launch-only source"
git checkout "$LAUNCH_SHA" -- "${required_from_launch[@]}"

say "Reconciling A6 to current accepted professional-pathway doctrine"
mkdir -p assignments
cat > assignments/A6-professional-pathway-artifacts.md <<'A6'
# A6 - Professional Pathway Artifacts

## Purpose

Use the professional evidence you began or recovered during the shared Week 1 success-foundations work. Do not manufacture a fresh artifact merely because the semester is ending. Bring real work forward, improve what the evidence justifies, and make your reasoning visible.

This assignment owns the two graded Architecture professional-pathway moments in Weeks 14 and 15. The governing loop is:

> **Claim -> Evidence -> Gap -> Decision**

A professional claim should be supported by inspectable evidence. A gap should be named honestly as either a **skill gap** (you cannot yet do something at the needed level) or an **evidence gap** (you may be able to do it, but cannot yet show convincing evidence). Your next decision should follow from that distinction.

The shared Week 1 baseline remains owned by `semester_kickoff_week`.

## Week 14 - Professional evidence update - graded 5%

By the end of the technical core, revisit a real target role, role family, internship direction, graduate-school direction, or other professional next step that matters to you.

Submit a concise evidence update that does all of the following:

1. **Claim:** State one or more professional claims you can now make honestly.
2. **Evidence:** Point to concrete evidence that supports each claim. Useful evidence may include a Machine Dossier excerpt, reproducible experiment, Explain / Defend receipt, technical presentation, project decision log, repository, resume entry, portfolio item, or another inspectable artifact.
3. **Gap:** Compare your evidence with real expectations for the direction you named. Identify at least one skill gap and/or evidence gap where the comparison justifies it.
4. **Improve:** Improve one or more real artifacts so your evidence becomes stronger, clearer, or easier for another person to inspect.
5. **Decision:** Record what you changed, what you deliberately kept, and what the evidence says you should do next.

Your update may include changes to a resume, GitHub/portfolio/LinkedIn or equivalent profile, degree/certification plan, target-role research, skill-gap analysis, or another artifact that genuinely matters to your path.

The grade rewards the quality of the reasoning and evidence, not cosmetic polish.

## Week 15 - Departure package and decision - graded 5%

Week 15 is asynchronous wind-down, not a new technical project.

Organize the professional evidence you already have into a useful departure package. Include only artifacts that genuinely apply to your path. A normal package may contain:

- resume or professional profile material;
- GitHub, portfolio, or project evidence;
- a Machine Dossier checkpoint or excerpt;
- transcript/degree-audit or degree-plan evidence;
- target-role research;
- skill-gap and/or evidence-gap analysis;
- certification or training-path evidence;
- another inspectable artifact that supports a professional claim.

Then answer:

> **Given the evidence I have now, what is my next professional move, and why?**

Your next move may be to apply for something, strengthen a skill, expose evidence you already possess, finish a credential, revise a degree plan, expand a project, or deliberately gather more evidence before choosing.

## Reuse rule

Bring an existing artifact when it already satisfies the need. Explain the update, equivalence, or decision rather than manufacturing churn.

## Integrity and equity rules

Do not claim a skill, project, benchmark, system, profile update, or career result that the submitted evidence cannot support. AI may help revise wording; the underlying evidence must remain yours and verifiable.

Expensive tools, premium AI, personal hardware, or paid services cannot raise the attainable grading ceiling. A rough artifact with clear evidence and justified reasoning can outperform a polished artifact with no evidence trail.
A6

for p in \
  weeks/week-07/references.md \
  weeks/week-08/references.md \
  weeks/week-10/references.md \
  weeks/week-11/references.md
do
  git diff --quiet "$MAIN_SHA" "$LAUNCH_SHA" -- "$p" \
    || die "$p differs between current main and launch branch; Foreman review required."
done

git diff --quiet "$MAIN_SHA" -- docs/professional-pathway.md docs/grading-model.md \
  || die "The reconciliation unexpectedly changed current doctrine."
git diff --quiet "$MAIN_SHA" -- weeks/week-16 scripts/validate_week16_farkle.py \
  || die "The reconciliation unexpectedly changed Week 16."

say "Checking required semester-local source shape"
for n in $(seq 2 17); do
  w="$(printf '%02d' "$n")"
  [[ -d "weeks/week-$w" ]] || die "Missing weeks/week-$w after reconciliation."
done

for p in \
  assignments/A6-professional-pathway-artifacts.md \
  assignments/A7-final-reflection.md \
  docs/course-evaluation.md \
  scripts/validate_savnac_launch_source.py
do
  [[ -f "$p" ]] || die "Missing required reconciled source: $p"
done

grep -q 'Claim -> Evidence -> Gap -> Decision' assignments/A6-professional-pathway-artifacts.md \
  || die "A6 does not contain the accepted Claim -> Evidence -> Gap -> Decision loop."
grep -qi 'skill gap' assignments/A6-professional-pathway-artifacts.md \
  || die "A6 does not distinguish the accepted gap doctrine."
grep -qi 'evidence gap' assignments/A6-professional-pathway-artifacts.md \
  || die "A6 does not distinguish the accepted gap doctrine."

git diff --check

say "Inspecting bounded source diff"
while IFS= read -r p; do
  [[ -n "$p" ]] || continue
  case "$p" in
    weeks/week-02/*|weeks/week-03/*|weeks/week-04/*|weeks/week-15/*|weeks/week-17/*|\
    assignments/A6-professional-pathway-artifacts.md|assignments/A7-final-reflection.md|\
    docs/course-evaluation.md|scripts/validate_savnac_launch_source.py)
      ;;
    *)
      die "Unexpected source diff before commit: $p"
      ;;
  esac
done < <(git diff --name-only "$MAIN_SHA")

git add -- \
  weeks/week-02 weeks/week-03 weeks/week-04 weeks/week-15 weeks/week-17 \
  assignments/A6-professional-pathway-artifacts.md \
  assignments/A7-final-reflection.md \
  docs/course-evaluation.md \
  scripts/validate_savnac_launch_source.py

git diff --cached --check
git diff --cached --stat

say "Committing bounded source reconciliation"
git commit -m "Reconcile Architecture launch source for 009 d01"
SOURCE_COMMIT="$(git rev-parse HEAD)"

say "Running Architecture-local launch-source validator on reconciled commit"
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
VALIDATION_STATUS="$(grep -m1 -- '- status:' "$VALIDATION_RECEIPT" | sed 's/^[[:space:]]*//')"

git diff --check

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
- divergence at execution: main-only **$MAIN_ONLY**, launch-only **$LAUNCH_ONLY**
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

The following launch-required student-facing source was brought into the current-main lineage from the proven launch branch:

- \`weeks/week-02/\`
- \`weeks/week-03/\`
- \`weeks/week-04/\`
- \`weeks/week-15/\`
- \`weeks/week-17/\`
- \`assignments/A7-final-reflection.md\`
- \`docs/course-evaluation.md\`
- \`scripts/validate_savnac_launch_source.py\`

## Reconciled

\`assignments/A6-professional-pathway-artifacts.md\` was **not** copied blindly. It was rewritten against current accepted \`docs/professional-pathway.md\` so Weeks 14-15 explicitly use the governing **Claim -> Evidence -> Gap -> Decision** loop, distinguish skill gaps from evidence gaps, preserve bring-work-forward doctrine, and retain the 5% + 5% grading rhythm.

## Deliberately not integrated

- Current-main \`docs/professional-pathway.md\` and \`docs/grading-model.md\` were preserved unchanged.
- The Week 07/08/10/11 reference files named by Prompt 009d01 were verified byte-equivalent between current main and the launch branch, so no transplant was needed.
- Branch planning/status prose was not restored over newer main; d02 owns status reconciliation.
- Old prompts, reports, and raw runs remain historical provenance rather than active launch source.
- Week 16 and its validator were preserved unchanged. No Checkpoint 4 or new graded Week 16 burden was introduced.
- No shared repository, Savnac course, or production Canvas course was read or mutated by this job.

## Validation

- required local week directories \`week-02\` through \`week-17\`: **present**
- A6 / A7 / course-evaluation / launch-source validator: **present**
- A6 current professional-pathway doctrine check: **GREEN**
- Week 07/08/10/11 reference equivalence check: **GREEN**
- newer main doctrine preservation check: **GREEN**
- Week 16 preservation check: **GREEN**
- \`git diff --check\`: **GREEN**
- \`python3 scripts/validate_savnac_launch_source.py\`: **$VALIDATION_STATUS**
- validation receipt: \`$VALIDATION_RECEIPT\`

## Remaining ambiguity

No known launch-required Architecture-local source remains stranded only on \`savnac/architecture-launch-readiness\` after this reconciliation. Any compiler/shared-repository issue discovered later belongs to d03 and was intentionally not repaired here.

## Git note

The exact final branch HEAD cannot be embedded inside the report committed by that same HEAD because a Git commit hash depends on the report contents. The runner prints the exact pushed branch HEAD after the report commit. Foreman should verify the remote branch HEAD directly during acceptance.

## Worker boundary

This worker does **not** self-certify or merge. Stop here for Foreman acceptance.
EOF
} > "$REPORT_REL"

git add -- "$REPORT_REL" "$VALIDATION_RECEIPT"
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
