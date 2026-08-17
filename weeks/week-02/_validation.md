# Week 2 authoring / execution validation

**Status:** YELLOW - authored for Savnac; exact-source deck build and real-host command smoke remain

- [x] central question matches planning Week 2.
- [x] AI Fluency Lenses 1+2 integrated without duplicating the shared assignment.
- [x] Professional Minds topics match the accepted semester map.
- [x] no paid AI or AI account is required because a fallback proposal is supplied.
- [x] required evidence command uses Python standard library only.
- [x] Machine Dossier explicitly does not begin this week.
- [x] Friday requires independent verification and revision, not transcript paste.

Release checks still required:

```bash
python3 - <<'PY'
import os, platform, sys
print(sys.version.split()[0], platform.system(), platform.machine(), os.cpu_count())
PY
```

and, on a LaTeX authoring host:

```bash
cd weeks/week-02
latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build monday.tex
```

A failure of optional OS-specific commands must not block the portable Python path.
