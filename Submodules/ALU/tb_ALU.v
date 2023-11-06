// Using Riviera simulator from EDAplayground
// Options: -timescale 1ns/1ns -sv2k9

module tb_ALU();

    reg [7:0] op1;
    reg [7:0] op2;
    reg [2:0] op_code;
    wire [7:0] result;

    ALU DUT(
        .A(op1),
        .B(op2),
        .op_code(op_code),
        .result(result)
    );

  initial begin
    $display("Addition");
    op1 = 8'd40;
    op2 = 8'd64;
    op_code = 3'b000;
    display; //result = 104 = 8'b01101000

    $display("Subtraction");
    op1 = 8'd64;
    op2 = 8'd5;
    op_code = 3'b001;
    display; //result = 59 = 8'b00111011

    $display("Multiplication");
    op1 = 8'd10;
    op2 = 8'd3;
    op_code = 3'b010;
    display; //result = 30 = 8'b00011110

    $display("Clean Division");
    op1 = 8'd20;
    op2 = 8'd5;
    op_code = 3'b011;
    display; //result = 4 = 8'b00000100

    $display("Fraction Division");
    op1 = 8'd20;
    op2 = 8'd8;
    op_code = 3'b011;
    display; //result = 2.5 -> 2 = 8'b00000010

    $display("Bitwise AND");
    op1 = 8'b11010110;
    op2 = 8'b01001010;
    op_code = 3'b100;
    display; //result = 8'b01000010 = 8'd66

    $display("Bitwise OR");
    op1 = 8'b01101010;
    op2 = 8'b00101011;
    op_code = 3'b101;
    display; //result = 8'b01101011 = 8'd107

    $display("Bitwise XOR");
    op1 = 8'b10110111;
    op2 = 8'b10011110;
    op_code = 3'b110;
    display; //result = 8'b00101001 = 8'd41

    $display("Output Zero");
    op1 = 8'b01111011;
    op2 = 8'b01001001;
    op_code = 3'b111;
    display; //result = 8'b00000000 = 8'd0

  end
  
  task display;
    #1 $display("result: %8b", result);
  endtask

endmodule