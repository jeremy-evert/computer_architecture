# Instructor runbook — five minutes

## Before class

1. Open Obsidian. Choose **Open folder as vault** (or **Open another vault → Open folder as vault**).
2. Select the `demos/obsidian-week10-memory/` directory in this course checkout. No community plugin or AI integration is used.
3. Open [[00 Start Here]]. Optionally close other vaults to keep the graph focused.

If Obsidian is not installed on the presentation computer, install/open the ordinary desktop app through the institution's approved process before class; this vault itself is plain Markdown and can be read in any text editor. The course experiment runs from the repository root with `./lab/bin/archlab run memory`.

To check the vault before presenting, run `python3 -B demos/obsidian-week10-memory/scripts/validate_vault.py` and `python3 -B -m unittest discover -s demos/obsidian-week10-memory/tests -v` from the repository root.

## Five-minute sequence

**0:00–0:45 — Start with the question.** Open [[01 The Question]]. Ask: “What's keeping us from pushing the machine for even greater results?” Show how it narrows to the Week 10 memory-hierarchy question.

**0:45–1:30 — Follow an idea.** Click [[02 Memory Hierarchy]] and [[03 Prediction]]. Explain why pointer-chase latency and streaming bandwidth are separate questions. Open the command palette (`Ctrl/Cmd+P`), search for **Backlinks: Show backlinks**, and show which notes refer back to the concept.

**1:30–2:15 — Show the experiment.** Open [[04 Experiment]]. Point to the actual repository command and what it varies. Emphasize that the vault links to the existing course experiment rather than inventing a benchmark.

**2:15–3:15 — Inspect the evidence.** Open [[05 Observed Results]]. Read one small and one large working-set row; open a linked CSV to show raw values and the machine receipt to show host/compiler context. Explain median/range and why small streaming runs are noisy.

**3:15–4:15 — Open the graph.** Use **Open graph view** (left ribbon graph icon, or `Ctrl/Cmd+P` and search “Open graph view”). The nodes are notes and their links are relationships. Click a node, then use the local graph/backlinks to orient. No graph plugin is required.

**4:15–5:00 — Make the decision and lesson.** Open [[06 Conclusion and Decision]] and [[07 Why Keep a Notebook]]. Separate measured trend from possible cache explanation. End with the notebook's value: preserve the chain from question to evidence to decision so someone can challenge or reproduce it later.

## Safe claims to say aloud

“These numbers were measured on this Maise host today. They are not expected answers for your laptop. The experiment reveals a shape; it does not tell us an exact cache boundary or a unique cause. The links make that reasoning trail inspectable.”
