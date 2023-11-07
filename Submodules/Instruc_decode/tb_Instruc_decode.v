// Using Riviera simulator from EDAplayground
// Options: -timescale 1ns/1ns -sv2k9

module tb_Instruc_decode();

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
    wire [2:0] Imm;
    wire [5:0] Addr;

    Instruc_decode DUT(
      	.clk(clk),
        .instruc(instruction),
        .ALU_op(ALU_op),
        .ALU_src_cntrl(ALU_src_cntrl),
        .Reg_write(Reg_write),
        .Mem_write(Mem_write),
        .Reg_src_cntrl(Reg_src_cntrl),
        .Rs(Rs),
        .Rt(Rt),
        .Rd(Rd),
        .Imm(Imm),
        .Addr(Addr)
    );
  
    always begin
        #5
        clk = ~clk;
    end

  initial begin
    clk = 0;
    $display("ADD $6 $2 $3");
    instruction = 16'h0993;
    #10
    display;
    $display("SUB $5 $2 $1");
    instruction = 16'h2951;
    #10
    display;
    $display("MULT $4 $1 $2");
    instruction = 16'h490A;
    #10
    display;
    $display("DIV $5 $5 $6");
    instruction = 16'h696E;
    #10
    display;
    $display("AND $5 $4 $1");
    instruction = 16'h8961;
    #10
    display;
    $display("OR $4 $6 $4");
    instruction = 16'hA934;
    #10
    display;
    $display("XOR $6 $2 $1");
    instruction = 16'hC991;
    #10
    display;
    $display("ADDI $5 $5 2");
    instruction = 16'h1955;
    #10
    display;
    $display("SUBI $1 $4 2");
    instruction = 16'h3854;
    #10
    display;
    $display("MULTI $6 $5 2");
    instruction = 16'h5995;
    #10
    display;
    $display("DIVI $6 $3 4");
    instruction = 16'h79A3;
    #10
    display;
    $display("ANDI $5 $6 2");
    instruction = 16'h9956;
    #10
    display;
    $display("ORI $6 $5 1");
    instruction = 16'hB98D;
    #10
    display;
    $display("XORI $4 $1 1");
    instruction = 16'hD909;
    #10
    display;
    $display("SAVE $2 50");
    instruction = 16'hE4B2;
    #10
    display;
    $display("LOAD $4 14");
    instruction = 16'hEB0E;
    #10
    display;
  end
  
  task display;
    $display("ALU_op: %3b", ALU_op);
    $display("ALU_src_cntrl: %1b", ALU_src_cntrl);
    $display("Reg_write: %1b", Reg_write);
    $display("Mem_write: %1b", Mem_write);
    $display("Reg_src_cntrl: %1b", Reg_src_cntrl);
    $display("Rs: %3b", Rs);
    $display("Rt: %3b", Rt);
    $display("Rd: %3b", Rd);
    $display("Imm: %3b", Imm);
    $display("Addr: %6b", Addr);
    $display(" ");
  endtask

endmodule