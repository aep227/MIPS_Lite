// Using Riviera simulator from EDAplayground
// Options: -timescale 1ns/1ns -sv2k9

module tb_register_mem();

    reg clk;
    reg rst;
    reg [2:0] ALU_op;
    reg [2:0] rs_in;
    reg [2:0] rt_in;
    reg [2:0] rd_in;
    reg [7:0] from_reg_src;
    reg reg_write;
    wire [7:0] rs_out;
    wire [7:0] rt_out;
    wire [7:0] save_out;

    Register_Mem DUT(
        .clk(clk),
        .rst(rst),
        .ALU_op(ALU_op),
        .rs_in(rs_in),
        .rt_in(rt_in),
        .rd_in(rd_in),
        .from_reg_src(from_reg_src),
        .reg_write(reg_write),
        .rs_out(rs_out),
        .rt_out(rt_out),
        .save_out(save_out)
    );

  always begin
    #5
    clk = ~clk;
  end


  initial begin 
//     $monitor("clk: %1b at time: %t", clk, $time);
    $monitor("rst:%1b at time: %t", rst, $time);
    $monitor("rs_in:%3b at time: %t", rs_in, $time);
    $monitor("rs_out:%8b at time: %t", rs_out, $time);
    $monitor("rt_in:%3b at time: %t", rt_in, $time);
    $monitor("rt_out:%8b at time: %t", rt_out, $time);
    $monitor("rd_in:%3b at time: %t", rd_in, $time);
    clk = 1'b0;
    rst = 1'b0;
    ALU_op = 3'b000;
    rs_in = 3'b000;
    rt_in = 3'b000;
    rd_in = 3'b000;
    from_reg_src = 8'd0;
    reg_write = 1'b0;
    
    // Reset all registers
    #3
    rst = 1'b1;
    #2
    rst = 1'b0;
    rs_in = 3'b001;
    rt_in = 3'b010;
    #10
    rs_in = 3'b011;
    rt_in = 3'b100;
    #10
    rs_in = 3'b101;
    rt_in = 3'b110;
    #10
    rs_in = 3'b111;
    rt_in = 3'b100;
    #10
    
    // Test ADDI to register 1
    $display("ADDI $1 $1 5");
    ALU_op = 3'b000;
    rs_in = 3'b001; // Source register
    rt_in = 3'b101; // Immediate value
    rd_in = 3'b001; // Destination register
    reg_write = 1'b1;
    from_reg_src = 8'd5;
    #10
    // Test ADDI to register 2
    $display("ADDI $2 $2 4");
    ALU_op = 3'b000;
    rs_in = 3'b010; // Source register
    rt_in = 3'b100; // Immediate value
    rd_in = 3'b010; // Destination register
    reg_write = 1'b1;
    from_reg_src = 8'd4;
    #10
    // Test MULT to register 3
    $display("MULT $1 $2 $3");
    ALU_op = 3'b010;
    rs_in = 3'b001; // Source register
    rt_in = 3'b010; // Source register
    rd_in = 3'b011; // Destination register
    reg_write = 1'b1;
    from_reg_src = 8'd20;
    #10
    // Check register values
    $display("Checking register values");
    ALU_op = 3'b010;
    rs_in = 3'b001;
    rt_in = 3'b010;
    rd_in = 3'b000;
    reg_write = 1'b0;
    from_reg_src = 8'd5;
    #10
    rs_in = 3'b011;
    

  end

endmodule