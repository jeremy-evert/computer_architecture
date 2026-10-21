#!/bin/sh
set -eu
tmp=$(mktemp -d /tmp/arch-git-walk-XXXXXX)
cleanup() { rm -rf "$tmp"; }
trap cleanup EXIT HUP INT TERM
cd "$tmp"
export GIT_AUTHOR_NAME='Architecture Lab' GIT_AUTHOR_EMAIL='lab@example.invalid'
export GIT_COMMITTER_NAME='Architecture Lab' GIT_COMMITTER_EMAIL='lab@example.invalid'
export GIT_AUTHOR_DATE='2020-01-01T00:00:00Z' GIT_COMMITTER_DATE='2020-01-01T00:00:00Z'
git init -q
printf 'first version\n' > note.txt
git add note.txt
git commit -qm 'first version'
printf 'second version\n' > note.txt
git add note.txt
git commit -qm 'second version'
printf '%s\n' '--- current file object ---'
git cat-file -p HEAD:note.txt
printf '%s\n' '--- stored objects ---'
find .git/objects -type f -print | sort
printf '%s\n' '--- history ---'
git log --oneline
