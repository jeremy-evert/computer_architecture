from __future__ import annotations

import csv
import json
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from summarize_runs import summarize  # noqa: E402
from validate_vault import validate  # noqa: E402


class VaultLinkTests(unittest.TestCase):
    def test_deliverable_vault_has_all_notes_and_links(self) -> None:
        root = Path(__file__).resolve().parents[1]
        self.assertEqual([], validate(root))

    def test_missing_wikilink_is_reported(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "00 Start Here.md").write_text("See [[Missing Note]].", encoding="utf-8")
            self.assertTrue(any("broken local link: Missing Note" in e for e in validate(root)))

    def test_missing_relative_evidence_link_is_reported(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "00 Start Here.md").write_text("[CSV](evidence/missing.csv)", encoding="utf-8")
            self.assertTrue(any("broken local link: evidence/missing.csv" in e for e in validate(root)))

    def test_link_cannot_escape_vault(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp) / "vault"
            root.mkdir()
            (root / "00 Start Here.md").write_text("[outside](../secret.md)", encoding="utf-8")
            self.assertTrue(any("broken local link" in e for e in validate(root)))

    def test_six_saved_runs_have_passing_receipts_and_twelve_rows(self) -> None:
        root = Path(__file__).resolve().parents[1]
        runs = sorted((root / "evidence/2026-10-22").glob("maise-run-*"))
        self.assertEqual(6, len(runs))
        for run in runs:
            receipt = json.loads((run / "memory-receipt.json").read_text(encoding="utf-8"))
            with (run / "memory.csv").open(newline="", encoding="utf-8") as f:
                rows = list(csv.DictReader(f))
            self.assertEqual("PASS", receipt["status"], run.name)
            self.assertEqual(12, receipt["rows"], run.name)
            self.assertEqual(12, len(rows), run.name)
            self.assertEqual({"pointer_chase", "stream_read"}, {row["kind"] for row in rows})

    def test_saved_machine_evidence_is_host_visible(self) -> None:
        root = Path(__file__).resolve().parents[1]
        machine = json.loads((root / "evidence/2026-10-22/maise-machine/machine.json").read_text(encoding="utf-8"))
        self.assertEqual("host-visible", machine["scope"]["scope"])
        self.assertEqual("AMD Ryzen 9 3950X 16-Core Processor", machine["cpu"]["model"])

    def test_saved_summary_recomputes_from_raw_csvs(self) -> None:
        root = Path(__file__).resolve().parents[1]
        expected = json.loads((root / "evidence/2026-10-22/summary.json").read_text(encoding="utf-8"))
        self.assertEqual(expected, summarize(root / "evidence/2026-10-22"))


if __name__ == "__main__":
    unittest.main()
