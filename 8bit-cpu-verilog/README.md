# A simple 8 bit CPU in Verilog

## Registers 

**8 bits each**

- General purpose: R0 R1 R2 R3

- Program counter: PC

## Instruction format

[7:6] opcode | [5:4] rd | [3:2] rs | [1:0] imm

## Opcodes

- 00 ADD rd = rd + rs
- 01 SUB rd = rd - rs
- 10 MOVI rd = imm
- 11
