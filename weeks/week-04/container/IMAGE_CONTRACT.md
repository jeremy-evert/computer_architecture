# Week 4 Architecture Telescope image — operational contract

Maintainer-facing record for the optional Linux instrument environment
referenced by `weeks/week-04/wednesday.md`.

## What this image is

The image is a small `debian:bookworm-slim` user space with the Week 4
instrument set: `bash`, `coreutils` (`uname`, `od`), `file`, `procps` (`ps`,
`free`), and `util-linux` (`lscpu`). Its entrypoint prints a blank observation
receipt with fields for Question, Instrument, Observation, Interpretation,
Boundary, and Revision. It intentionally does not run `archprobe`, populate
observations, interpret evidence, or solve the Friday Explain / Defend task.

## Immutable publication

| Field | Value |
| --- | --- |
| Recipe | `weeks/week-04/container/Containerfile` |
| Base image | `debian:bookworm-slim` |
| Build context | `weeks/week-04/container/` |
| Build host/runtime | Brandy, rootless Podman |
| Local tag | `localhost/archlab-week4-telescope:v1` |
| Published image | `ghcr.io/jeremy-evert/archlab-week4-telescope:v1` |
| Manifest digest | `sha256:6844a542024050ad897bc4706229c49b721cff51f8cbfe8bff2bd04c71608580` |
| OCI source label | `https://github.com/jeremy-evert/computer_architecture` |
| Visibility | **Public — verified 2026-09-04** |

The manifest was pushed with `podman push --digestfile`. The package is
public: a pull token was requested with zero credentials, and a manifest GET
against the exact digest above using that anonymous token returned HTTP 200
(schema version 2). This image is student-ready.

## Build and smoke evidence

```bash
podman build -t localhost/archlab-week4-telescope:v1 \
  -f weeks/week-04/container/Containerfile weeks/week-04/container
```

The Containerfile's build-time `architecture-telescope --smoke` passed and
checked that `uname`, `lscpu`, `free`, `ps`, `file`, and `od` were available.
An interactive runtime smoke was separately attempted but this shell's
rootless runtime directory was read-only; the build-time smoke is the
successful required check recorded for this run.
