# learning-riscv

- [Risc V asm docs](https://riscv-programming.org/book/riscv-book.html)
- [Getting started video](https://www.youtube.com/watch?v=GWiAQs4-UQ0)
- [cheat sheet](docs/cheat-sheet.pdf)

## Parameters

- `rd` is a destination register.
- `rs1` and `rs2` are source registers.
- `imm` is an immediate value, which is a constant value encoded within the instruction itself.
- `offset` is also an immediate value, but it is used specifically for calculating memory addresses or branch targets.

## Instructions

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

Each instruction will interpret its parameters differently according to its semantics. For example, for the `SLLI`, `SRLI`, and `SRAI` instructions, the `imm` parameter is interpreted as the number of places to shift. But for the `ADDI` instruction, the `imm` parameter is simply an integer value to add to `rs1`. And for all the branch and jump instructions, the `offset` parameter is used as part of a memory address calculation. 

Note that the number of parameters does not include the opcode itself. All RISC-V instructions have an opcode that is used to determine what operation to perform. These opcodes are typically not counted as parameters since they are part of the instruction itself.


Sure! Here's a new table that includes examples of each instruction's usage. For the sake of these examples, register names like x1, x2, x3, etc. are used. Note that RISC-V has designated uses for certain register names (like x0 always holding the value 0, x1 typically used for return addresses, etc.), but these examples don't specifically stick to those conventions.

## Registers

| Register | Example Usage | Description |
| -------- | ------------- | ----------- |
| `x0` / `zero` | `add x5, zero, x6 # x5 gets the value of x6` | Hardwired to zero, cannot be written to. |
| `x1` / `ra` | `jal ra, function # Jump to function and save return addr in ra` | Return address register. Used by `jal` and `jalr` instructions. |
| `x2` / `sp` | `addi sp, sp, -16 # Decrease stack pointer by 16 bytes` | Stack pointer register. Points to the top of the stack. |
| `x3` / `gp` | `lw x5, offset(gp) # Load global variable value into x5` | Global pointer register. Base pointer for global variables. |
| `x4` / `tp` | Specific to OS/runtime environment. | Thread pointer register. Used for thread-local storage. |
| `x5-x7` / `t0-t2` | `add t0, x5, x6 # Add x5 and x6, store result in t0` | Temp registers for short-lived values. |
| `x8` / `s0` or `fp` | `sw fp, 0(sp) # Save frame pointer to the stack` | Saved register or frame pointer. |
| `x9` / `s1` | `sw s1, -4(sp) # Save s1 to the stack` | Saved register. |
| `x10-x11` / `a0-a1` | `add a0, a1, a2 # Add a1 and a2, result is return value in a0` | Used for function arguments and return values. |
| `x12-x17` / `a2-a7` | `add a3, a4, a5 # Add a4 and a5, store result in a3 for function call` | Used for function arguments. |
| `x18-x27` / `s2-s11` | `sw s2, -8(sp) # Save s2 to the stack` | Saved registers. |
| `x28-x31` / `t3-t6` | `add t3, x5, x6 # Add x5 and x6, store result in t3` | Temp registers for short-lived values. |

## Examples

| Instruction | Example | Description |
| ----------- | ------- | ----------- |
| LUI | `lui x5, 1000` | Loads the immediate value 1000 shifted left 12 bits into x5. |
| AUIPC | `auipc x5, 1000` | Adds the immediate value 1000 shifted left 12 bits to the program counter, and stores the result in x5. |
| JAL | `jal x5, 1000` | Jumps to an address offset from the program counter by 1000, and stores the return address in x5. |
| JALR | `jalr x5, x6, 100` | Jumps to an address computed by adding 100 to the value in x6, and stores the return address in x5. |
| BEQ | `beq x5, x6, 100` | If x5 equals x6, branches to an address offset from the program counter by 100. |
| BNE | `bne x5, x6, 100` | If x5 does not equal x6, branches to an address offset from the program counter by 100. |
| BLT | `blt x5, x6, 100` | If x5 is less than x6, branches to an address offset from the program counter by 100. |
| BGE | `bge x5, x6, 100` | If x5 is greater than or equal to x6, branches to an address offset from the program counter by 100. |
| BLTU | `bltu x5, x6, 100` | If x5 is less than x6 when both are treated as unsigned, branches to an address offset from the program counter by 100. |
| BGEU | `bgeu x5, x6, 100` | If x5 is greater than or equal to x6 when both are treated as unsigned, branches to an address offset from the program counter by 100. |
| LB | `lb x5, 100(x6)` | Loads a byte from memory at an address computed by adding 100 to the value in x6, and stores the result in x5. |
| LH | `lh x5, 100(x6)` | Loads a halfword from memory at an address computed by adding 100 to the value in x6, and stores the result in x5. |
| LW | `lw x5, 100(x6)` | Loads a word from memory at an address computed by adding 100 to the value in x6, and stores the result in x5. |
| LBU | `lbu x5, 100(x6)` | Loads a byte from memory at an address computed by adding 100 to the value in x6, zero extends it, and stores the result in x5. |
| LHU | `lhu x5, 100(x6)` | Loads a halfword from memory at an address computed by adding 100 to the value in x6, zero extends it, and stores the result in x5. |
| SB | `sb x5, 100(x6)` | Stores a byte from x5 to memory at an address computed by adding 100 to the value in x6. |
| SH | `sh x5, 100(x6)` | Stores a halfword from x5 to memory at an address computed by adding 100 to the value in x6. |
| SW | `sw x5, 100(x6)` | Stores a word from x5 to memory at an address computed by adding 100 to the value in x6. |
| ADDI | `addi x5, x6, 100` | Adds the immediate value 100 to the value in x6, and stores the result in x5. |
| SLTI | `slti x5, x6, 100` | If the value in x6 is less than the immediate value 100, sets x5 to 1. Otherwise, sets x5 to 0. |
| SLTIU | `sltiu x5, x6, 100` | If the value in x6 is less than the immediate value 100 when both are treated as unsigned, sets x5 to 1. Otherwise, sets x5 to 0. |
| XORI | `xori x5, x6, 100` | Performs bitwise XOR between the value in x6 and the immediate value 100, and stores the result in x5. |
| ORI | `ori x5, x6, 100` | Performs bitwise OR between the value in x6 and the immediate value 100, and stores the result in x5. |
| ANDI | `andi x5, x6, 100` | Performs bitwise AND between the value in x6 and the immediate value 100, and stores the result in x5. |
| SLLI | `slli x5, x6, 10` | Shifts the value in x6 left by 10 places, and stores the result in x5. |
| SRLI | `srli x5, x6, 10` | Shifts the value in x6 right by 10 places (treating the value as unsigned), and stores the result in x5. |
| SRAI | `srai x5, x6, 10` | Shifts the value in x6 right by 10 places (treating the value as signed), and stores the result in x5. |
| ADD | `add x5, x6, x7` | Adds the values in x6 and x7, and stores the result in x5. |
| SUB | `sub x5, x6, x7` | Subtracts the value in x7 from the value in x6, and stores the result in x5. |
| SLL | `sll x5, x6, x7` | Shifts the value in x6 left by the number of places specified in x7, and stores the result in x5. |
| SLT | `slt x5, x6, x7` | If the value in x6 is less than the value in x7, sets x5 to 1. Otherwise, sets x5 to 0. |
| SLTU | `sltu x5, x6, x7` | If the value in x6 is less than the value in x7 when both are treated as unsigned, sets x5 to 1. Otherwise, sets x5 to 0. |
| XOR | `xor x5, x6, x7` | Performs bitwise XOR between the

 values in x6 and x7, and stores the result in x5. |
| SRL | `srl x5, x6, x7` | Shifts the value in x6 right by the number of places specified in x7 (treating the value as unsigned), and stores the result in x5. |
| SRA | `sra x5, x6, x7` | Shifts the value in x6 right by the number of places specified in x7 (treating the value as signed), and stores the result in x5. |
| OR | `or x5, x6, x7` | Performs bitwise OR between the values in x6 and x7, and stores the result in x5. |
| AND | `and x5, x6, x7` | Performs bitwise AND between the values in x6 and x7, and stores the result in x5. |
| FENCE | `fence` | Ensures that all load and store instructions that appear before the FENCE in program order complete before any that come after. |
| ECALL | `ecall` | Makes a system call. |
| EBREAK | `ebreak` | Triggers a breakpoint exception. |

