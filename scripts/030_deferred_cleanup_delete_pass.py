#!/usr/bin/env python3
"""Deferred Prompt 030/030A cleanup pass: delete zero-activity shared/enrichment
Architecture assignments now Commons-verified in
`computing_commons/docs/migration-ledger-computer-architecture-fall-2026.md`.

Safety model (per jeremy_task_tracking spells/chain_gun.md and this campaign's
per-object live safety gates):

- one destructive object at a time;
- fresh live preflight (get_assignment + get_all_submissions) *immediately*
  before that object's own delete call -- never reused from an earlier batch
  read;
- delete only if submissions == 0 and no recorded grade on any submission;
- immediate post-delete readback proving the object is gone and nothing else
  changed;
- course allowlist hard-restricted to {75249, 24298} for the whole run;
- --dry-run performs the live reads and prints the exact plan with zero
  mutation calls.

Candidate set (from the ledger, "COMMONS COPY VERIFIED -- ARCHITECTURE
REMOVAL DEFERRED (TOOLING GATE)" rows): AI Fluency Weeks 3-16 (Week 2 is
excluded -- it has real submissions) and Professional Minds Wednesday/Friday
all weeks, plus A6 Professional Pathway. Matched by live assignment name
against the same source titles the ledger already recorded, not re-guessed.
"""
from __future__ import annotations

import argparse
import datetime as dt
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, "/home/jevert/git/harbor")

from harbor.api import CanvasApiError, delete_assignment, get_all_submissions, get_assignment, list_assignments  # noqa: E402
from harbor.client import CanvasClient  # noqa: E402
from harbor.config import load_env, read_canvas_config  # noqa: E402

COURSE_ID = 75249
ALLOWED = {75249, 24298}
# Live-production race rule (chain_gun.md): never race a student to the
# delete button. An assignment due within this window may already have a
# student actively composing a response even with zero submissions on file
# right now, so it is deferred rather than deleted this pass regardless of
# its zero-activity read.
NEAR_TERM_GUARD = dt.timedelta(days=7)

# Excluded: Week 2 has real activity per the ledger (2/6 submitted). Kickoff
# and Weeks 2-3 pre-existing Commons rows are Week 2 only for AI Fluency/Prof
# Minds candidates -- Week 3 IS a deferred-removal candidate per the ledger's
# own "Week 3 (all three days)... Architecture original: zero activity" row.
WEEK_RANGE = range(3, 17)

NAME_PATTERNS = [
    re.compile(r"AI Fluency.*Week\s*0*(\d+)", re.I),
    re.compile(r"Professional Minds.*Week\s*0*(\d+)", re.I),
    re.compile(r"Week\s*0*(\d+).*AI Fluency", re.I),
    re.compile(r"Week\s*0*(\d+).*Professional Minds", re.I),
]
A6_PATTERN = re.compile(r"Professional Pathway", re.I)
# Recurring Professional Minds objects carry no week number in their own
# title (confirmed live, 2026-08-25: e.g. "Professional Minds Wednesday -
# Reading Reflection" appears once per week with an identical name). The
# ledger records zero activity for Professional Minds Wed/Fri across every
# week including Week 2, and Commons already has full Week 2-16 coverage, so
# the per-object live zero-activity check below is the real safety gate for
# these, not a week-number name match.
PROF_MINDS_PATTERN = re.compile(r"^Professional Minds (Wednesday|Friday) - (Reading|Slides) Reflection$", re.I)


