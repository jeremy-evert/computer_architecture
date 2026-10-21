# Top-level driver. Each numbered folder has its own Makefile.
DIRS := $(sort $(wildcard [0-9][0-9]_*))

.PHONY: all run clean receipts
all:
	@for d in $(DIRS); do $(MAKE) -C $$d || exit 1; done
run:
	@for d in $(DIRS); do echo "=== $$d"; $(MAKE) -s -C $$d run || exit 1; done
clean:
	@for d in $(DIRS); do $(MAKE) -s -C $$d clean; done
# Instructor only: three trials per experiment, saved under receipts/<host>/.
receipts:
	bash run_receipts.sh
