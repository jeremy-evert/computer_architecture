# Top-level driver. Each numbered folder has its own Makefile.
DIRS := $(sort $(wildcard [0-9][0-9]_*))

.PHONY: all run clean receipts test
all:
	@for d in $(DIRS); do $(MAKE) -C $$d || exit 1; done
# SCRATCH_DIR=<dir> is passed to 06_disk and 08_repository only.
run:
	@for d in $(DIRS); do echo "=== $$d"; \
	  case $$d in 06_disk|08_repository) sd="$(SCRATCH_DIR)" ;; *) sd= ;; esac; \
	  $(MAKE) -s -C $$d run SCRATCH_DIR="$$sd" || exit 1; done
clean:
	@for d in $(DIRS); do $(MAKE) -s -C $$d clean; done
# Instructor only: three trials per experiment, saved under receipts/<host>/.
receipts:
	bash run_receipts.sh
# Build all with -Werror, run 08 make check, run small 06 and 08 in a temp directory, check CSV shape.
test:
	@bash test.sh
