from __future__ import annotations

import shutil
import struct
import subprocess
from pathlib import Path
from typing import Any

from .common import ensure_dir, lab_root, utc_iso, write_json

REG_NAMES = [
    "x0/zero", "x1/ra", "x2/sp", "x3/gp", "x4/tp", "x5/t0", "x6/t1", "x7/t2",
    "x8/s0", "x9/s1", "x10/a0", "x11/a1", "x12/a2", "x13/a3", "x14/a4", "x15/a5",
    "x16/a6", "x17/a7", "x18/s2", "x19/s3", "x20/s4", "x21/s5", "x22/s6", "x23/s7",
    "x24/s8", "x25/s9", "x26/s10", "x27/s11", "x28/t3", "x29/t4", "x30/t5", "x31/t6",
]


def _sext(value: int, bits: int) -> int:
    sign = 1 << (bits - 1)
    return (value & (sign - 1)) - (value & sign)


def _u32(x: int) -> int:
    return x & 0xFFFFFFFF


def simulate_rv32i(code: bytes, max_steps: int = 10000) -> dict[str, Any]:
    regs = [0] * 32
    memory = bytearray(max(65536, len(code) + 4096))
    memory[: len(code)] = code
    regs[2] = len(memory) - 16
    pc = 0
    trace: list[dict[str, Any]] = []
    halted = False
    reason = None

    def load(addr: int, width: int, signed: bool) -> int:
        if addr < 0 or addr + width > len(memory):
            raise RuntimeError(f"load out of bounds: 0x{addr:x}")
        val = int.from_bytes(memory[addr:addr+width], "little", signed=False)
        return _sext(val, width * 8) if signed else val

    def store(addr: int, value: int, width: int) -> None:
        if addr < 0 or addr + width > len(memory):
            raise RuntimeError(f"store out of bounds: 0x{addr:x}")
        memory[addr:addr+width] = int(value & ((1 << (8 * width)) - 1)).to_bytes(width, "little")

    for step in range(max_steps):
        if pc < 0 or pc + 4 > len(code):
            reason = "pc_left_program"
            break
        insn = struct.unpack_from("<I", code, pc)[0]
        opcode = insn & 0x7F
        rd = (insn >> 7) & 0x1F
        funct3 = (insn >> 12) & 0x7
        rs1 = (insn >> 15) & 0x1F
        rs2 = (insn >> 20) & 0x1F
        funct7 = (insn >> 25) & 0x7F
        old_pc = pc
        pc_next = pc + 4
        mnemonic = "unknown"

        if insn == 0x00100073:  # ebreak
            mnemonic = "ebreak"
            halted = True
            reason = "ebreak"
        elif opcode == 0x13:  # OP-IMM
            imm = _sext(insn >> 20, 12)
            if funct3 == 0x0:
                regs[rd] = _u32(regs[rs1] + imm); mnemonic = "addi"
            elif funct3 == 0x2:
                regs[rd] = 1 if _sext(regs[rs1], 32) < imm else 0; mnemonic = "slti"
            elif funct3 == 0x3:
                regs[rd] = 1 if regs[rs1] < _u32(imm) else 0; mnemonic = "sltiu"
            elif funct3 == 0x4:
                regs[rd] = _u32(regs[rs1] ^ imm); mnemonic = "xori"
            elif funct3 == 0x6:
                regs[rd] = _u32(regs[rs1] | imm); mnemonic = "ori"
            elif funct3 == 0x7:
                regs[rd] = _u32(regs[rs1] & imm); mnemonic = "andi"
            elif funct3 == 0x1:
                shamt = (insn >> 20) & 0x1F
                regs[rd] = _u32(regs[rs1] << shamt); mnemonic = "slli"
            elif funct3 == 0x5:
                shamt = (insn >> 20) & 0x1F
                if funct7 == 0x20:
                    regs[rd] = _u32(_sext(regs[rs1], 32) >> shamt); mnemonic = "srai"
                else:
                    regs[rd] = _u32(regs[rs1] >> shamt); mnemonic = "srli"
            else:
                raise RuntimeError(f"unsupported OP-IMM funct3={funct3}")
        elif opcode == 0x33:  # OP
            a, b = regs[rs1], regs[rs2]
            if funct3 == 0x0 and funct7 == 0x00:
                regs[rd] = _u32(a + b); mnemonic = "add"
            elif funct3 == 0x0 and funct7 == 0x20:
                regs[rd] = _u32(a - b); mnemonic = "sub"
            elif funct3 == 0x1:
                regs[rd] = _u32(a << (b & 0x1F)); mnemonic = "sll"
            elif funct3 == 0x2:
                regs[rd] = 1 if _sext(a, 32) < _sext(b, 32) else 0; mnemonic = "slt"
            elif funct3 == 0x3:
                regs[rd] = 1 if a < b else 0; mnemonic = "sltu"
            elif funct3 == 0x4:
                regs[rd] = _u32(a ^ b); mnemonic = "xor"
            elif funct3 == 0x5 and funct7 == 0x20:
                regs[rd] = _u32(_sext(a, 32) >> (b & 0x1F)); mnemonic = "sra"
            elif funct3 == 0x5:
                regs[rd] = _u32(a >> (b & 0x1F)); mnemonic = "srl"
            elif funct3 == 0x6:
                regs[rd] = _u32(a | b); mnemonic = "or"
            elif funct3 == 0x7:
                regs[rd] = _u32(a & b); mnemonic = "and"
            else:
                raise RuntimeError(f"unsupported OP funct3={funct3} funct7={funct7}")
        elif opcode == 0x37:  # LUI
            regs[rd] = insn & 0xFFFFF000; mnemonic = "lui"
        elif opcode == 0x17:  # AUIPC
            regs[rd] = _u32(pc + (insn & 0xFFFFF000)); mnemonic = "auipc"
        elif opcode == 0x6F:  # JAL
            imm = (((insn >> 31) & 1) << 20) | (((insn >> 12) & 0xFF) << 12) | (((insn >> 20) & 1) << 11) | (((insn >> 21) & 0x3FF) << 1)
            imm = _sext(imm, 21)
            regs[rd] = _u32(pc + 4); pc_next = pc + imm; mnemonic = "jal"
        elif opcode == 0x67:  # JALR
            imm = _sext(insn >> 20, 12)
            target = (regs[rs1] + imm) & ~1
            regs[rd] = _u32(pc + 4); pc_next = target; mnemonic = "jalr"
        elif opcode == 0x63:  # BRANCH
            imm = (((insn >> 31) & 1) << 12) | (((insn >> 7) & 1) << 11) | (((insn >> 25) & 0x3F) << 5) | (((insn >> 8) & 0xF) << 1)
            imm = _sext(imm, 13)
            a, b = regs[rs1], regs[rs2]
            take = False
            if funct3 == 0x0: take = a == b; mnemonic = "beq"
            elif funct3 == 0x1: take = a != b; mnemonic = "bne"
            elif funct3 == 0x4: take = _sext(a, 32) < _sext(b, 32); mnemonic = "blt"
            elif funct3 == 0x5: take = _sext(a, 32) >= _sext(b, 32); mnemonic = "bge"
            elif funct3 == 0x6: take = a < b; mnemonic = "bltu"
            elif funct3 == 0x7: take = a >= b; mnemonic = "bgeu"
            else: raise RuntimeError(f"unsupported branch funct3={funct3}")
            if take: pc_next = pc + imm
        elif opcode == 0x03:  # LOAD
            imm = _sext(insn >> 20, 12); addr = _u32(regs[rs1] + imm)
            if funct3 == 0x0: regs[rd] = _u32(load(addr, 1, True)); mnemonic = "lb"
            elif funct3 == 0x1: regs[rd] = _u32(load(addr, 2, True)); mnemonic = "lh"
            elif funct3 == 0x2: regs[rd] = _u32(load(addr, 4, True)); mnemonic = "lw"
            elif funct3 == 0x4: regs[rd] = _u32(load(addr, 1, False)); mnemonic = "lbu"
            elif funct3 == 0x5: regs[rd] = _u32(load(addr, 2, False)); mnemonic = "lhu"
            else: raise RuntimeError(f"unsupported load funct3={funct3}")
        elif opcode == 0x23:  # STORE
            imm = ((insn >> 25) << 5) | ((insn >> 7) & 0x1F); imm = _sext(imm, 12)
            addr = _u32(regs[rs1] + imm)
            if funct3 == 0x0: store(addr, regs[rs2], 1); mnemonic = "sb"
            elif funct3 == 0x1: store(addr, regs[rs2], 2); mnemonic = "sh"
            elif funct3 == 0x2: store(addr, regs[rs2], 4); mnemonic = "sw"
            else: raise RuntimeError(f"unsupported store funct3={funct3}")
        else:
            raise RuntimeError(f"unsupported instruction 0x{insn:08x} at pc 0x{pc:x}")

        regs[0] = 0
        trace.append({"step": step, "pc": old_pc, "instruction_hex": f"0x{insn:08x}", "mnemonic": mnemonic})
        if halted:
            break
        pc = pc_next
    else:
        reason = "max_steps"

    named = {REG_NAMES[i]: regs[i] for i in range(32) if regs[i] != 0 or i in (10, 11, 12, 13)}
    return {"halted": halted, "halt_reason": reason, "steps": len(trace), "registers": named, "trace": trace}


