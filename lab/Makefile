PYTHON ?= python3
export PYTHONPATH := $(CURDIR):$(PYTHONPATH)

.PHONY: doctor probe smoke validate clean

doctor:
	./bin/archlab doctor

probe:
	./bin/archprobe

smoke:
	./bin/archlab smoke

validate:
	$(PYTHON) -m py_compile archlab/*.py
	$(CC) -Wall -Wextra -pedantic -std=c11 -O2 experiments/dependency.c -o /tmp/archlab-dependency-check
	$(CC) -Wall -Wextra -pedantic -std=c11 -O2 experiments/memory.c -o /tmp/archlab-memory-check
	$(CC) -Wall -Wextra -pedantic -std=c11 -O2 -fopenmp experiments/scaling.c -o /tmp/archlab-scaling-check
	$(CC) -Wall -Wextra -pedantic -std=c11 -O3 experiments/vector.c -o /tmp/archlab-vector-check
	./bin/archlab smoke --work 4000000

clean:
	rm -rf runs archlab/__pycache__