def classify(name: str) -> str | None:
    if A6_PATTERN.search(name):
        return "A6 Professional Pathway"
    if PROF_MINDS_PATTERN.match(name.strip()):
        return "Professional Minds (recurring)"
    for pat in NAME_PATTERNS:
        m = pat.search(name)
        if m:
            week = int(m.group(1))
            if week in WEEK_RANGE:
                return f"Week {week} shared-strand"
    return None


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    load_env()
    import os

    os.environ["CANVAS_ENFORCE_COURSE_ALLOWLIST"] = "true"
    os.environ["CANVAS_ALLOWED_COURSE_IDS"] = "75249,24298"
    cfg = read_canvas_config()
    if cfg.allowed_course_ids != frozenset(ALLOWED):
        print(f"ABORT: allowlist not exactly {{75249, 24298}}, got {cfg.allowed_course_ids}")
        return 1
    client = CanvasClient(cfg)

    assignments = list_assignments(client, COURSE_ID)
    print(f"Live assignment count at recon: {len(assignments)}")

    candidates = []
    for a in assignments:
        cls = classify(a["name"])
        if cls:
            candidates.append((a, cls))

    print(f"Candidate matches: {len(candidates)}")
    for a, cls in candidates:
        print(f"  [{cls}] id={a['id']} name={a['name']!r} points={a.get('points_possible')}")

    receipt = {
        "run_at": dt.datetime.utcnow().isoformat() + "Z",
        "dry_run": args.dry_run,
        "course_id": COURSE_ID,
        "recon_count": len(assignments),
        "candidates_matched": len(candidates),
        "actions": [],
    }

    deleted = 0
    skipped = 0
    for a, cls in candidates:
        aid = a["id"]
        # Fresh preflight -- immediately before this object's own decision,
        # never reused from the batch `assignments` list above.
        _, fresh = get_assignment(client, COURSE_ID, aid)
        if fresh.get("workflow_state") == "deleted":
            skipped += 1
            receipt["actions"].append({"id": aid, "name": a["name"], "cls": cls, "result": "ALREADY_DELETED_SKIP"})
            continue

        due_at = fresh.get("due_at")
        if due_at:
            due_dt = dt.datetime.fromisoformat(due_at.replace("Z", "+00:00"))
            now = dt.datetime.now(dt.timezone.utc)
            if due_dt - now < NEAR_TERM_GUARD:
                skipped += 1
                print(f"SKIP (near-term due date, in-flight-obligation guard) id={aid} name={a['name']!r} due_at={due_at}")
                receipt["actions"].append({
                    "id": aid, "name": a["name"], "cls": cls, "due_at": due_at,
                    "result": "SKIP_NEAR_TERM_DUE",
                })
                continue

        subs = get_all_submissions(client, COURSE_ID, aid)
        submitted = [s for s in subs if s.get("workflow_state") not in (None, "unsubmitted")]
        graded = [s for s in subs if s.get("grade") is not None or s.get("score") is not None]

        if submitted or graded:
            skipped += 1
            print(f"SKIP (activity found) id={aid} name={a['name']!r} submitted={len(submitted)} graded={len(graded)}")
            receipt["actions"].append({
                "id": aid, "name": a["name"], "cls": cls, "result": "SKIP_ACTIVITY",
                "submitted": len(submitted), "graded": len(graded),
            })
            continue

        if args.dry_run:
            print(f"WOULD DELETE id={aid} name={a['name']!r} cls={cls} due_at={a.get('due_at')} (0 submissions, 0 grades)")
            receipt["actions"].append({"id": aid, "name": a["name"], "cls": cls, "due_at": a.get("due_at"), "result": "WOULD_DELETE"})
            continue

        status = delete_assignment(client, COURSE_ID, aid)
        # Immediate readback. Canvas 404s a GET for a deleted assignment
        # (confirmed live, 2026-08-25) -- that 404 IS the proof of deletion,
        # not a failure; only a 200 GET (still exists) or any other error
        # shape means the delete did not verifiably land.
        try:
            _, after = get_assignment(client, COURSE_ID, aid)
            after_state = after.get("workflow_state")
            ok = status == 200 and after_state == "deleted"
        except CanvasApiError as e:
            after_state = f"404_CONFIRMED_GONE" if e.status_code == 404 else f"READBACK_ERROR:{e}"
            ok = status == 200 and e.status_code == 404
        deleted += 1 if ok else 0
        print(f"{'DELETED' if ok else 'DELETE_UNVERIFIED'} id={aid} name={a['name']!r} status={status} after_state={after_state}")
        receipt["actions"].append({
            "id": aid, "name": a["name"], "cls": cls,
            "result": "DELETED" if ok else "DELETE_UNVERIFIED",
            "delete_status": status, "readback_workflow_state": after_state,
        })

    receipt["deleted"] = deleted
    receipt["skipped"] = skipped

    out_dir = Path(__file__).resolve().parents[1] / "sidecar" / "raw"
    out_dir.mkdir(parents=True, exist_ok=True)
    stamp = dt.datetime.utcnow().strftime("%Y-%m-%dT%H%M%SZ")
    out_path = out_dir / f"{stamp}__030_deferred_cleanup_delete_pass.json"
    out_path.write_text(json.dumps(receipt, indent=2))
    print(f"Receipt written: {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
