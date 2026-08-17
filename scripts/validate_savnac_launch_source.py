#!/usr/bin/env python3
"""Validate the Architecture-local source needed by the full Savnac compiler.

This validator is local-only. It makes no Canvas/network calls and changes no
machine configuration. It proves the newly-authored semester shells against the
already-existing course laboratory, then emits a raw Markdown receipt.
"""

from __future__ import annotations

import datetime as dt
import json
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
    "lab/fallback_data/week05-machine-reference.txt",
    "lab/fallback_data/week05-machine-reference.json",
]
PLACEHOLDERS = ("REPLACE", "Week NN", "WEEK TITLE")


def run(
    command: list[str],
    *,
    cwd: Path = ROOT,
    check: bool = True,
) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        command,
        cwd=cwd,
        check=check,
        capture_output=True,
        text=True,
    )


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
                    raise RuntimeError(
                        f"placeholder {placeholder!r} remains in "
                        f"{path.relative_to(ROOT)}"
                    )
    checks.append("GREEN — no template placeholders remain in newly authored week Markdown")

    week3 = (ROOT / "weeks/week-03/wednesday.md").read_text(encoding="utf-8")
    for fallback in (
        "lab/fallback_data/week05-machine-reference.txt",
        "lab/fallback_data/week05-machine-reference.json",
    ):
        if fallback not in week3:
            raise RuntimeError(f"Week 3 does not name required fallback source: {fallback}")
    checks.append("GREEN — Week 3 names the committed course fallback receipt explicitly")
    return checks


def week2_portable_probe() -> str:
    return (
        f"python={platform.python_version()}; system={platform.system()}; "
        f"machine={platform.machine()}; logical_cpus={os.cpu_count()}"
    )


def _doctor_payload() -> tuple[subprocess.CompletedProcess[str], dict[str, object]]:
    doctor = run([str(ROOT / "lab/bin/archlab"), "doctor"], check=False)
    if not doctor.stdout.strip():
        detail = doctor.stderr.strip() or f"exit {doctor.returncode} with no output"
        raise RuntimeError(f"archlab doctor produced no JSON receipt: {detail}")
    try:
        payload = json.loads(doctor.stdout)
    except json.JSONDecodeError as exc:
        raise RuntimeError(
            "archlab doctor output was not valid JSON: "
            f"{doctor.stdout[-500:]}"
        ) from exc
    if not isinstance(payload, dict) or payload.get("schema") != "swosu.archlab.doctor/v1":
        raise RuntimeError("archlab doctor returned an unexpected receipt schema")
    return doctor, payload


def check_lab() -> tuple[list[str], list[str], str, str]:
    checks: list[str] = []
    warnings: list[str] = []
    doctor, payload = _doctor_payload()
    doctor_status = str(payload.get("status", "UNKNOWN"))
    missing = payload.get("missing_required", [])

    if doctor_status == "PASS" and doctor.returncode == 0:
        checks.append("GREEN — full `./lab/bin/archlab doctor` capability check passes")
    else:
        warnings.append(
            "YELLOW — full `archlab doctor` capability check is not PASS on this host; "
            f"missing_required={missing!r}. This is diagnostic, not by itself a "
            "launch-source failure because Week 3 provides a named fallback path."
        )

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
        a_head = "\n".join(a_text.splitlines()[:12])
        b_head = "\n".join(b_text.splitlines()[:12])

    checks.append("GREEN — Week 3 fallback receipt exists for hosts where wrappers cannot run")
    doctor_text = doctor.stdout.strip()
    if doctor.stderr.strip():
        doctor_text += f"\n\nSTDERR:\n{doctor.stderr.strip()}"
    return checks, warnings, doctor_text, f"RUN A:\n{a_head}\n\nRUN B:\n{b_head}"


def check_git() -> list[str]:
    run(["git", "diff", "--check"])
    return ["GREEN — `git diff --check` exits 0"]


def main() -> int:
    timestamp = dt.datetime.now(dt.timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    receipt = ROOT / "sidecar/runs" / f"architecture_savnac_source_validation_{timestamp}.md"
    receipt.parent.mkdir(parents=True, exist_ok=True)
    checks: list[str] = []
    warnings: list[str] = []
    try:
        checks.extend(check_sources())
        probe = week2_portable_probe()
        checks.append("GREEN — Week 2 portable Python machine probe executed")
        lab_checks, lab_warnings, doctor_output, archprobe_output = check_lab()
        checks.extend(lab_checks)
        warnings.extend(lab_warnings)
        checks.extend(check_git())
        status = "GREEN WITH YELLOWS" if warnings else "GREEN"
        error = ""
    except Exception as exc:  # receipt first; do not hide a failed real-host gate
        status = "RED"
        error = str(exc)
        doctor_output = locals().get("doctor_output", "not completed")
        archprobe_output = locals().get("archprobe_output", "not completed")
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
    if warnings:
        lines.extend(["", "## Named YELLOWs", ""])
        lines.extend(f"- {item}" for item in warnings)
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
            "required/fallback Week 3 laboratory path on the named host. A full doctor FAIL",
            "is retained as a platform capability YELLOW when the source/fallback contract",
            "is still usable; it is not silently rewritten as PASS.",
            "",
            "It does not prove optional container, GPU, WSL, macOS, or instructor-showcase",
            "lanes. Week 2 and Week 3 Monday deck sources are validated separately by",
            "exact-source LaTeX builds; generated PDFs are reproducible build products rather",
            "than required Git source.",
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
    return 0 if status != "RED" else 1


if __name__ == "__main__":
    raise SystemExit(main())
