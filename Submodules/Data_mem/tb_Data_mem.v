// Using Riviera simulator from EDAplayground
// Options: -timescale 1ns/1ns -sv2k9

module tb_data_mem();

    reg clk;
    reg rst;
    reg [7:0] data_in;
    reg [5:0] addr;
    reg mem_write;
    wire [7:0] data_out;

    Data_Mem DUT(
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .addr(addr),
        .mem_write(mem_write),
        .data_out(data_out)
    );

  always begin
    #5
    clk = ~clk;
  end


  initial begin 
//     $monitor("clk: %1b at time: %t", clk, $time);
    $monitor("data_out:%8b at time: %t", data_out, $time);
    clk = 1'b0;
    rst = 1'b0;
    mem_write = 1'b0;
    data_in = 8'd0;
    addr = 6'd0;
    
    // Reset all registers
    #3
    rst = 1'b1;
    #2
    rst = 1'b0;
    #10
    // Put 30 into address 10
    data_in = 8'd30;
    addr = 6'd10;
    mem_write = 1'b1;
    #10
    // Put 25 into address 8
    data_in = 8'd25;
    addr = 6'd8;
    #10
    // Put 47 into address 32
    data_in = 8'd47;
    addr = 6'd32;
    #10
    // Put 49 into address 48
    data_in = 8'd49;
    addr = 6'd48;
    #10
    // Overwrite 7 into address 10
    data_in = 8'd7;
    addr = 6'd10;
    #10
    mem_write = 1'b0;
    
    // View data memory addresses
    $display("Address 8");
    addr = 6'd8;
    #10
    $display("Address 32");
    addr = 6'd32;
    #10
    $display("Address 48");
    addr = 6'd48;
    #10
    $display("Address 10");
    addr = 6'd10;

  end

endmodule