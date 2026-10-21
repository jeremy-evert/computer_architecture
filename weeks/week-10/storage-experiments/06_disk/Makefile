CC ?= cc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra
.PHONY: all run clean
all: 06_disk
06_disk: 06_disk.c
	$(CC) $(CFLAGS) -DFLAGS='"$(CFLAGS)"' -o $@ $<
run: 06_disk
	./06_disk $${SCRATCH_DIR:+"$$SCRATCH_DIR"}
clean:
	rm -f 06_disk
