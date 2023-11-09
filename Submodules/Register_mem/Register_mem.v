`timescale 1ps/1ps

module Register_Mem(
    input clk,
    input rst,
    input [2:0] ALU_op,
    input [2:0] rs_in,
    input [2:0] rt_in,
    input [2:0] rd_in,
    input [7:0] from_reg_src,
    input reg_write,
    output [7:0] rs_out,
    output [7:0] rt_out,
    output [7:0] save_out
    );

  reg [7:0] registers [7:0]; // 8 registers with 8-bit width

    always@(posedge clk or posedge rst) begin
        if(rst) begin
            integer i;
            for(i = 0; i < 8; i = i + 1) registers[i] <= 8'd0;
        end
        else begin
            if(reg_write) begin
                if(ALU_op != 111) // Op is arithmetic. Use rd as destination
                    registers[rd_in] <= from_reg_src;
                else // Op is save/load. Use rs as destination
                    registers[rs_in] <= from_reg_src;
            end
        end
    end

    assign rs_out = registers[rs_in];
    assign rt_out = registers[rt_in];
    assign save_out = registers[rs_in];

endmodule