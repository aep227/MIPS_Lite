// Using Riviera simulator from EDAplayground
// Options: -timescale 1ns/1ns -sv2k9

module tb_Reg_Src();

    reg [7:0] from_ALU;
    reg [7:0] from_DMem;
    reg Reg_src_cntrl;
    wire [7:0] to_reg;

    Reg_Src DUT(
        .from_ALU(from_ALU),
        .from_DMem(from_DMem),
        .Reg_src_cntrl(Reg_src_cntrl),
        .to_reg(to_reg)
    );

  initial begin 
    $display("Initial state");
    from_ALU = 8'd0;
    from_DMem = 8'd8;
    Reg_src_cntrl = 1'b0;
    display;
    
    $display("Switch reg_src_cntrl");
    Reg_src_cntrl = 1'b1;
    display;

    $display("Change from_ALU");
    from_ALU = 8'd4;
    display;

    $display("Change from_DMem");
    from_DMem = 8'd12;
    display;

    $display("Switch reg_src_cntrl back");
    Reg_src_cntrl = 1'b0;
    display;
  end
  
  task display;
    #1 $display("to_reg:%0d", to_reg);
  endtask

endmodule