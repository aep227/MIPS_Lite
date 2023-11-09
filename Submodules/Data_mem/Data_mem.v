`timescale 1ps/1ps

module Data_Mem(
    input clk,
    input rst,
    input [7:0] data_in,
    input [7:0] addr,
    input mem_write,
    output [7:0] data_out
    );

    reg [7:0] data_address [0:63]; // 6-bit address space of byte-long addresses

    always@(posedge clk or posedge rst) begin
        if(rst) begin
            integer i;
            for(i = 0; i < 64; i = i + 1) data_address[i] <= 8'd0;
        end
        else begin
            if(mem_write)
                data_address[addr] <= data_in;
        end
    end

    assign data_out = data_address[addr];

endmodule