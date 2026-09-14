#!/usr/bin/env python3
"""Fix Architecture's front page: H1/week-rail already say Week 5, but
"This week" and "Go here first" were never advanced past Week 4 --
confirmed live before writing this script.
"""
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path.home() / "git" / "harbor"))
from harbor import api
from harbor.client import CanvasClient
from harbor.config import load_env, read_canvas_config

COURSE_ID = 75249
EVIDENCE = Path.home() / "git" / "computer_architecture" / "sidecar" / "reports" / "advance_current_week_to_5.md"

OLD_SUMMARY = "<p>This week's central machine question: how do I ask the operating system what this computer is and what it is doing? Commands are observation instruments, not memorization targets.</p>"
NEW_SUMMARY = "<p>This week's central machine question: what should I build for this workload, what does each part buy me, and how should I compare choices?</p>"

OLD_GO_HERE = '''<div style="margin: 18px 0; padding: 10px 14px; border: 1px solid #999; border-radius: 6px; background: #f4f4f4;">
  <h2 style="margin-top: 0;">Go here first</h2>
  <a href="https://swosu.instructure.com/courses/75249/pages/week-04-week-at-a-glance" style="display: inline-block; margin-top: 6px; padding: 3px 10px; border: 1px solid #17335c; border-radius: 4px; text-decoration: none; color: #17335c; background: #eaf1fb;" data-api-endpoint="https://swosu.instructure.com/api/v1/courses/75249/pages/week-04-week-at-a-glance" data-api-returntype="Page">Week 4 at a Glance →</a>
  <a href="https://swosu.instructure.com/courses/75249/discussion_topics/542909" style="display: inline-block; margin-top: 6px; margin-left: 8px; padding: 3px 10px; border: 1px solid #17335c; border-radius: 4px; text-decoration: none; color: #17335c; background: #eaf1fb;" data-api-endpoint="https://swosu.instructure.com/api/v1/courses/75249/discussion_topics/542909" data-api-returntype="Discussion">Week 04 — Architecture Investigation (graded discussion) →</a>
</div>'''
NEW_GO_HERE = '''<div style="margin: 18px 0; padding: 10px 14px; border: 1px solid #999; border-radius: 6px; background: #f4f4f4;">
  <h2 style="margin-top: 0;">Go here first</h2>
  <a href="https://swosu.instructure.com/courses/75249/pages/week-05-week-at-a-glance" style="display: inline-block; margin-top: 6px; padding: 3px 10px; border: 1px solid #17335c; border-radius: 4px; text-decoration: none; color: #17335c; background: #eaf1fb;" data-api-endpoint="https://swosu.instructure.com/api/v1/courses/75249/pages/week-05-week-at-a-glance" data-api-returntype="Page">Week 5 at a Glance →</a>
  <a href="https://swosu.instructure.com/courses/75249/discussion_topics/543066" style="display: inline-block; margin-top: 6px; margin-left: 8px; padding: 3px 10px; border: 1px solid #17335c; border-radius: 4px; text-decoration: none; color: #17335c; background: #eaf1fb;" data-api-endpoint="https://swosu.instructure.com/api/v1/courses/75249/discussion_topics/543066" data-api-returntype="Discussion">Week 05 — Architecture Investigation (graded discussion), due 9/19 →</a>
</div>'''

SUBSTITUTIONS = [
    ("this-week summary", OLD_SUMMARY, NEW_SUMMARY),
    ("go-here-first box", OLD_GO_HERE, NEW_GO_HERE),
]


def die(msg):
    print("STOP:", msg)
    sys.exit(2)


def main():
    load_env()
    client = CanvasClient(read_canvas_config(enforce_course_allowlist=True))
    ev = ["", "## Architecture front page: advance This-week/Go-here-first to Week 5 — %s UTC" % time.strftime("%Y-%m-%dT%H:%M:%S")]

    if not client.config.api_base_url.startswith("https://swosu.instructure.com"):
        die("base_url not SWOSU")
    course = client.get(f"/api/v1/courses/{COURSE_ID}").json()
    if course.get("id") != COURSE_ID:
        die("course identity mismatch: %r" % course.get("name"))
    ev.append("- course: %s / %s" % (course["id"], course["name"]))

    fp_before = client.get(f"/api/v1/courses/{COURSE_ID}/front_page").json()
    body = fp_before.get("body") or ""
    page_url = fp_before["url"]

    if "discussion_topics/543066" in body and "week-04-week-at-a-glance" not in body:
        die("front page already advanced -- nothing to do (idempotent guard)")

    for label, old, new in SUBSTITUTIONS:
        if old not in body:
            die("expected content for %r not found -- front page changed since this script was written" % label)
        body = body.replace(old, new)
        ev.append("- applied: %s" % label)

    status, _ = api.update_page(client, COURSE_ID, page_url, {"wiki_page[body]": body})
    ev.append("- update_page status %s" % status)

    fp_after = client.get(f"/api/v1/courses/{COURSE_ID}/front_page").json()
    live_body = fp_after.get("body") or ""
    if live_body != body:
        die("readback mismatch: live front page body does not match what was sent")
    ev.append("- readback OK: live front page body matches exactly what was sent")

    EVIDENCE.parent.mkdir(parents=True, exist_ok=True)
    with EVIDENCE.open("a", encoding="utf-8") as f:
        f.write("\n".join(ev) + "\n")
    print("\n".join(ev))
    print("\nDONE. Evidence appended to %s" % EVIDENCE)


if __name__ == "__main__":
    main()
