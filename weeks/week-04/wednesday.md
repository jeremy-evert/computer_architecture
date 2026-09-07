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

### Worked decomposition: subquestion -> instrument -> expected shape

Each subquestion has a matching instrument. Before running anything, know
what an answer *looks like* so you can tell a real observation from a guess
dressed up as one.

| Subquestion | Instrument | Expected shape of output | Observation vs. interpretation |
|---|---|---|---|
| What OS/kernel is visible? | `uname -a` | One line: kernel name, hostname, kernel release/version, machine tag | Observation: the exact string printed. Interpretation: "this is Linux" — the string does not prove no other OS is also running underneath (e.g., inside a VM). |
| What ISA/machine label is visible? | `uname -m` | A single short token (e.g. `x86_64`, `aarch64`) | Observation: the token itself. Interpretation: "the execution environment presents this instruction-set interface" — not a physical-chip guarantee if you are inside a container or VM. |
| How many logical processors are visible? | `lscpu` | A labeled block; look for the `CPU(s):` line and `Thread(s) per core` / `Core(s) per socket` | Observation: the numbers on those lines. Interpretation: "logical processors visible to this OS view" — a container/VM can be capped below the physical core count, so this is not automatically the physical socket's full core count. |
| How much memory is visible? | `free -h` | A small table with `total`/`used`/`free`/`available` rows for `Mem:` and `Swap:` | Observation: the `total` figure. Interpretation: "memory visible to this OS view" — cgroup limits, VM allocation, or overcommit can make this differ from installed physical RAM. |
| What processes are running? | `ps -eo pid,comm,%cpu,%mem --sort=-%cpu \| head` | A short table: PID, command name, %CPU, %MEM, sorted highest CPU first | Observation: the listed PIDs/commands at this instant. Interpretation: "these were the busiest processes at the moment of the snapshot" — process lists change; this is not a claim about typical or average load. |
| What kind of file/binary is this? | `file /bin/sh` | One line: path, then a colon, then a short type description (e.g. "symbolic link to ...", "ELF 64-bit LSB executable, ...") | Observation: the type string `file` printed, from its own content-sniffing rules. Interpretation: `file` inspects bytes/headers, not intent — it can be wrong on crafted input, so it is evidence, not proof, of what a program does. |

The pattern to notice: every instrument narrows a vague question to a
specific, checkable claim, and every claim has a scope boundary you can
name before you have even run the command.

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

### Worked receipt (model, not the assignment)

This is a completed example on one instructor host, using a different claim
than the one above so it does not hand you the assignment. Your machine's
numbers, and probably your chosen claim, will differ.

1. **Question:** does this machine's CPU advertise support for AVX2 vector
   instructions?
2. **Instrument:** `lscpu`
3. **Raw observation:** the `Flags:` line includes the token `avx2` among
   dozens of other flag tokens.
4. **Interpretation:** the CPU reports AVX2 as an available instruction-set
   extension to whatever is running `lscpu`.
5. **Evidence scope:** host-visible Linux `lscpu` output on this one
   machine, at this one point in time.
6. **Not proven:** that AVX2 is enabled for every process (a hypervisor or
   container CPU-feature mask could hide it elsewhere), or that any specific
   program actually uses AVX2 instructions at runtime — a flag is a
   capability claim, not a usage claim.
