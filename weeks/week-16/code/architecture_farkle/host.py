"""Small, standard-library host inventory for Architecture Week 16 receipts."""

from dataclasses import asdict, dataclass
import os
from pathlib import Path
import platform
import socket

from . import ACCELERATOR_USED, EXECUTION_MODE


def _cpu_model():
    """Return a useful CPU model string without adding a dependency."""
    cpuinfo = Path("/proc/cpuinfo")
    if cpuinfo.is_file():
        try:
            for line in cpuinfo.read_text(encoding="utf-8", errors="replace").splitlines():
                if line.lower().startswith("model name") and ":" in line:
                    return line.split(":", 1)[1].strip()
        except OSError:
            pass
    return platform.processor() or "unknown"


@dataclass(frozen=True)
class HostEvidence:
    hostname: str
    platform: str
    system: str
    release: str
    machine: str
    cpu_model: str
    logical_cpus: int
    python_version: str
    execution_mode: str
    accelerator_used: bool
    accelerator_note: str

    def to_dict(self):
        return asdict(self)


def collect_host_evidence():
    """Describe the machine that actually executed the required CPU path."""
    return HostEvidence(
        hostname=socket.gethostname(),
        platform=platform.platform(),
        system=platform.system(),
        release=platform.release(),
        machine=platform.machine(),
        cpu_model=_cpu_model(),
        logical_cpus=os.cpu_count() or 1,
        python_version=platform.python_version(),
        execution_mode=EXECUTION_MODE,
        accelerator_used=ACCELERATOR_USED,
        accelerator_note=(
            "Required path is native Python CPU. Physical GPU presence is not "
            "evidence of accelerator use."
        ),
    )
