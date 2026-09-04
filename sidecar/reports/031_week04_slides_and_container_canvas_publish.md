# Week 4 slides + container → live Canvas (2026-09-04)

Owner: Jeremy Evert. Executor: Flo (April), same day as Anna's staging run
(`jobs/reports/anna_computer_architecture_week04_slides_and_container_brandy.md`
in `foreman_interface`, commit `243a672` + doc fix `187d0df`).

Reason: Jeremy is teaching Week 4 live on camera today (2:00-3:45pm) and
wants the deck and container reachable directly from the Canvas page he
opens on screen, rather than presenting from local files only.

## Target lock

- course 75249, code `COMSC-3013-1438.2026FA` ("Fall 2026 Computer
  Architecture") — verified before mutation.
- module 218671 ("Week 04 - Linux as a Machine Telescope") — pre-existing
  items confirmed to be exactly `{1527838 Week at a Glance page, 1527849
  Architecture Investigation assignment}` before this run; both unchanged
  after.

## What was added

1. `weeks/week-04/build/wednesday.pdf` (10 pages, built locally with
   `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build
   wednesday.tex`) uploaded to course Files under `slides/week_04/` as
   `week04_wednesday_slides.pdf` (Canvas file id `6585863`), placed as a
   published File module item, position 2, id `1532587`: "Wednesday slides
   — Use the operating system as a telescope".
2. New Canvas Page `optional-architecture-telescope-container` ("Optional:
   Architecture Telescope Container"), published, giving the anonymous
   `podman pull`/`podman run` commands pinned to digest
   `sha256:6844a542024050ad897bc4706229c49b721cff51f8cbfe8bff2bd04c71608580`,
   the Docker substitution note, the "optional, not required" framing, and
   a nudge toward the `lscpu`/`free`/`nproc` evidence-scope trap. Placed as
   a published Page module item, position 3, id `1532588`.

## Readback

`GET .../modules/218671/items` after the run:

```
1  Page       True  1527838  Week 04 - Week at a Glance
2  File       True  1532587  Wednesday slides — Use the operating system as a telescope
3  Page       True  1532588  Optional: Architecture Telescope Container
12 Assignment True  1527849  Week 04 - Architecture Investigation
```

Both pre-existing items unchanged (same id, same type, same published
state). No assignment, gradebook column, due date, or other-module change
made. No other course touched.

## Not done

Docker/Podman were not verified from a Canvas-facing anonymous context
beyond the digest-pull check already recorded in Anna's report and
independently reverified by Flo on April (fully logged-out `podman pull`
by digest, then a real container run producing the correct blank receipt
and demonstrating the container/host CPU-visibility confound live).

## Addendum (same day) — Explain/Defend receipt template added

Jeremy asked for the new starter template on Canvas too, ahead of his live
review. Uploaded `weeks/week-04/build/explain_defend_receipt.pdf` (built from
`weeks/week-04/explain_defend_receipt.tex`, commit `e5f7a20`) to course Files
under `slides/week_04/` as `week04_explain_defend_receipt_template.pdf`
(Canvas file id `6585869`), placed as a published File module item, position
4, id `1532589`: "Explain / Defend Receipt — starter template (fill in
before Friday)" — positioned right before the graded Architecture
Investigation assignment (position 12, unchanged).

Readback after this addition:

```
1  Page       True  1527838  Week 04 - Week at a Glance
2  File       True  1532587  Wednesday slides — Use the operating system as a telescope
3  Page       True  1532588  Optional: Architecture Telescope Container
4  File       True  1532589  Explain / Defend Receipt — starter template (fill in before Friday)
12 Assignment True  1527849  Week 04 - Architecture Investigation
```

All prior items unchanged. Note: this template still has `[FILL IN]`
markers throughout by design — it is a starting scaffold, not a finished
handout, per Jeremy's own framing when he asked for it. He is reviewing it
live before deciding whether it goes to students as-is or gets refined
first.
