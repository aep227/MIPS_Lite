// Using Riviera simulator from EDAplayground
// Options: -timescale 1ns/1ns -sv2k9

module tb_ALU_Src();

    reg [7:0] Rt_data;
    reg [7:0] Imm;
    reg ALU_src_cntrl;
    wire [7:0] to_ALU;

    ALU_Src DUT(
        .Rt_data(Rt_data),
        .Imm(Imm),
        .ALU_src_cntrl(ALU_src_cntrl),
        .to_ALU(to_ALU)
    );

  initial begin 
    $display("Initial state");
    Rt_data = 8'd2;
    Imm = 8'd16;
    ALU_src_cntrl = 1'b0;
    display;
    
    $display("Switch ALU_src_cntrl");
    ALU_src_cntrl = 1'b1;
    display;

    $display("Change Rt_data");
    Rt_data = 8'd6;
    display;

    $display("Change Imm");
    Imm = 8'd8;
    display;

    $display("Switch ALU_src_cntrl back");
    ALU_src_cntrl = 1'b0;
    display;
  end
  
  task display;
    #1 $display("to_ALU:%0d", to_ALU);
  endtask

endmodule