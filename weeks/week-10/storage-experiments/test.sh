#!/usr/bin/env bash
# Top-level self test, run by `make test`:
#   1. build every experiment with -Werror
#   2. run 08_repository's SHA-1 check against git
#   3. run 06_disk (small size) and 08_repository in a temp directory
#   4. assert every CSV data row has as many fields as its header, and that
#      `kind` is trial or median
# Exits non-zero on the first failure.
set -eu
cd "$(dirname "$0")"
WERROR="-std=c11 -O2 -Wall -Wextra -Werror"

echo "== build with -Werror"
for d in [0-9][0-9]_*; do
  make -s -C "$d" clean all CFLAGS="$WERROR"
done

echo "== 08_repository make check"
make -s -C 08_repository check

scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT HUP INT TERM

# check_csv <name> <file>: header is the first non-comment line; all later
# non-comment, non-blank lines must have the same field count and kind in {trial,median}.
check_csv() {
  awk -F, -v name="$1" '
    /^#/ || /^$/ { next }
    !seen { seen = 1; n = NF; if ($1 != "kind") { printf "FAIL %s: first column is \"%s\", expected kind\n", name, $1; bad = 1 } rows = 0; next }
    { rows++
      if (NF != n) { printf "FAIL %s: line has %d fields, header has %d: %s\n", name, NF, n, $0; bad = 1 }
      if ($1 != "trial" && $1 != "median") { printf "FAIL %s: kind \"%s\" is not trial or median\n", name, $1; bad = 1 } }
    END { if (!seen || rows == 0) { printf "FAIL %s: no CSV header or data rows\n", name; exit 1 }
          if (bad) exit 1
          printf "ok %s: %d data rows, %d fields each\n", name, rows, n }
  ' "$2"
}

echo "== 06_disk (4 MiB) in a temp directory"
./06_disk/06_disk "$scratch" 4194304 > "$scratch.06.out"
check_csv 06_disk "$scratch.06.out"

echo "== 08_repository in a temp directory"
./08_repository/08_repository "$scratch" > "$scratch.08.out"
check_csv 08_repository "$scratch.08.out"

# Both programs must remove what they created inside a directory they were given.
if [ -n "$(ls -A "$scratch")" ]; then
  echo "FAIL: scratch directory not empty after runs:" >&2; ls -A "$scratch" >&2; exit 1
fi
rm -f "$scratch.06.out" "$scratch.08.out"
echo "ALL TESTS PASSED"
