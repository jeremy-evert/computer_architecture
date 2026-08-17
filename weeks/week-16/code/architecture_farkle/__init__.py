"""Computer Architecture lens over the canonical Farkle + ML machine.

This package does not own Farkle rules or learning algorithms. It owns only the
execution-context evidence needed for the Week 16 cost-versus-effectiveness
judgment.
"""

ARCHITECTURE_RECEIPT_SCHEMA = "architecture-farkle-receipt-v1"
EXECUTION_MODE = "native-python-cpu"

# A GPU may be physically present on a host, but this required path does not use
# one. Accelerator evidence requires a separately validated backend.
ACCELERATOR_USED = False
