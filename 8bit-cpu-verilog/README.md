# A simple 8 bit CPU in Verilog

## Registers 

**8 bits each**

3 register address bits = 8 registers

- General purpose: R0 - R7

- Program counter: PC (8bits)

- Instruction register: IR 8 bits

## Instruction format

We use 16 bits instructions to not be limited in our instruction/register numbers

[15:12] opcode | [11:9] rd | [8:6] rs | [5:0] imm

## Opcodes

- 0000 ADD  rd = rd + rs
- 0001 SUB  rd = rd - rs
- 0010 LOAD rd[imm]  rd <-- MEM[imm]
- 0011 SW   rs[imm]  rs --> MEM[imm]
- 0100 BEQ  
- 0101 MOV
