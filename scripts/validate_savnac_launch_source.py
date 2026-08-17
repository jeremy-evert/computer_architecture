#!/usr/bin/env python3
"""Validate the Architecture-local source needed by the full Savnac compiler.

This validator is local-only. It makes no Canvas/network calls and changes no
machine configuration. It proves the newly-authored semester shells against the
already-existing course laboratory, then emits a raw Markdown receipt.
"""

from __future__ import annotations

import datetime as dt
import os
import platform
import subprocess
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REQUIRED = [
    "weeks/week-02/README.md",
    "weeks/week-02/monday.md",
    "weeks/week-02/monday.tex",
    "weeks/week-02/wednesday.md",
    "weeks/week-02/friday.md",
    "weeks/week-03/README.md",
    "weeks/week-03/monday.md",
    "weeks/week-03/monday.tex",
    "weeks/week-03/wednesday.md",
    "weeks/week-03/friday.md",
    "weeks/week-04/README.md",
    "weeks/week-04/wednesday.md",
    "weeks/week-04/friday.md",
    "weeks/week-15/README.md",
    "weeks/week-17/README.md",
    "assignments/A6-professional-pathway-artifacts.md",
    "assignments/A7-final-reflection.md",
    "docs/course-evaluation.md",
]
PLACEHOLDERS = ("REPLACE", "Week NN", "WEEK TITLE")


def run(command: list[str], *, cwd: Path = ROOT) -> subprocess.CompletedProcess[str]:
    return subprocess.run(command, cwd=cwd, check=True, capture_output=True, text=True)


def git_head() -> str:
    return run(["git", "rev-parse", "HEAD"]).stdout.strip()


def check_sources() -> list[str]:
    checks: list[str] = []
    for relative in REQUIRED:
        path = ROOT / relative
        if not path.is_file():
            raise RuntimeError(f"missing required source: {relative}")
        checks.append(f"GREEN — source exists: `{relative}`")
    for week in (2, 3, 4, 15, 17):
        week_root = ROOT / f"weeks/week-{week:02d}"
        for path in sorted(week_root.glob("*.md")):
            text = path.read_text(encoding="utf-8")
            for placeholder in PLACEHOLDERS:
                if placeholder in text:
                    raise RuntimeError(f"placeholder {placeholder!r} remains in {path.relative_to(ROOT)}")
    checks.append("GREEN — no template placeholders remain in newly authored week Markdown")
    return checks


def week2_portable_probe() -> str:
    return (
        f"python={platform.python_version()}; system={platform.system()}; "
        f"machine={platform.machine()}; logical_cpus={os.cpu_count()}"
    )


def check_lab() -> tuple[list[str], str, str]:
    checks: list[str] = []
    doctor = run([str(ROOT / "lab/bin/archlab"), "doctor"])
    checks.append("GREEN — `./lab/bin/archlab doctor` exits 0")
    with tempfile.TemporaryDirectory(prefix="arch-week03-a-") as a_dir, tempfile.TemporaryDirectory(
        prefix="arch-week03-b-"
    ) as b_dir:
        a = Path(a_dir)
        b = Path(b_dir)
        run([str(ROOT / "lab/bin/archprobe"), "--out-dir", str(a)])
        run([str(ROOT / "lab/bin/archprobe"), "--out-dir", str(b)])
        a_text = (a / "machine.txt").read_text(encoding="utf-8")
        b_text = (b / "machine.txt").read_text(encoding="utf-8")
        if not a_text.strip() or not b_text.strip():
            raise RuntimeError("archprobe did not produce non-empty machine.txt receipts")
        checks.append("GREEN — repeated `archprobe` runs produced non-empty machine receipts")
        # We do not require byte identity because timestamps and other explicitly
        # observed fields may differ. The important contract is repeatable receipt shape.
        a_head = "\n".join(a_text.splitlines()[:12])
        b_head = "\n".join(b_text.splitlines()[:12])
    return checks, doctor.stdout.strip(), f"RUN A:\n{a_head}\n\nRUN B:\n{b_head}"


def check_git() -> list[str]:
    run(["git", "diff", "--check"])
    return ["GREEN — `git diff --check` exits 0"]


def main() -> int:
    timestamp = dt.datetime.now(dt.timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    receipt = ROOT / "sidecar/runs" / f"architecture_savnac_source_validation_{timestamp}.md"
    receipt.parent.mkdir(parents=True, exist_ok=True)
    checks: list[str] = []
    try:
        checks.extend(check_sources())
        probe = week2_portable_probe()
        checks.append("GREEN — Week 2 portable Python machine probe executed")
        lab_checks, doctor_output, archprobe_output = check_lab()
        checks.extend(lab_checks)
        checks.extend(check_git())
        status = "GREEN"
        error = ""
    except Exception as exc:  # receipt first; do not hide a failed real-host gate
        status = "RED"
        error = str(exc)
        doctor_output = "not completed"
        archprobe_output = "not completed"
        probe = week2_portable_probe()

    lines = [
        "# Computer Architecture Savnac source validation receipt",
        "",
        f"- UTC: {timestamp}",
        f"- status: **{status}**",
        f"- commit: `{git_head()}`",
        f"- host: `{platform.node()}`",
        f"- Python: `{platform.python_version()}`",
        f"- platform: `{platform.platform()}`",
        "",
        "## Contract checks",
        "",
    ]
    lines.extend(f"- {item}" for item in checks)
    if error:
        lines.extend(["", "## Failure", "", f"`{error}`"])
    lines.extend(
        [
            "",
            "## Week 2 portable probe",
            "",
            "```text",
            probe,
            "```",
            "",
            "## archlab doctor",
            "",
            "```text",
            doctor_output,
            "```",
            "",
            "## repeated archprobe receipt heads",
            "",
            "```text",
            archprobe_output,
            "```",
            "",
            "## Interpretation boundary",
            "",
            "This receipt validates the newly authored Architecture launch source and the",
            "required repository-local laboratory path on the named host. It does not prove",
            "optional container, GPU, WSL, macOS, or instructor-showcase lanes.",
            "",
            "Week 2 and Week 3 Monday deck sources are validated separately by exact-source",
            "LaTeX builds; generated PDFs are reproducible build products rather than required",
            "Git source.",
            "",
            "## Command",
            "",
            "```text",
            "python3 scripts/validate_savnac_launch_source.py",
            "```",
            "",
        ]
    )
    receipt.write_text("\n".join(lines), encoding="utf-8")
    print(receipt)
    return 0 if status == "GREEN" else 1


if __name__ == "__main__":
    raise SystemExit(main())
