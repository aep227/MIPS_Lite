`timescale 1ps/1ps

module Reg_Src(
    input [7:0] from_ALU,
    input [7:0] from_DMem,
    input Reg_src_cntrl,
    output [7:0] to_reg);

    assign to_reg = Reg_src_cntrl ? from_DMem : from_ALU;

endmodule