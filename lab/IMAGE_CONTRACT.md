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
| Registry publication | **PENDING** — see below |

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

## Registry publication is a returned action item

Pushing to `ghcr.io/jeremy-evert/archlab-week3-chamber:v1` was attempted
from this worker session and was blocked by the same worker action-permission
classifier documented in DSCT's `week-03/container/IMAGE_CONTRACT.md`
("publishing to an external registry is outside this worker's granted
permissions") — not a technical or design failure. Per the April host
policy (`foreman_interface` `docs/FOREMAN_HOST_ACCESS_POLICY.md`, "April is
Canvas-only"), the build was intentionally performed on `brandy`, not
`april` — no container build or push should happen on April going forward.

**Action for a maintainer with registry-push rights (Jeremy):**

```bash
# from brandy (or wherever the image above was/will be built)
gh auth login -h github.com   # or: podman login ghcr.io -u jeremy-evert  (PAT with write:packages)
podman push ghcr.io/jeremy-evert/archlab-week3-chamber:v1
podman inspect ghcr.io/jeremy-evert/archlab-week3-chamber:v1 --format '{{.Digest}}'
```

After pushing, set the GHCR package visibility to **public** (Package
settings -> Change visibility) so students can pull without instructor-only
credentials, matching `dsct-week3-latex`'s already-public state.

**When the digest is available:** update `wednesday.md`'s optional-Chamber
section (and the deployed course-75249 assignment description) to name the
pinned `ghcr.io/jeremy-evert/archlab-week3-chamber@sha256:...` reference as
an alternative to the local build, the same way DSCT's `run-latex.sh`
defaults to its published digest. Until then, the documented path (local
`podman build` from the committed `Containerfile`) remains the correct,
fully validated fallback — this image is optional enrichment either way, so
there is no student-path blocker while publication is pending, unlike
DSCT's image which is the required path.

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
