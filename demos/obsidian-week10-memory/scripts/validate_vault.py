#!/usr/bin/env python3
"""Check this small Obsidian vault's required notes and local links."""
from __future__ import annotations

import re
import sys
from pathlib import Path

REQUIRED = {
    "00 Start Here.md",
    "01 The Question.md",
    "02 Memory Hierarchy.md",
    "03 Prediction.md",
    "04 Experiment.md",
    "05 Observed Results.md",
    "06 Conclusion and Decision.md",
    "07 Why Keep a Notebook.md",
    "Instructor Runbook.md",
}
WIKI = re.compile(r"(?<!!)\[\[([^\]]+)\]\]")
MARKDOWN = re.compile(r"(?<!!)\[[^\]]*\]\(([^)]+)\)")


def _exists(root: Path, source: Path, target: str) -> bool:
    target = target.split("|", 1)[0].split("#", 1)[0].strip().strip("<>")
    if not target or target.startswith(("https://", "http://", "mailto:")):
        return True
    path = (source.parent / target).resolve()
    if not path.suffix:
        path = path.with_suffix(".md")
    try:
        path.relative_to(root.resolve())
    except ValueError:
        return False
    return path.is_file()


def validate(root: Path) -> list[str]:
    errors: list[str] = []
    for note in sorted(REQUIRED):
        if not (root / note).is_file():
            errors.append(f"missing required note: {note}")
    for source in sorted(root.rglob("*.md")):
        for pattern in (WIKI, MARKDOWN):
            for match in pattern.finditer(source.read_text(encoding="utf-8")):
                target = match.group(1).strip()
                if not _exists(root, source, target):
                    errors.append(f"{source.relative_to(root)}: broken local link: {target}")
    return errors


def main() -> int:
    root = Path(__file__).resolve().parents[1]
    errors = validate(root)
    if errors:
        print("FAIL")
        print("\n".join(errors))
        return 1
    print(f"PASS: {len(REQUIRED)} required notes and all local Markdown/Obsidian links resolve")
    return 0


if __name__ == "__main__":
    sys.exit(main())
