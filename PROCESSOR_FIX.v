`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:44 02/18/2019 
// Design Name: 
// Module Name:    PROCESSOR_FIX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PROCESSOR_FIX(
	input clk,
	input Reset,
	
	input [31:0] Instruction_De_wire,
	input [63:0] PC_De_wire,

	input [63:0]AdderOut_De_wire,
	
	output ALUSrc_Ex_wire,
	output [2:0]ALUOp_Ex_wire,
	output MemRead_Ex_wire,
	output MemWrite_Ex_wire, 
	output MemtoReg_Ex_wire,
	output RegWrite_Ex_wire,
	
	output [4:0]Rd_Ex_wire,
	output [4:0]Rn_Ex_wire,
	output [4:0]Rm_Ex_wire,
	output [63:0]SignExt_Ex_wire,
	output [63:0]ReadData1_Ex_wire,
	output [63:0]ReadData2_Ex_wire,
	output [63:0] Salida
);
//DECODE
wire [63:0]X20_De_wire;
wire Reg2Loc_De_wire;
wire ALUSrc_De_wire;
wire [2:0]ALUOp_De_wire; 
wire Branch_De_wire;
wire OutBranch_De_wire;
wire MemRead_De_wire; 
wire OutMemRead_De_wire; 
wire MemWrite_De_wire; 
wire OutMemWrite_De_wire;
wire MemtoReg_De_wire;
wire RegWrite_De_wire;
wire OutRegWrite_De_wire;
wire SignExtOut_De_wire;
wire [63:0]SignExt_De_wire;
wire [63:0]LL2Out_De_wire;
wire [4:0]MUXOut_De_wire;
wire [63:0]ReadData1_De_wire;
wire [63:0]ReadData2_De_wire;
wire Zero_De_wire;
wire Stall_De_wire;

//EXECUTE
wire [63:0]X20_Ex_wire;
wire MuxFAOut_Ex_wire;
wire MuxFBOut_Ex_wire;
wire ForwardA_Ex_wire;
wire ForwardB_Ex_wire;
wire MUXOut1_Ex_wire;
wire ALUResult_Ex_wire;
wire Zero_Ex_wire;



//MEMORY 
wire DataRead_Mem_wire;

wire Rd_Mem_wire;
wire DataWrite_Mem_wire;
wire ALUResult_Mem_wire;

wire MemRead_Mem_wire; 
wire MemWrite_Mem_wire; 
wire MemtoReg_Mem_wire;
wire RegWrite_Mem_wire;

//WRITE-BACK 
wire RegWriteData_WB_wire;

wire DataRead_WB_wire;
wire ALUResult_WB_wire;
wire MemtoReg_WB_wire;
wire RegWrite_WB_wire;

//=========DECODE============================

Hazzard HAZZARD_UNIT(
    .Rn(Instruction_De_wire[9:5]),
    .Rm(Instruction_De_wire[20:16]),
    .Rd(Rd_Ex_wire),
    .MemRead(MemRead_Ex_wire),
    .Stall(Stall_De_wire)
);


MUX2_1S MUX5(
    .Branch(Branch_De_wire),
    .RegWrite(RegWrite_De_wire),
    .MemRead(MemRead_De_wire),
    .MemWrite(MemWrite_De_wire),
    .Stall(Stall_De_wire),
    .OutBranch(OutBranch_De_wire),
    .OutRegWrite(OutRegWrite_De_wire),
    .OutMemRead(OutMemRead_De_wire),
    .OutMemWrite(OutMemWrite_De_wire)
);

CU CONTROL_UNIT (
    .Opcode(Instruction_De_wire[31:21]), 
    .Reg2Loc(Reg2Loc_De_wire), 
    .ALUSrc(ALUSrc_De_wire), 
    .ALUOp(ALUOp_De_wire), 
    .Branch(Branch_De_wire), 
    .MemRead(MemRead_De_wire), 
    .MemWrite(MemWrite_De_wire), 
    .MemtoReg(MemtoReg_De_wire), 
    .RegWrite(RegWrite_De_wire), 
    .SignExt(SignExtOut_De_wire)
    );

SE SIGN_EXTEND (
    .A(Instruction_De_wire[31:0]), 
    .SignExt(SignExtOut_De_wire), 
    .S(SignExt_De_wire)
    ); 

LL2 SHIFT_LEFT_2 (
    .A(SignExt_De_wire), 
    .S(LL2Out_De_wire)
    );
	 
ADDER ADDER2 (
    .A(PC_De_wire), 
    .B(SignExt_De_wire), 
    .Out(AdderOut_De_wire)
    );

MUX2_1_5 MUX2(
    .A(Instruction_De_wire[20:16]), 
    .B(Instruction_De_wire[4:0]), 
    .S(Reg2Loc_De_wire), 
    .Out(MUXOut_De_wire)
    );

RF REGISTER_FILE (
    .ReadReg1(Instruction_De_wire[9:5]), 
    .ReadReg2(MUXOut_De_wire), 
    .WriteReg(Rd_WB_wire), 
    .WriteData(RegWriteData_WB_wire), 
    .RegWrite(RegWrite_WB_wire),
	 .Reset(Reset),	 
    .clk(clk), 
    .ReadData1(ReadData1_De_wire), 
    .ReadData2(ReadData2_De_wire),
	 .X20(X20_De_wire)
    );
	
Comp0 COMPARE (
    .B(ReadData2_De_wire),
    .Zero(Zero_De_wire)
    );

AND AND_GATE(
    .A(Zero_De_wire),
    .B(OutBranch_De_wire),
    .S(Branch_De_Result_wire)
    );

Reg_64 X20_EX(
    .D(X20_De_wire),
    .Q(Salida),
	.clk(clk),
	.Reset(Reset)
    );

Reg_5 Rd_ex(
    .D(Instruction_De_wire[4:0]),
    .Q(Rd_Ex_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_5 Rn_ex(
    .D(Instruction_De_wire[9:5]),
    .Q(Rn_Ex_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_5 Rm_ex(
    .D(Instruction_De_wire[20:16]),
    .Q(Rm_Ex_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_64 SignExt_Ex(
    .D(SignExt_De_wire),
    .Q(SignExt_Ex_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_64 ReadData1_Ex(
    .D(ReadData1_De_wire),
    .Q(ReadData1_Ex_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_64 ReadData2_Ex(
    .D(ReadData2_De_wire),
    .Q(ReadData2_Ex_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg ALUSrc_Ex(
    .D(ALUSrc_De_wire),
    .Q(ALUSrc_Ex_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg_3 ALUOp_Ex(
    .D(ALUOp_De_wire),
    .Q(ALUOp_Ex_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg MemRead_Ex(
    .D(OutMemRead_De_wire),
    .Q(MemRead_Ex_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg MemWrite_Ex(
    .D(OutMemWrite_De_wire),
    .Q(MemWrite_Ex_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg MemtoReg_Ex(
    .D(MemtoReg_De_wire),
    .Q(MemtoReg_Ex_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg RegWrite_Ex(
    .D(OutRegWrite_De_wire),
    .Q(RegWrite_Ex_wire),
    .clk(clk),
	.Reset(Reset)
    );


endmodule 
