# Week 4 authoring / execution validation

**Status:** GREEN for the required (non-container) student path - Week 4 command smoke executed end to end on a named release host (maise, 2026-09-07). Container/VM enrichment remains a separate, already-independently-verified YELLOW (see below); it does not gate the required path.

- [x] Labor Day removes the Monday requirement.
- [x] AI Fluency Lens 4 is folded into Wednesday rather than creating holiday make-up work.
- [x] Professional Minds topics match the accepted semester design.
- [x] required course Observatory path already exists and was validated in Prompt 003.
- [x] Linux commands are observation instruments, not memorization requirements.
- [x] non-Linux/fallback path preserves the reasoning task.
- [x] no root/admin requirement.
- [x] Machine Dossier remains closed until Week 5.
- [x] Wednesday's full required instrument set (`archprobe`, `uname -a`, `uname -m`, `lscpu`, `free -h`, `ps`, `file`, `od`) executed end to end on a named host (maise) with no root and no paid tool; receipt: `lab/validation/2026-09-07-maise-week04-smoke.json`.

Release smoke:

```bash
./lab/bin/archprobe --out-dir /tmp/arch-week04
cat /tmp/arch-week04/machine.txt
uname -m || true
```

Result on maise (2026-09-07): PASS. See `lab/validation/2026-09-07-maise-week04-smoke.json` for the full command set, raw shapes observed, and scope notes.

Optional Linux commands should be checked on the recording host but may not become cross-platform release gates.

## Container/VM enrichment status (separate from the required path)

The optional `archlab-week4-telescope` GHCR image is enrichment, not the
required path (`lab/CONTRACT.md`'s "Required access rule": CPU-only,
no-root, no-paid-tool, no-private-infrastructure). Two independent facts,
neither of which changes the required-path GREEN above:

- It was already pulled and run to completion on April by Flo (fully
  logged-out `podman pull` by digest, then a live run producing the correct
  blank receipt) — see
  `sidecar/reports/031_week04_slides_and_container_canvas_publish.md`.
- It could not be re-exercised on maise in this pass: maise has neither
  `podman` nor `docker` installed, and installing either needs interactive
  `sudo` this session does not hold. This matches the standing
  `lab/PLATFORM_SUPPORT.md` row ("no Docker/Podman runtime was available on
  the validation surface").

Net: the required Wednesday/Friday path is release-ready on a real host.
The optional container path is independently proven elsewhere; it is not
independently reproduced from maise specifically.
