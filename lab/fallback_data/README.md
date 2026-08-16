# Reference fallback data

These small datasets preserve the **reasoning task** when a student's machine cannot expose a phenomenon cleanly or the required local compiler/tool is unavailable after reasonable troubleshooting.

They were captured on 2026-08-16 in a **container-visible x86_64 Linux environment** during the Prompt 003 smoke pass. They are intentionally not a performance baseline, hardware ranking, or promise that another machine should reproduce the same numbers.

Use them to practice:

- identifying the shape of dependent-access latency as working set grows;
- comparing measured vs ideal shared-memory scaling;
- comparing a chatty communication pattern with a bulk-transfer pattern as controlled per-message waiting is increased.

A student using fallback data must still make a prediction, interpret the figure, explain the mechanism, and state the limitation that the data were course-provided rather than measured on the student's own machine.
