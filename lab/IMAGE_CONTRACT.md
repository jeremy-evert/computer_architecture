# Week 3 "Experimental Chamber" image — operational contract

Maintainer-facing record for the image built from `lab/Containerfile`, the
optional-execution container path referenced by
`weeks/week-03/wednesday.md` and the shared Computing Commons containers
lesson. Students are never required to build or run this image (the
required Week 3 execution path is native `archprobe`, with a course-provided
fallback receipt) — this is the *optional enrichment* path, and the shared
lesson's worked example for students who cannot run it themselves.

## What this image is

`lab/Containerfile` bakes the full archlab toolchain (`python3`,
`python3-matplotlib`, `gcc`/`make`/`binutils`/`gdb`, `clang`/`llvm`/`lld`,
`texlive-latex-base`/`texlive-latex-recommended`/`latexmk`) plus a copy of
this repository's `lab/` tree into a `debian:trixie-slim` base, so
`archlab`/`archprobe`/`archplot` are runnable inside the container exactly
as they are natively. Doctrine home: `lab/CONTRACT.md`'s "Observatory vs
Experimental Chamber" section — this image *is* the Experimental Chamber.

## Current status (2026-09-01)

| Field | Value |
| --- | --- |
| Recipe | `lab/Containerfile` |
| Recipe hash (SHA-256) | `0a4b04dd32582fece4cff00ab359e8b5896fe5ac0ed945b35921d55b19fdef58` |
| Base image | `debian:trixie-slim` |
| Build context | `lab/` itself (not the repo root — `COPY . /opt/archlab` copies whatever the context is) |
| Repository commit | `6aca359` |
| Build host | `brandy`, Rocky Linux 9.6, x86_64 |
| Build/runtime | rootless Podman 5.4.0 |
| Build command | `cd lab && podman build -t localhost/archlab-week3-chamber:v1 -f Containerfile .` |
| Local immutable image ID | `sha256:459e51d084492b4b4f615fb5081e6e0a0e1d13b61faecb8f113752454608c2d4` |
| Image size | ~1.40 GB |
| Registry publication | **PUBLISHED 2026-09-01** — `ghcr.io/jeremy-evert/archlab-week3-chamber@sha256:a12ed368e830bb90087b925be726d6967e6024c3d613644c4af21cb91bfc6a5c` (tag `v1`), package visibility **public**, anonymous pull independently verified. See "Registry publication (2026-09-01)" below. |

## Verification performed on `brandy`

`archlab doctor` inside the container reports the expected local toolchain
(`gcc`, `clang`, `latexmk`, `pdflatex`, `matplotlib`; no `podman`/`mpicc`/
`qemu-riscv*`/`tectonic` inside the container itself, as expected for this
scope).

`archprobe` was run inside the container with the exact command documented
in `weeks/week-03/wednesday.md`:

```bash
mkdir -p lab/runs/chamber
podman run --rm --userns=keep-id \
  --mount "type=bind,source=$PWD/lab/runs/chamber,target=/work,relabel=private" \
  -w /work localhost/archlab-week3-chamber:v1 archprobe --out-dir /work
```

**First attempt used `-v "$PWD/...:/work"` (short bind syntax, no SELinux
relabel) and failed** with `PermissionError: [Errno 13] Permission denied:
'/work/machine.json'` on this Rocky/SELinux host, even though the identical
short-syntax command worked without error on an Ubuntu host (april) earlier
in the same session. This is the same class of SELinux bind-mount issue
DSCT's `run-latex.sh` already handles with `relabel=private` — fixed by
switching to the `--mount type=bind,...,relabel=private` form, matching
DSCT's pattern, then reverified clean on this host. `wednesday.md` and the
live Week 03 - Architecture Investigation assignment description
(course 75249, assignment 913182) were updated with the corrected command
before this record was written, so the bug never reached a student.

Confirmed receipt content after the fix (host-visible, non-root-owned):

```
SWOSU Architecture Observatory
Scope: host-visible
OS: Debian GNU/Linux 13 (trixie)
Architecture: x86_64
...
Receipt: /work/machine.json
```

## Registry publication (2026-09-01)

Pushing to `ghcr.io/jeremy-evert/archlab-week3-chamber:v1` was attempted
from this worker session and blocked twice by the same worker
action-permission classifier documented in DSCT's
`week-03/container/IMAGE_CONTRACT.md` -- not a technical or design failure.
Per the April host policy (`foreman_interface`
`docs/FOREMAN_HOST_ACCESS_POLICY.md`, "April is Canvas-only"), the build was
intentionally performed on `brandy`, not `april`.

Jeremy refreshed the GitHub credential on `brandy` (`gh auth login -h
github.com`, device flow, scopes `write:packages`/`read:packages`) and
pushed the image by hand from a session running directly on that host.

| Field | Value |
| --- | --- |
| Credential | `gh auth login -h github.com` as `jeremy-evert`; `gh auth token \| podman login ghcr.io -u jeremy-evert --password-stdin` -> `Login Succeeded!` |
| Push | `podman push ghcr.io/jeremy-evert/archlab-week3-chamber:v1` (from `localhost/archlab-week3-chamber:v1`, config `sha256:459e51d084492b4b4f615fb5081e6e0a0e1d13b61faecb8f113752454608c2d4`) |
| Published tag | `ghcr.io/jeremy-evert/archlab-week3-chamber:v1` |
| **Manifest digest (operational pin)** | `sha256:a12ed368e830bb90087b925be726d6967e6024c3d613644c4af21cb91bfc6a5c` |
| Package visibility | **public** (`gh api /users/jeremy-evert/packages/container/archlab-week3-chamber` -> `"visibility":"public"`; first attempt silently failed to save, caught by re-checking the API rather than trusting the UI click, then fixed) |
| Package page | <https://github.com/users/jeremy-evert/packages/container/package/archlab-week3-chamber> |

**Independently reverified from a second angle** (this worker, after the
human push, not reusing the pusher's own confirmation):

- resolved `v1` -> digest directly against the GHCR registry API
  (`docker-content-digest` header), matching the digest above exactly;
- confirmed `GET` on that manifest digest returns `200`;
- on `brandy`: removed every local image/tag for this repo, logged out of
  `ghcr.io`, then a genuine anonymous `podman pull` by the exact digest
  succeeded, with the pulled config digest (`459e51d0...`) matching the
  original build;
- ran `archlab doctor` and `archprobe` (using the corrected
  `relabel=private` mount command below) against that freshly-pulled image
  -- both succeeded, receipt written cleanly to the bind-mounted,
  host-visible folder.

The operational, course-facing reference is therefore:

```
ghcr.io/jeremy-evert/archlab-week3-chamber@sha256:a12ed368e830bb90087b925be726d6967e6024c3d613644c4af21cb91bfc6a5c
```

`weeks/week-03/wednesday.md`'s optional-Chamber section now offers this
pinned digest as an alternative to the local build (see below); the local
`podman build` path remains documented as the offline fallback. This image
stays *optional enrichment*, not the required Week 3 execution path, so
there was no student-path blocker while publication was pending.

## Reproducing the build

```bash
cd lab
podman build -t localhost/archlab-week3-chamber:v1 -f Containerfile .
```

Note the build context is `lab/`, not the repository root.

## Provenance note

`lab/Containerfile` is the original pattern DSCT's own Week 3 LaTeX image
(`ghcr.io/jeremy-evert/dsct-week3-latex`) was trimmed from (see that image's
`IMAGE_CONTRACT.md` "Provenance note"). This file is that relationship's
other half: the full, untrimmed toolchain image, now itself built,
verified, and pending the same publication step.