def _compile_case(name: str, sources: list[Path], out_dir: Path, expected: dict[str, int], cflags: list[str] | None = None) -> dict[str, Any]:
    clang = shutil.which("clang")
    objdump = shutil.which("llvm-objdump")
    if not clang or not objdump:
        raise RuntimeError("RISC-V path requires clang and llvm-objdump in the Experimental Chamber")
    base = [clang, "--target=riscv32-unknown-elf", "-march=rv32i", "-mabi=ilp32"] + (cflags or [])
    elf = out_dir / f"{name}.elf"
    binary = out_dir / f"{name}.bin"
    disasm = out_dir / f"{name}.disassembly.txt"
    source_args = [str(x) for x in sources]
    cp = subprocess.run(base + ["-nostdlib", "-Wl,-Ttext=0x0", *source_args, "-o", str(elf)], capture_output=True, text=True)
    if cp.returncode != 0:
        raise RuntimeError(cp.stderr)
    cp = subprocess.run(base + ["-nostdlib", "-Wl,-Ttext=0x0", "-Wl,--oformat=binary", *source_args, "-o", str(binary)], capture_output=True, text=True)
    if cp.returncode != 0:
        raise RuntimeError(cp.stderr)
    cp = subprocess.run([objdump, "-d", str(elf)], capture_output=True, text=True)
    if cp.returncode != 0:
        raise RuntimeError(cp.stderr)
    disasm.write_text(cp.stdout, encoding="utf-8")
    sim = simulate_rv32i(binary.read_bytes())
    status = "PASS" if sim["halted"] and all(sim["registers"].get(k, 0) == v for k, v in expected.items()) else "FAIL"
    return {
        "name": name,
        "sources": [str(x.relative_to(lab_root())) for x in sources],
        "elf": elf.name,
        "binary": binary.name,
        "disassembly": disasm.name,
        "expected_registers": expected,
        "result": sim,
        "status": status,
    }


