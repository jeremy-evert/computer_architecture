# Computer Architecture Week 4 — teaching-ready pass (Ivy, no Canvas)

Date: 2026-09-07
Role: Ivy, the Foreman Intern (Maise, Claude Code)
Manager: Flo. Review: April, then Flo.
Branch: `ivy/comparch-week04-monday`
Work file: `jobs/tasks/ivy_comparch_week04_ready.md`, part of
`jobs/tasks/week04_readiness_campaign.md`

## Starting state (source commits read)

- `computer_architecture` `main` at `e9132c4` (fetched fresh from origin
  before branching; worktree created at
  `/mnt/nora/git/worktrees/computer_architecture-ivy-week04` off
  `origin/main`, not the canonical checkout).
- Read in full: `weeks/week-04/README.md`, `monday.md`, `wednesday.md`,
  `friday.md`, `_instructor.md`, `_validation.md`, `references.md`, and
  `planning/week-04.md`.
- Read `lab/CONTRACT.md`, `lab/PLATFORM_SUPPORT.md`, `lab/Containerfile`,
  `lab/Makefile`, and `lab/archlab/probe.py` (the scope-detection logic
  behind `archprobe`'s host-visible/container-visible/wsl-visible label).
- Read `sidecar/reports/031_week04_slides_and_container_canvas_publish.md`,
  which showed the optional container enrichment (the pinned
  `archlab-week4-telescope` GHCR image) was already independently pulled
  and run to completion on **April** by Flo on 2026-09-04, and is already
  live on Canvas as an optional page. That fact shaped this mission: it
  meant the container/VM demonstration asked for in the work file did not
  need to be re-proven end to end from scratch — the required (non-container)
  student path did, since `_validation.md` still carried a YELLOW asking for
  "Week 4 command smoke on named release host."

Content coming in was already substantively good: the decompose-the-task
framing, the archprobe-first Observatory instruction, and the Explain/Defend
structure were all present and correct. What was missing was concreteness —
neither Wednesday nor Friday had a worked example connecting a subquestion to
an actual command, an actual expected output shape, and an actual
observation-vs-interpretation distinction — and the release smoke called for
in `_validation.md` had never been executed and recorded.

## What changed and why

1. **`weeks/week-04/wednesday.md`** — added a worked decomposition table
   (subquestion -> instrument -> expected shape of output ->
   observation-vs-interpretation note) covering all six subquestions already
   listed in step 1, and a fully worked example receipt (AVX2 flag claim,
   deliberately distinct from the pre-existing `platform.machine()` example
   and from the assignment) so students see one complete receipt before
   writing their own. Why: the mission asked explicitly for "each with the
   actual command(s), expected shape of output, and how to tell observation
   from interpretation" — the prior text named the subquestions but not the
   instrument-to-shape mapping.
2. **`weeks/week-04/friday.md`** — added a third worked Explain/Defend
   example (`file /bin/sh` -> "is `/bin/sh` really its own shell?"),
   distinct from both Wednesday examples so it doesn't hand students the
   graded claim, and written to make the fast-thinking trap ("it's called
   `sh`, so it behaves like `sh` everywhere") concrete rather than abstract.
3. **`weeks/week-04/_validation.md`** — recorded the actual release-smoke
   result on a named host (maise, 2026-09-07: PASS) and separated that from
   the still-YELLOW container/VM enrichment status, with a pointer to the
   April verification already on record so nobody re-reads this as "the
   container path is broken." Status moved from YELLOW to GREEN-for-the-
   required-path; the container-enrichment YELLOW is kept, correctly scoped,
   rather than erased.
4. **`lab/validation/2026-09-07-maise-week04-smoke.json`** — new durable
   validation receipt, following the existing
   `lab/validation/2026-08-16-native-linux-smoke.json` schema/convention,
   scoped explicitly to Week 4 (not a claim about weeks 5-14).
5. **`sidecar/raw/20260907T193500Z__week04_wednesday_maise_demonstration.raw.txt`**
   — the raw command transcript behind the JSON receipt and the worked
   examples in `wednesday.md`/`friday.md`, so every number quoted in the
   teaching material traces to an actual run, not an invented example.

Nothing else in `weeks/week-04/` or `planning/week-04.md` was touched.
Grading weights, the Machine Dossier handoff (still explicitly closed until
Week 5 — `README.md`'s "Action: NO CHANGE" line and `_validation.md`'s
Dossier checkbox are both untouched), and every other week's content were
left alone.

## The demonstration receipt: how it was produced

Ran, on Maise, as the ordinary logged-in user, no root, no paid tool:

```bash
./lab/bin/archprobe --out-dir /tmp/arch-week04-demo
uname -a
uname -m
lscpu
free -h
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head
file /bin/sh
printf 'ABC\n' > /tmp/arch-week04-bytes.txt && od -An -tx1 -c /tmp/arch-week04-bytes.txt
```

Every instrument in Wednesday's required (non-container) instruction set
completed and produced the expected shape of output. `archprobe` correctly
self-labeled the run `Scope: host-visible` (verified by reading
`lab/archlab/probe.py`'s detection logic: it checks `/.dockerenv` and
`/proc/1/cgroup` for container markers, neither of which was present, so the
label is accurate, not just plausible). Also ran the exact
`weeks/week-04/_validation.md` release-smoke command sequence directly:
PASS. Full transcript is in the raw fixture above; the JSON receipt records
host details, per-command status, and scope notes.

## Container/VM angle — what I did and did not do, honestly

The work file authorized building/running containers or VMs on Maise for
this demonstration. I checked first: **Maise has no container or VM engine
installed.** `podman` and `docker` are both absent (`podman` is an apt
*candidate* package, not installed); there is no `qemu-system-x86_64`, no
`lxc`, no `containerd`. Installing any of these needs interactive `sudo`
(confirmed: `sudo -n true` fails with "interactive authentication is
required"), which this session does not hold and which I did not attempt to
work around — that would be a credential action outside my authority, not a
prep step I can do myself.

This is not a new finding — `lab/PLATFORM_SUPPORT.md` already carries
"Docker/Podman Containerfile: YELLOW — no Docker/Podman runtime was
available on the validation surface," and a separate GPU-Showdown-campaign
session independently found the same thing on this host. What *is* new here
is confirming it specifically on Maise, on this date, and — more
importantly — confirming that the optional `archlab-week4-telescope` image
does not need to be re-proven from Maise at all, because Flo already pulled
and ran the exact pinned digest to completion on April
(`sidecar/reports/031_week04_slides_and_container_canvas_publish.md`,
2026-09-04) and it is already published to Canvas as optional enrichment.
Re-attempting that here would have been redundant even if Maise had a
container engine.

I noticed Maise does have unprivileged user namespaces and `bubblewrap`
(`bwrap`) available, which is a real, rootless, no-sudo sandboxing
primitive. I tested that it works (`sysctl kernel.unprivileged_userns_clone
= 1`; a `bwrap --unshare-all` invocation ran successfully). I chose **not**
to dress this up as a stand-in "container demonstration" for the course
record: it isn't Podman/Docker, its cgroup path (`0::/`) wouldn't trip
`archprobe`'s own container-detection logic, and quietly relabeling a
bubblewrap sandbox as container evidence would be exactly the kind of
overclaim Week 4 is teaching students to avoid. I'm noting it here only as
a fact for Flo/Jeremy in case a genuinely rootless container story is ever
wanted on Maise later.

**Net:** the required (no-container) Wednesday/Friday path is now
demonstrated end to end on a real, named host with a durable receipt. The
optional container path remains independently proven, just not
re-proven from Maise, and that gap is recorded rather than hidden.

## Equity check

The `archprobe`/fallback path was not weakened or made hardware-dependent.
Both new worked examples (AVX2 flag, `/bin/sh` symlink target) use ordinary
CPU flags and filesystem metadata available on any supported Linux
environment — no GPU, no premium hardware, no paid tool. `lab/CONTRACT.md`'s
"Required access rule" (CPU-only, no-root, no-paid-tool,
no-private-infrastructure) is unaffected by every change in this pass.

## YELLOWs carried forward

- Container/VM enrichment: proven on April, not re-proven from Maise
  (Maise has no container engine; installing one needs credentials Ivy does
  not hold). Not a blocker for the required path.
- `lab/bin/archlab doctor` fails on Maise for `matplotlib` and RISC-V
  cross-compile — both irrelevant to Week 4 (they gate weeks 6-13) and out
  of this mission's scope by instruction ("do not touch other weeks").
  Recorded for whoever eventually validates those weeks on Maise, not acted
  on here.

## Forbidden-list compliance

No Canvas/Instructure contact of any kind. No `harbor` or course-deployment
tooling invoked. No commit to `main`; everything is on
`ivy/comparch-week04-monday`. Grading weights, the Machine Dossier handoff,
and Week 5+ content are unchanged. Only `weeks/week-04/`, one new
`lab/validation/` receipt, and one new `sidecar/raw/` fixture were touched.

## Stop

Pushing `ivy/comparch-week04-monday` now. Stopping for April review, then
Flo approval — Flo handles any Canvas step per the campaign's seat split.

IVY COMPARCH W4 READY FOR REVIEW
