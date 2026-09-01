# Week 3 - Containers & Repeatability

> **Central machine question:** How do I make a systems experiment run the same way twice and on another computer?

## Week at a Glance

**Prior belief we are testing/refining:** if code is unchanged, another machine should naturally reproduce the same experiment.

**Prediction before measurement:** name three pieces of environment context another person would need to reproduce a small systems experiment.

**AI Fluency:** Lens 3 - Plan the Work.
**Professional Minds:** Wednesday - *Limitless Mind*; Friday - *Resilience Education*.

| Day | Mode | What happens | Evidence |
|---|---|---|---|
| Monday | Think / Frame | Build a reproducibility contract | reproduction plan |
| Wednesday | Investigate / Break / Measure | Run the course laboratory health/probe path twice, then reason about the container boundary | reproducibility receipt |
| Friday | Explain / Defend | Separate controlled environment facts from uncontrolled host facts; compare with classmates | bounded reproducibility claim (discussion) |

## Shared lesson

Start with the shared Computing Commons module:
`computing_commons/curriculum/containers-and-repeatable-environments.md`
(deck: `computing_commons/slides/week3_containers/week3_containers.pdf`). It
teaches repeatability, reproducibility, image vs. container, pinned digest
identity, and bind mounts once for Architecture, DSCT, and Commons alike.

## Important container boundary

Reasoning about the container boundary is **required** this week: you must
be able to say which facts a container would most likely hold constant and
which would still depend on the host, using the shared lesson's published
example even if you cannot run a container yourself. **Actually running a
container is not required** for the base Week 3 path — the course
laboratory's repository-local wrappers (`archprobe` on your native machine)
are the validated required execution path, with a course-provided fallback
receipt for machines that cannot run them at all. Building/running this
course's own `lab/Containerfile` locally is optional enrichment once the
executing platform proves it.

## Machine Dossier handoff

**Action: NO CHANGE.** Week 3 establishes the laboratory contract the dossier will later rely upon.

## Student path

1. Complete Monday's reproducibility-contract prediction using the prior belief, prediction, and evidence checklist above. Monday's content lives on this page; there is no separate page to open.
2. Run the bounded laboratory check and submit the **Week 03 - Architecture Investigation** assignment (Wednesday).
3. Explain the reproducibility boundary and post to the **Week 03 - Explain / Defend** discussion, then respond to at least two classmates (Friday).

## Required materials

- course repository/laboratory files;
- ordinary CPU computer;
- shell capable of running the provided wrappers or the course-provided fallback receipt;
- no Docker/Podman requirement, no GPU, no paid AI.
