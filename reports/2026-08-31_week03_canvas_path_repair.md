# Week 03 Canvas student-path repair

**Date:** 2026-08-31
**Target:** production Canvas course 75249 (`COMSC-3013-1438`, Fall 2026 Computer Architecture)
**Scope:** Week 03 - Containers & Repeatability only. Week 02 was a hard no-touch boundary and was not mutated.

## What was wrong

`weeks/week-03/README.md`'s "Student path" section used literal markdown links to sibling
source files:

```
1. Read [`monday.md`](monday.md).
2. Run the bounded laboratory check in [`wednesday.md`](wednesday.md).
3. Explain the reproducibility boundary in [`friday.md`](friday.md).
```

`course_foundry/architecture_desired_course.py` pushes this README body to Canvas as the
"Week 03 - Week at a Glance" page verbatim (no cross-reference link resolution exists for
architecture's static weekly-page build; that machinery -- `_KICKOFF_LINK_TOKEN_RE` --
exists only for the semester-kickoff path). The markdown links compiled to literal
`<a href="monday.md">`, `<a href="wednesday.md">`, `<a href="friday.md">` anchors in the
live page, which Canvas resolves as page-creation attempts for pages literally titled
"Monday.Md" etc. -- hence the observed "Monday.Md does not exist" prompt.

Separately, live module 218670 ("Computer Architecture Week 03 - Containers & Repeatability")
had only 2 of its compiled objects linked as module items (Week at a Glance page, and the
`Week 03 - Architecture Investigation` assignment). The compiled, published, graded
`Week 03 - Explain / Defend` assignment (10 pts, due 2026-09-05, id 913183) existed live but
had no module item -- it was not reachable through ordinary module navigation, even though it
is the Friday leg of the same three-step student path.

The `Week 03 Monday - Think / Frame` page and `Week 03 - References / Verification` page also
exist live but are intentionally left unlinked from the module (see resolution below).

## Investigation

- Confirmed live course identity (`GET /courses/75249` -> `COMSC-3013-1438`, Fall 2026
  Computer Architecture) before any mutation.
- Read `computer_architecture/weeks/week-03/{README,monday,wednesday,friday}.md` and
  `course_foundry/architecture_desired_course.py` (`_architecture_week_module`,
  `_weekly_investigation`, `_explain_defend`) to trace what each source day-file compiles to:
  - `monday.md` -> standalone Canvas page `Week 03 Monday - Think / Frame`.
  - `wednesday.md` -> assignment `Week 03 - Architecture Investigation`.
  - `friday.md` -> assignment `Week 03 - Explain / Defend`.
- Compared against Week 02 (read-only; not modified) to see the full/legacy compiled shape,
  then against the doctrine directive for this repair: fold Monday's orientation content into
  Week at a Glance rather than requiring a standalone Monday page/row, and let the real
  Wednesday/Friday graded assignments carry the path instead of dead file links.

## Repair

**Source truth** (`computer_architecture/weeks/week-03/README.md`, committed and pushed):
replaced the three literal markdown file-links with plain-text student-path steps that name
the real compiled destinations (`Week 03 - Architecture Investigation`,
`Week 03 - Explain / Defend`) and fold Monday's task into the Week-at-a-Glance content already
on the page. No markdown link syntax remains in this section, so a future full recompile/push
cannot regenerate a dead `monday.md`/`wednesday.md`/`friday.md` href.

**Live Canvas (course 75249):**
1. `PUT /courses/75249/pages/week-03-week-at-a-glance` -- replaced the page body with the
   markdown-rendered output of the corrected README (verified byte-identical to the live page
   outside the Student-path block before the write; verified after the write that the phrases
   `monday.md`, `wednesday.md`, `friday.md` are no longer present anywhere in the body).
2. `POST /courses/75249/modules/218670/items` -- added a module item for the existing
   `Week 03 - Explain / Defend` assignment (content_id 913183), so the Friday leg of the path
   is reachable from the module, matching the Wednesday leg that was already linked.

Left untouched: the underlying `Week 03 Monday - Think / Frame` and
`Week 03 - References / Verification` pages (still live, still published, simply not linked
as module rows -- consistent with "unlink, don't delete" and the compact-shell instruction not
to add clutter beyond the three-step path). No assignment content, points, due dates,
submission types, rubrics, or assignment-group weights were changed. No submissions existed on
either Week 03 assignment before or after this repair (`has_submitted_submissions: false`).

## Live readback (post-repair)

Module 218670 items:

| pos | type | title | published |
|---|---|---|---|
| 1 | Page | Week 03 - Week at a Glance | true |
| 12 | Assignment | Week 03 - Architecture Investigation | true |
| 13 | Assignment | Week 03 - Explain / Defend | true |

Week 03 - Week at a Glance page, "Student path" section, live body:

> 1. Complete Monday's reproducibility-contract prediction using the prior belief, prediction,
>    and evidence checklist above. Monday's content lives on this page; there is no separate
>    page to open.
> 2. Run the bounded laboratory check and submit the **Week 03 - Architecture Investigation**
>    assignment (Wednesday).
> 3. Explain the reproducibility boundary and submit the **Week 03 - Explain / Defend**
>    assignment (Friday).

Confirmed no occurrence of `monday.md`, `wednesday.md`, or `friday.md` anywhere in the page
body after the write.

## Week 02 verification (no-touch boundary)

Re-read module 218669 and page `week-02-week-at-a-glance` after the Week 03 mutations:
module item list and page `updated_at` (`2026-08-20T03:56:35Z`) are unchanged from before this
repair -- Week 02 was not touched.

## Validation

No automated Week 03/architecture test suite was runnable in this environment (`course_foundry`'s
`imprint` dependency is an external private git package not installed locally, and its full
test suite was out of scope for this bounded link-repair cartridge). Validation performed
instead: exact markdown-render comparison (Python `markdown` + `tables` extension) of the
corrected README against the pre-repair live page body, confirming the only diff is the
Student-path block, plus the live API readbacks recorded above.
