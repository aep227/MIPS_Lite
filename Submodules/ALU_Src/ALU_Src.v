`timescale 1ps/1ps

module ALU_Src(
    input [7:0] Rt_data,
    input [7:0] Imm,
    input ALU_src_cntrl,
    output [7:0] to_ALU);

    assign to_ALU = ALU_src_cntrl ? Imm : Rt_data;

endmodule