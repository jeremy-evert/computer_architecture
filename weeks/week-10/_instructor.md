# Week 10 instructor / recording plan

Start with the student's Week 5 hierarchy ledger. Ask why 'fast/slow' is inadequate, then build pointer-chase versus streaming predictions before showing data.

## Canonical path

```bash
./lab/bin/archlab run memory --out-dir dossier/evidence/week10-memory
./lab/bin/archlab plot memory dossier/evidence/week10-memory/memory.csv --out dossier/evidence/week10-memory/memory.png
```

Prompt 003's executed reference showed low-single-digit ns/access for tiny pointer-chase working sets and about 126 ns/access at 32 MiB on that validation surface. Never present those as expected answers.

## Stack Showcase

Run the same plot on a visibly different instructor machine and compare **shapes**, not trophy numbers. Optional counters may corroborate but do not replace the student experiment.