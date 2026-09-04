# Wednesday - Use the operating system as a telescope

A command is not a vocabulary word to memorize. It is an **instrument** that exposes one view of the machine.

## 1. Decompose one vague question

Start with:

> What is this computer and what is it doing?

Break it into observable questions such as:

- What operating system/kernel is visible?
- What ISA/machine label is visible?
- How many logical processors are visible?
- How much memory is visible?
- What processes are running?
- What kind of file/binary is this?

## 2. Start with the course Observatory

From the course repository root:

```bash
./lab/bin/archprobe --out-dir /tmp/arch-week04
cat /tmp/arch-week04/machine.txt
```

The Observatory labels evidence scope rather than pretending a container/VM/subsystem view is the entire physical host.

## 3. Add operating-system instruments where available

On Linux, useful observations include:

```bash
uname -a
uname -m
lscpu
free -h
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head
file /bin/sh
```

To look at bytes without turning the week into shell trivia:

```bash
printf 'ABC\n' > /tmp/arch-week04-bytes.txt
od -An -tx1 -c /tmp/arch-week04-bytes.txt
```

If a named command is unavailable on your supported environment, use the Observatory/fallback packet and record that limitation. Do not install privileged tools merely to imitate Linux output.

## Optional enrichment: Architecture Telescope

If you want a small Linux environment with the same observation instruments,
you may run the course's optional Architecture Telescope image. It prints a
blank Explain / Defend receipt for you to fill in; it does not replace
`archprobe` or answer the reasoning questions for you.

```bash
podman pull ghcr.io/jeremy-evert/archlab-week4-telescope@sha256:6844a542024050ad897bc4706229c49b721cff51f8cbfe8bff2bd04c71608580
podman run --rm -it ghcr.io/jeremy-evert/archlab-week4-telescope@sha256:6844a542024050ad897bc4706229c49b721cff51f8cbfe8bff2bd04c71608580
```

Using Docker instead of Podman? Substitute `docker` for `podman`. This image
is optional enrichment, not a requirement; use the Observatory/fallback path
if the image is unavailable.

## 4. Observation receipt

Choose **one** machine claim and provide:

1. question;
2. command/instrument;
3. relevant raw observation;
4. interpretation;
5. evidence scope;
6. one thing the observation does not prove.

Example distinction:

- Observation: `platform.machine()` returned `x86_64`.
- Interpretation: the current execution environment presents an x86-64 machine interface.
- Not proven: every physical-host detail, performance characteristic, or virtualization layer.
