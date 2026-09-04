# Architecture Telescope

This optional-enrichment image provides a small Linux environment for Week 4's
machine-observation lesson. It includes the instruments named in the lesson:
`uname`, `lscpu`, `free`, `ps`, `file`, and `od`.

Run the blank observation receipt interactively:

```bash
podman run --rm -it ghcr.io/jeremy-evert/archlab-week4-telescope@sha256:6844a542024050ad897bc4706229c49b721cff51f8cbfe8bff2bd04c71608580
```

To save the empty scaffold, redirect its output to a file. The image does not
run `archprobe`, fill in observations, interpret evidence, or answer
the Explain/Defend prompts. Students supply those judgments themselves.
