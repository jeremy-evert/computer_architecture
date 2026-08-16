from __future__ import annotations

import json
from datetime import datetime, timezone
from pathlib import Path


def utc_stamp() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")


def utc_iso() -> str:
    return datetime.now(timezone.utc).isoformat()


def ensure_dir(path: Path) -> Path:
    path.mkdir(parents=True, exist_ok=True)
    return path


def write_json(path: Path, payload: object) -> Path:
    ensure_dir(path.parent)
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return path


def lab_root() -> Path:
    return Path(__file__).resolve().parents[1]


def default_runs_root() -> Path:
    return lab_root() / "runs"
