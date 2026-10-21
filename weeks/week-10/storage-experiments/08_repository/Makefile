CC ?= cc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
.PHONY: all run clean check
all: 08_repository
08_repository: 08_repository.c
	$(CC) $(CFLAGS) -o $@ $<
run: 08_repository
	./08_repository $${SCRATCH_DIR:+"$$SCRATCH_DIR"}
check: 08_repository
	@set -eu; f=$$(mktemp /tmp/arch-hash-XXXXXX); trap 'rm -f "$$f"' EXIT HUP INT TERM; printf 'small Git blob check\n' > "$$f"; ours=$$(./08_repository --hash "$$f"); real=$$(git hash-object "$$f"); if [ "$$ours" = "$$real" ]; then echo "MATCH $$ours"; else echo "MISMATCH ours=$$ours git=$$real"; exit 1; fi; ./08_repository --vectors
clean:
	rm -f 08_repository
