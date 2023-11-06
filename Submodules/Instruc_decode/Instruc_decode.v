`timescale 1ps/1ps

module Instruc_decode(
    input clk,
    input [15:0] instruc,
    output reg [2:0] ALU_op,
    output reg ALU_src_cntrl,
    output reg Reg_write,
    output reg Mem_write,
    output reg Reg_src_cntrl,
    output reg [2:0] Rs,
    output reg [2:0] Rt,
    output reg [2:0] Rd,
    output reg [2:0] Imm,
    output reg [5:0] Addr);

    always@(posedge clk) begin
        ALU_op <= instruc[15:13];
        ALU_src_cntrl <= instruc[12];
        Reg_write <= instruc[11];
        Mem_write <= instruc[10];
        Reg_src_cntrl <= instruc[9];
        Rs <= instruc[8:6];
        Rt <= instruc[5:3];
        Rd <= instruc[2:0];
        Imm <= instruc[5:3];
        Addr <= instruc[5:0];
    end

endmodule
