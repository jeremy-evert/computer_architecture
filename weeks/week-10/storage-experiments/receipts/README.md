# receipts

Saved output of the experiments, one text file per run, so the numbers quoted in the
experiment READMEs can be checked.

## Hosts
Each subfolder is one machine (`hostname -s`).

- `april/` is the **baseline host**: Intel Core Ultra 7 265, 30 MiB L3, ext4 on NVMe,
  Linux, runs pinned to CPU 0 (a performance core). The numbers in the experiment
  READMEs come from here. Do not regenerate or edit these files by hand; they are the
  reference the other hosts are compared with.
- `morgan/` is an Intel Core i7-8700K under WSL2, used to compare other filesystems
  (ext4 on a virtual disk, and 9p Windows drives). Older files from before the 2026-10-21
  rework are kept in `morgan/pre-2026-10-21/`.

## File names
`<experiment>_run<N>.txt` is run N (1 to 3) of one experiment, for example
`06_disk_run2.txt`. When `RECEIPT_TAG=<tag>` was set for `run_receipts.sh`, the tag is
appended: `06_disk_run2_mnt_d.txt` (the tags used on morgan are `home`, `mnt_c`, `mnt_d`,
naming where the scratch directory lived). Only 06 and 08 depend on the scratch
directory; the other experiments are repeated under each tag only because the script
runs everything.

Every file starts with `# host`, CPU, date, and compiler-flag lines. For 06 and 08 the
`# filesystem_type=` line says what the scratch directory was on; read it before
comparing numbers.

Compare shapes and ratios between hosts, not exact values.

## Other files
- `REVIEW.md` is the independent code review of the programs, with the status of each finding.
