# Week 4 authoring / execution validation

**Status:** YELLOW - authored from proven Observatory substrate; Week 4 command smoke on named release host required

- [x] Labor Day removes the Monday requirement.
- [x] AI Fluency Lens 4 is folded into Wednesday rather than creating holiday make-up work.
- [x] Professional Minds topics match the accepted semester design.
- [x] required course Observatory path already exists and was validated in Prompt 003.
- [x] Linux commands are observation instruments, not memorization requirements.
- [x] non-Linux/fallback path preserves the reasoning task.
- [x] no root/admin requirement.
- [x] Machine Dossier remains closed until Week 5.

Release smoke:

```bash
./lab/bin/archprobe --out-dir /tmp/arch-week04
cat /tmp/arch-week04/machine.txt
uname -m || true
```

Optional Linux commands should be checked on the recording host but may not become cross-platform release gates.
