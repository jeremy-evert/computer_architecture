# Computer Architecture container workbench

A dedicated Podman image for Computer Architecture: Debian bookworm-slim
plus `gcc`, `binutils`, `objdump`, `readelf`, `strace`, and Python 3. Your
repository is bind-mounted at `/workspace`, and the built-in probe writes a
timestamped receipt to `evidence/container-architecture/`.

This is optional enrichment. It does not replace `archprobe` and does not
modify `lab/Containerfile`.

## Fastest path: pull the published image

A pinned copy of this image is already published and public. If you just
want to run it, you do not need to build anything:

```powershell
podman pull ghcr.io/jeremy-evert/computer-architecture-lab:week03
podman run --rm --volume ${PWD}:/workspace:Z --workdir /workspace ghcr.io/jeremy-evert/computer-architecture-lab:week03 arch-container-probe
```

Using Docker instead of Podman? Same commands, `docker` instead of `podman`.

That tag currently resolves to:

```text
sha256:8540729dfc3ea9e53ff6ee8df756bf0d5aaace0bbd970b9a6d33bbeacbe7bca0
```

Prefer the digest form for anything you actually need to reproduce, since a
tag can move and a digest cannot:

```powershell
podman pull ghcr.io/jeremy-evert/computer-architecture-lab@sha256:8540729dfc3ea9e53ff6ee8df756bf0d5aaace0bbd970b9a6d33bbeacbe7bca0
```

## Build it yourself instead

Run this from the repository root (PowerShell):

```powershell
.\scripts\computer-architecture-container.ps1 -Mode Setup
```

That one command writes the `Containerfile` and probe script, builds the
image, and runs the probe once. Later, you only need:

```powershell
.\scripts\computer-architecture-container.ps1 -Mode Probe
```

## All modes

```powershell
.\scripts\computer-architecture-container.ps1 -Mode Setup
.\scripts\computer-architecture-container.ps1 -Mode Build
.\scripts\computer-architecture-container.ps1 -Mode Probe
.\scripts\computer-architecture-container.ps1 -Mode Shell
.\scripts\computer-architecture-container.ps1 -Mode Status
.\scripts\computer-architecture-container.ps1 -Mode Push
.\scripts\computer-architecture-container.ps1 -Mode Clean
.\scripts\computer-architecture-container.ps1 -Mode Help
```

| Mode | What it does |
|---|---|
| `Setup` | First run. Writes the container files, builds the image, runs the probe once. |
| `Build` | Regenerate the container files and rebuild the image. |
| `Probe` | Run the reproducibility probe and save a new timestamped receipt. |
| `Shell` | Enter an interactive shell inside the image. Type `exit` to leave. |
| `Status` | Show the built image's identity and list saved evidence files. |
| `Push` | Publish the image to GHCR so another machine can pull it. |
| `Clean` | Remove the built image only. Source files and evidence are kept. |
| `Help` | Print this same reference in the terminal. |

## If something goes wrong

- **`Podman is not available on PATH`** -- install Podman Desktop, then
  restart your terminal so it picks up the updated `PATH`.
- **`Podman is installed but not ready`** -- run `podman info` by itself
  and read the actual error. On Windows this is almost always the Podman
  machine not running yet: `podman machine start`.
- **`podman info --format '...'` throws a template error** -- this is a
  known Podman-on-Windows/WSL quirk with certain format strings on some
  Podman versions. It does not mean anything is broken. Run
  `podman info` with no `--format` argument instead to see the same
  information in plain text.
- **A container edit doesn't show up** -- editing `arch-container-probe.sh`
  or the `Containerfile` does not change an image you already built. Run
  `-Mode Build` again after every edit.
- **`podman login ghcr.io` returns `403 Forbidden`** -- use a **classic**
  personal access token (not fine-grained) scoped to `write:packages`, and
  paste it at the hidden `Password:` prompt, never your real GitHub
  password. If your GitHub account is part of an SSO-enforcing
  organization, the token also needs to be authorized for that
  organization.
- **A second machine can't pull the pushed image** -- new GitHub packages
  are private by default. To let anyone pull without logging in: GitHub
  profile -> Packages -> the package -> Package settings -> change
  visibility to Public.
- **Never put a token** in the `Containerfile`, this README, a script,
  chat, or directly on the command line. It only belongs at the hidden
  password prompt.

## Recommended Week 03 evidence sequence

```powershell
.\scripts\computer-architecture-container.ps1 -Mode Setup
.\scripts\computer-architecture-container.ps1 -Mode Probe
.\scripts\computer-architecture-container.ps1 -Mode Probe
.\scripts\computer-architecture-container.ps1 -Mode Status
```

Two probe runs, one after another, give you two receipts to compare -- the
same reproducibility habit the rest of Week 03 uses with `archprobe`.
