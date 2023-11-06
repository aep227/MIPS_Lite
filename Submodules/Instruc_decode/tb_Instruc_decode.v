// Using Riviera simulator from EDAplayground
// Options: -timescale 1ns/1ns -sv2k9

module tb_ALU();

    reg clk;
    reg [15:0] instruction;
    wire [2:0] ALU_op;
    wire ALU_src_cntrl;
    wire Reg_write;
    wire Mem_write;
    wire Reg_src_cntrl;
    wire [2:0] Rs;
    wire [2:0] Rt;
    wire [2:0] Rd;
    wire [5:0] Imm_Add;

    Instruc_decode DUT(
        .instruc(instruction),
        .ALU_op(ALU_op),
        .ALU_src_cntrl(ALU_src_cntrl),
        .Reg_write(Reg_write),
        .Mem_write(Mem_write),
        .Reg_src_cntrl(Reg_src_cntrl),
        .Rs(Rs),
        .Rt(Rt),
        .Rd(Rd),
        .Imm_Add(Imm_Add)
    );

    inital begin
        clk = 0;
    end

    always begin
        clk = ~clk;
        #5
    end

  initial begin
    $display("ADD"); // 
    instruc = 16'h0000;
    display; 

  end
  
  task display;
    #1 $display("result: %8b", result);
  endtask

endmodule