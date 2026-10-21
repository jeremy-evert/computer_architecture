# 08: repository objects

Linux only (WSL2 works).

## Question

How does a content-addressed version store identify files, and what work is involved in storing many small versions?

## Prediction

My prediction: ______

## Run

Run `make`, `make check`, then `./08_repository` for storage timings. With no argument it works in a fresh directory under `/tmp`. To time a real disk instead, give a scratch directory: `./08_repository /path/to/scratch` (for example `./08_repository ~/disk-scratch`). The program creates its own uniquely named subdirectory inside it and removes only that subdirectory; the directory you give is never removed. On many Linux systems `/tmp` is tmpfs (RAM), and the program prints a `# WARNING:` line when it sees that, because sync timings are not meaningful there. The `# filesystem_type=` header line shows what the scratch directory is on. `make check` compares this program's SHA-1 blob identifier with `git hash-object` and checks the standard `abc` and empty-input vectors. To hash another file, run `./08_repository --hash path/to/file`. Run `./walkthrough.sh` for a disposable two-commit repository example.

## What to look at

The hash check should say MATCH and both known vectors should say PASS. The timing run creates 2,000 generated 200-byte records. It compares separate loose-object-style files with one appended plain file. The loose-style case optionally calls `fsync` on each object; the append case optionally calls `fsync` once at the end. Each timed batch stores 2,000 records. The program repeats whole store batches, with reset/setup between timed batches, until each trial accumulates at least 50 ms of store time. It prints the elapsed total and batch count for three trials and a median for each combination. The last column, `ms_per_batch`, is `seconds * 1000 / batches_of_2000_records`: the time to store one batch of 2,000 records, so rows that ran different numbers of batches can be compared directly. On the `# median` rows it is the median of the three per-trial `ms_per_batch` values, and `# median` lines are not CSV data rows. File close results are checked; close time is outside the reported store interval.

The walkthrough shows the committed file contents with `git cat-file -p`, object paths under `.git/objects`, and the two commits. Its temporary repository is removed when the script exits.

## Expected shape

The same bytes always produce the same object ID because the SHA-1 input includes the `blob <size>` header, a zero byte, and the contents. Appending to one file typically has less per-file overhead than creating thousands of files. Syncing each record can add substantial waiting. Real Git loose objects are zlib-compressed; this experiment writes the header and contents uncompressed, so its store is only loose-object-style and is not a valid Git object database.

A repository is storage that remembers every version and can be copied anywhere; the cost shows up as the time and space measured here.


On april (`../receipts/april/08_repository_run*.txt`; each region repeats batches of 2,000 records until it passes 50 ms, so divide `seconds` by `batches_of_2000_records`): appending to one plain file took about 0.46 ms per batch with no sync and about 1.4 ms with one sync at the end; one loose-object-style file per record took about 13.7 ms per batch with no sync (about 30 times more) and about 1.4 to 1.6 s per batch when every object is synced (about 1,000 times the single-file sync). The git object ids matched real `git hash-object` (see `make check`).

## What would surprise us / falsify the idea

If the check disagrees with Git, the object framing or SHA-1 implementation is wrong. If separate files take no more time than appending, this filesystem may make small file creation cheap or caching may dominate. Sync results can also vary with the storage stack.

## Caveat

By default scratch data lives in a fresh directory under `/tmp` (or under the scratch directory you pass, which may be a real disk). Cleanup removes the known generated files and directories directly and reports failures; the registered cleanup path is cleared only after the scratch root is removed. The uncompressed loose-object-style store omits Git's zlib compression and metadata, so its timing and size do not represent a complete Git repository. SHA-1 is shown for compatibility with Git's object IDs, not as a recommendation for new security designs.
