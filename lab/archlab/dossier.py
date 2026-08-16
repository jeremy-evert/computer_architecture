from __future__ import annotations

import shutil
import subprocess
from pathlib import Path
from typing import Any

from .common import ensure_dir, lab_root, utc_iso, write_json


def build(work_dir: Path, figures: list[Path] | None = None) -> dict[str, Any]:
    work_dir = ensure_dir(work_dir)
    figures = figures or []
    template = (lab_root() / "dossier" / "main.tex").read_text(encoding="utf-8")
    figure_lines = []
    for fig in figures:
        target = work_dir / fig.name
        if fig.resolve() != target.resolve():
            shutil.copy2(fig, target)
        figure_lines += [
            "\\begin{figure}[ht]",
            "\\centering",
            f"\\includegraphics[width=0.92\\linewidth]{{{target.name}}}",
            f"\\caption{{Generated laboratory evidence: {target.stem.replace('_', ' ')}}}",
            "\\end{figure}",
        ]
    tex = template.replace("% ARCHLAB_FIGURES", "\n".join(figure_lines) if figure_lines else "No generated figures were supplied.")
    tex_path = work_dir / "machine-dossier.tex"
    tex_path.write_text(tex, encoding="utf-8")
    tectonic = shutil.which("tectonic")
    latexmk = shutil.which("latexmk")
    engine = None
    if tectonic:
        cp = subprocess.run([tectonic, "--keep-logs", tex_path.name], cwd=work_dir, capture_output=True, text=True, timeout=120)
        engine = "tectonic"
    elif latexmk:
        cp = subprocess.run([latexmk, "-pdf", "-interaction=nonstopmode", "-halt-on-error", tex_path.name], cwd=work_dir, capture_output=True, text=True, timeout=120)
        engine = "latexmk+pdflatex"
    else:
        raise RuntimeError("No supported LaTeX engine found (Tectonic or latexmk+pdflatex)")
    pdf = work_dir / "machine-dossier.pdf"
    payload = {
        "schema": "swosu.archlab.dossier/v1",
        "timestamp_utc": utc_iso(),
        "engine": engine,
        "tex": tex_path.name,
        "pdf": pdf.name,
        "figures": [p.name for p in figures],
        "status": "PASS" if cp.returncode == 0 and pdf.exists() else "FAIL",
        "compiler_tail": (cp.stdout + "\n" + cp.stderr)[-2000:],
    }
    write_json(work_dir / "dossier-receipt.json", payload)
    if payload["status"] != "PASS":
        raise RuntimeError(payload["compiler_tail"])
    return payload
