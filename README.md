# learning-riscv

- [Risc V asm docs](https://riscv-programming.org/book/riscv-book.html)
- [Getting started video](https://www.youtube.com/watch?v=GWiAQs4-UQ0)
- [cheat sheet](docs/cheat-sheet.pdf)

## Instructions

- `rd` is a destination register.
- `rs1` and `rs2` are source registers.
- `imm` is an immediate value, which is a constant value encoded within the instruction itself.
- `offset` is also an immediate value, but it is used specifically for calculating memory addresses or branch targets.

| Instruction | Format | Parameter Count | Parameter Types | Description |
| ----------- | -------- | --------------- | --------------- | ----------- |
| LUI | U-type | 2 | rd, imm | Load upper immediate. |
| AUIPC | U-type | 2 | rd, imm | Add upper immediate to pc. |
| JAL | J-type | 2 | rd, offset | Jump and link. |
| JALR | I-type | 3 | rd, rs1, offset | Jump and link register. |
| BEQ | B-type | 3 | rs1, rs2, offset | Branch if equal. |
| BNE | B-type | 3 | rs1, rs2, offset | Branch if not equal. |
| BLT | B-type | 3 | rs1, rs2, offset | Branch if less than. |
| BGE | B-type | 3 | rs1, rs2, offset | Branch if greater than or equal. |
| BLTU | B-type | 3 | rs1, rs2, offset | Branch if less than unsigned. |
| BGEU | B-type | 3 | rs1, rs2, offset | Branch if greater than or equal unsigned. |
| LB | I-type | 3 | rd, rs1, offset | Load byte. |
| LH | I-type | 3 | rd, rs1, offset | Load halfword. |
| LW | I-type | 3 | rd, rs1, offset | Load word. |
| LBU | I-type | 3 | rd, rs1, offset | Load byte unsigned. |
| LHU | I-type | 3 | rd, rs1, offset | Load halfword unsigned. |
| SB | S-type | 3 | rs1, rs2, offset | Store byte. |
| SH | S-type | 3 | rs1, rs2, offset | Store halfword. |
| SW | S-type | 3 | rs1, rs2, offset | Store word. |
| ADDI | I-type | 3 | rd, rs1, imm | Add immediate. |
| SLTI | I-type | 3 | rd, rs1, imm | Set less than immediate. |
| SLTIU | I-type | 3 | rd, rs1, imm | Set less than immediate unsigned. |
| XORI | I-type | 3 | rd, rs1, imm | Exclusive OR immediate. |
| ORI | I-type | 3 | rd, rs1, imm | OR immediate. |
| ANDI | I-type | 3 | rd, rs1, imm | AND immediate. |
| SLLI | I-type | 3 | rd, rs1, imm | Shift left logical immediate. |
| SRLI | I-type | 3 | rd, rs1, imm | Shift right logical immediate. |
| SRAI | I-type | 3 | rd, rs1, imm | Shift right arithmetic immediate. |
| ADD | R-type | 3 | rd, rs1, rs2 | Add. |
| SUB | R-type | 3 | rd, rs1, rs2 | Subtract. |
| SLL | R-type | 3 | rd, rs1, rs2 | Shift left logical. |
| SLT | R-type | 3 | rd, rs1, rs2 | Set less than. |
| SLTU | R-type | 3 | rd, rs1, rs2 | Set less than unsigned. |
| XOR | R-type | 3 | rd, rs1, rs2 | Exclusive OR. |
| SRL | R-type | 3 | rd, rs1, rs2 | Shift right logical. |
| SRA | R-type | 3 | rd, rs1, rs2 | Shift right arithmetic. |
| OR | R-type | 3 | rd, rs1, rs2 | OR. |
| AND | R-type | 3 | rd, rs1, rs2 | AND. |
| FENCE | I-type | 2 | rd, imm | Ensures order of memory operations. |
| ECALL | I-type | 0 | None | Environment Call. |
| EBREAK | I-type | 0 | None | Environment Break. |

This is just a basic description of the parameter types. Each instruction will interpret its parameters differently according to its semantics. For example, for the `SLLI`, `SRLI`, and `SRAI` instructions, the `imm` parameter is interpreted as the number of places to shift. But for the `ADDI` instruction, the `imm` parameter is simply an integer value to add to `rs1`. And for all the branch and jump instructions, the `offset` parameter is used as part of a memory address calculation. 

Note that the number of parameters does not include the opcode itself. All RISC-V instructions have an opcode that is used to determine what operation to perform. These opcodes are typically not counted as parameters since they are part of the instruction itself.
