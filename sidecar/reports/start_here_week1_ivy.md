# Comp Arch Start Here + week rail + Week 1 overview + block map — Ivy evidence

Date: 2026-09-08
Role: Ivy / Foreman Intern, fourth bite of the 5-class layout campaign
(Commons, CS1, CS2 already deployed). No Canvas contact — page-body
generation only; Anna deploys from April with read-back verification.

## Waited for live inventory before building

After CS2 turned out to be "mostly already right" (contrary to my own
assumption), I asked Anna for a live-verified Canvas inventory before
touching anything here, rather than guess Comp Arch's shape from the
prior two bites' patterns. She confirmed: `default_view: modules` (needs
to become `wiki`), front page exists (`home`) but is a bare stub — no
Start Here shape at all, build from scratch like CS1. **Most weeks need
zero new content**: every Week 2–17 already has a real, well-written
`week-0N-week-at-a-glance` overview page live (almost certainly
`course_foundry`'s own `week_at_a_glance.py` output — the same generator
whose nav pattern the rail component itself is built on).

## Pages built

- `sidecar/canvas_pages/start-here-this-week.html` — the front page,
  built from scratch (intended slug `start-here-this-week`, matching the
  campaign's established convention).
- `sidecar/canvas_pages/week-01-overview.html` — the shared orientation
  arc, same pattern as CS1/CS2, linking the three orientation pages using
  the slugs Anna confirmed live on 75249 specifically.
- `sidecar/canvas_pages/comparch-planning-block-map.html` — full Weeks
  1–17 table (technical focus, anchor question, free reference).

## This course is genuinely async — the date note isn't CS1/CS2's

`docs/syllabus.md` states this course has "no scheduled Banner meeting
time and no attendance category" — the M/W/F rhythm is a release/work
cadence, not a required class meeting. Did **not** reuse CS1/CS2's "we
meet Wed/Fri" phrasing; both the Start Here page and the Week 1 overview
say so explicitly instead.

## Leak/reachability discipline (applied from the start this time)

Verified programmatically: every `href` in all three pages is either an
absolute `swosu.instructure.com` URL or one of six well-established
public documentation domains (`docs.docker.com`, `kernel.org`,
`riscv.org`, `nand2tetris.org`, `openmp.org`, `docs.nvidia.com`); zero
repo-path phrasing anywhere (`github.com`, `planning/`, `lessons/`,
`weeks/week`, `assignments/`, `docs/curriculum` all grepped for
directly, zero matches). The "Go here first" graded-work link uses a
**real confirmed assignment ID** (`1527849`, "Week 04 - Architecture
Investigation," found in this repo's own existing Canvas-publish
evidence report, `sidecar/reports/031_week04_slides_and_container_canvas_publish.md`)
rather than a guessed slug — assignments are ID-addressed, per Anna's
CS1 correction.

## Block map — sourced from the repo's own excellent per-week canon

`planning/open-source-resource-canon.md` is a genuinely well-maintained,
per-week "what's actually free/public vs course-owned" decision record —
much better source than CS2's (found-stale) resource map. Used it to pick
public references only where the canon calls a given week's external
source strong/primary (RISC-V spec, Docker, Linux kernel docs, OpenMP,
CUDA Programming Guide, Nand2Tetris) — left the "RED / course-owned" and
"no single durable open source" weeks' reference cell blank rather than
force one (Weeks 2, 5, 8, 9, 10, 14, 15, 16, 17). Anchor questions are
each week's own "Weekly Focus" / "Central question" line from
`planning/week-0N.md`, pulled fresh after confirming this repo was not
behind `origin/main`.

## Two things confirmed NOT touched, and one new drift finding

- **Week 4's own `week-04-week-at-a-glance` page**: real, live, good
  content — never opened, only referenced its confirmed slug.
- **The Explain/Defend discussion hold**: Week 4 has only the starter
  template file Anna described; the graded-discussion conversion is
  still Jeremy's call (same pattern as CS1's Week 4 hold). Did not build
  it, did not link to it as if it exists.
- **Third instance of the unmerged-branch title-drift trap, this time in
  a different repo**: `planning/week-04.md` still names the Wednesday/
  Friday Professional Minds readings "Critical Thinking" / "Thinking,
  Fast and Slow" — the actual rendered episode titles are "Spelling Out
  Arguments" / "The Outside View," already fixed today on
  `ivy/two-minds-rename` (accepted, not yet merged to `main`). Not
  something I needed to touch for this bite (my new pages never cite
  those titles), but flagging since it's the same unmerged-acceptance-
  branch pattern now confirmed in three different repos today
  (`computer_science_2` twice, `computer_architecture` once).

## Not in scope for this bite

- `default_view: modules` → `wiki` — a course-settings change, Anna's to
  make at deploy time, not a page body.
- Weeks 2–17's already-good overview pages — untouched, zero new content
  needed.

## Spend split

Anthropic only — no Codex dispatch. Direct authoring, consistent with
every prior bite in this campaign: source material was already read in
full before any page body was written.

IVY COMP ARCH START HERE + WEEK 1 + BLOCK MAP READY FOR ANNA
