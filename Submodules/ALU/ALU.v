`timescale 1ps/1ps

module ALU(
    input [7:0] A,
    input [7:0] B,
    input [2:0] op_code,
    output reg [7:0] result);

    always@(*) begin
        case(op_code)
            3'b000: result <= A + B;
            3'b001: result <= A - B;
            3'b010: result <= A * B;
            3'b011: result <= A / B;
            3'b100: result <= A & B;
            3'b101: result <= A | B;
            3'b110: result <= A ^ B;
            3'b111: result <= 8'd0;
            default: result <= 8'dx;
        endcase
    end

endmodule