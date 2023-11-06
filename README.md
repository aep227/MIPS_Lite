# MIPS_Lite

Cut down MIPS inspired computer architecture. I designed this to brush up on my Verilog skills 

## Features

* 16-bit instructions
* Seven function ALU (Addition, subtraction, multiplication, division, bitwise AND, bitwise OR, bitwise XOR)
* Eight 8-bit registers
* 6-bit data memory address space

## Supported Instructions

* ADD
* SUB
* MULT
* DIV
* AND
* OR
* XOR
* "Immediate" versions of all the above (simply add I to the end i.e. ADDI, SUBI, etc)
* LOAD
* SAVE

## Instruction Format

* ALU_op: bits 15:13
  * 000 = Addition
  * 001 = Subtraction
  * 010 = Multiplication
  * 011 = Division
  * 100 = Bitwise AND
  * 101 = Bitwise OR
  * 110 = Bitwise XOR
  * 111 = Output zero
* ALU_src: bit 12
  * 1 = Register Rt. 0 = Immediate
* Reg_Write: bit 11
  * 1 = write enable. 0 = disable
* Mem_Write: bit 10
  * 1 = write enable. 0 = disable
* Reg_Src: bit 9
  * 1 = Data memory. 0 = ALU
* Register Rs: bits 8:6
* Register Rt: bits 5:3
* Register Rd: bits 2:0

For Immediate instructions, bits 5:0 are used as the immediate value.

For LOAD/SAVE, bits 5:0 are used as the address to read/write to
