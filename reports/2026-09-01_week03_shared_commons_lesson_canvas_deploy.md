# Week 3 shared Commons containers lesson — Canvas deployment (Architecture)

**Date:** 2026-09-01
**Target:** production Canvas course 75249 (`COMSC-3013-1438.2026FA`)
**Mission:** `foreman_interface/jobs/tasks/week03_shared_containers_ghcr_and_module.md`,
Phase 5 + the "PROCEED" item of the 2026-09-01 autonomous Week 3 pass.

## Why a native page instead of a link to course 24298

The mission's default plan was to link straight to the Computing Commons
course (24298). Before doing that, I checked whether Architecture students
could actually reach it: course 24298 currently has **zero student
enrollments** and `is_public` / `is_public_to_auth_users` are both `false`.
A link there would be a dead end for real students -- exactly the class of
defect the Week 3 link-repair mission earlier this cycle existed to fix.
Rather than link to an unreachable course or silently change that course's
visibility (a consequential, unauthorized decision), the shared module was
mirrored as a **native page in each consuming course**, sourced from the
single canonical `computing_commons/curriculum/containers-and-repeatable-
environments.md` file so there is still exactly one authored copy, just two
delivery copies. Flagging the 24298 enrollment/visibility gap here as a
finding for Jeremy, not something resolved by this change.

## What changed (all additive; no assignment points/dates/submission types touched)

1. Uploaded `computing_commons/slides/week3_containers/week3_containers.pdf`
   to this course's Files (`commons-shared/week3_containers_commons_deck.pdf`,
   file id 6579958).
2. Created a new page, **"Containers and Repeatable Environments (Shared
   Lesson)"** (`containers-and-repeatable-environments-shared-lesson`),
   rendered from the canonical Commons markdown with the deck link pointed
   at the uploaded file. Not added as a module item (kept unlinked/orphan,
   matching the compact-shell doctrine already applied to the Monday page).
3. Updated the live **"Week 03 - Week at a Glance"** page: added a "Shared
   lesson" section linking the new page, and rewrote "Important container
   boundary" to say reasoning about the boundary is required while running
   a container stays optional -- matching the corresponding source change
   in `weeks/week-03/README.md`.
4. Updated the live **"Week 03 - Architecture Investigation"** assignment
   (id 913182) `description` only: replaced the Unix-only `rm -rf /tmp/...`
   cleanup with archlab's self-managed `lab/runs/` directories, added the
   shared-lesson link, and added the required container-boundary-question
   section with the verified optional `lab/Containerfile` ("Experimental
   Chamber") build/run commands. Points (30), due date
   (2026-09-03T04:59:00Z), assignment group, and submission types
   (`online_text_entry`, `online_upload`) were read back identical
   before/after.

## Explicitly held

**"Week 03 - Explain / Defend" (id 913183) was not touched in any way.**
Confirmed via readback: name, points (10.0), due date
(2026-09-05T04:59:00Z), and submission types identical to before this pass.
The source-level "Friday as a discussion" reframe in `weeks/week-03/
friday.md` and `README.md` remains a proposal only -- the live Week at a
Glance page still describes Friday in terms of the existing assignment, not
a discussion, so it does not misrepresent what students will actually see.
This matches the explicit owner instruction to hold this conversion for a
dedicated grading-semantics decision.

## Verification

- Confirmed course identity (`75249`, `COMSC-3013-1438.2026FA`) via a fresh
  `GET` immediately before each mutation.
- Confirmed `has_submitted_submissions: false` on 913182 before editing its
  description.
- Read back every changed object after the write: page `updated_at`
  advanced; assignment `points_possible`/`due_at`/`assignment_group_id`/
  `submission_types` identical before and after; new page and file both
  resolve; module 218670's three items (`Week 03 - Week at a Glance`,
  `Week 03 - Architecture Investigation`, `Week 03 - Explain / Defend`)
  unchanged in count, order, and titles.
- Confirmed the live Week at a Glance body contains no occurrence of the
  word "discussion" (i.e. the HOLD boundary was not accidentally deployed).