def build_and_run(out_dir: Path) -> dict[str, Any]:
    out_dir = ensure_dir(out_dir)
    asm_case = _compile_case(
        "assembly-demo",
        [lab_root() / "riscv" / "demo.S"],
        out_dir,
        {"x12/a2": 12, "x13/a3": 15},
    )
    c_case = _compile_case(
        "source-to-cpu",
        [lab_root() / "riscv" / "start.S", lab_root() / "riscv" / "specimen.c"],
        out_dir,
        {"x10/a0": 18, "x11/a1": 18},
        ["-O0", "-ffreestanding", "-fno-stack-protector"],
    )
    payload = {
        "schema": "swosu.archlab.riscv/v2",
        "timestamp_utc": utc_iso(),
        "target": "riscv32-unknown-elf",
        "march": "rv32i",
        "simulator": "course-owned bounded RV32I architectural-state interpreter; deliberately not cycle accurate",
        "cases": [asm_case, c_case],
        "status": "PASS" if asm_case["status"] == c_case["status"] == "PASS" else "FAIL",
        "scope_note": "The interpreter proves architectural instruction/state behavior for the supported RV32I subset. Pipeline timing and microarchitecture behavior require separate teaching models/experiments.",
    }
    write_json(out_dir / "riscv-receipt.json", payload)
    return payload
