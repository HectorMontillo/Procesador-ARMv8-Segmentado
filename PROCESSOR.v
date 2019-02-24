`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:58 01/27/2019 
// Design Name: 
// Module Name:    PROCESSOR 
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
module PROCESSOR(
    input clk,
	 input Reset,
	 output reg[63:0] Salida
    );

//FETCH
wire [63:0] AdderOut_Fe_wire;
wire [63:0]AdderOut_De_wire;
wire [63:0] MUXOut_Fe_wire;
wire [63:0] PC_Fe_wire;
wire [31:0] Instruction_Fe_wire;

wire Branch_De_Result_wire;

//DECODE
wire X20_De_wire;
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

wire [31:0] Instruction_De_wire;
wire [63:0] PC_De_wire;

//EXECUTE
wire X20_Ex_wire;
wire MuxFAOut_Ex_wire;
wire MuxFBOut_Ex_wire;
wire ForwardA_Ex_wire;
wire ForwardB_Ex_wire;
wire MUXOut1_Ex_wire;
wire ALUResult_Ex_wire;
wire Zero_Ex_wire;

wire [4:0]Rd_Ex_wire;
wire [4:0]Rn_Ex_wire;
wire [4:0]Rm_Ex_wire;
wire [63:0]SignExt_Ex_wire;
wire [63:0]ReadData1_Ex_wire;
wire [63:0]ReadData2_Ex_wire;

wire ALUSrc_Ex_wire;
wire [2:0]ALUOp_Ex_wire; 
wire MemRead_Ex_wire; 
wire MemWrite_Ex_wire; 
wire MemtoReg_Ex_wire;
wire RegWrite_Ex_wire;

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


//=========FETCH============================
MUX2_1_64 MUX1 (
    .A(AdderOut_Fe_wire), 
    .B(AdderOut_De_wire),
    .S(Branch_De_Result_wire), 
    .Out(MUXOut_Fe_wire)
    );

Reg_64S PROGRAM_COUNTER(
    .D(MUXOut_Fe_wire), 
    .Stall(Stall_De_wire),
    .Q(PC_Fe_wire), 
    .clk(clk), 
    .Reset(Reset)
    );

IM INSTRUCTION_MEMORY (
    .Address(PC_Fe_wire), 
    .Instruction(Instruction_Fe_wire)
    );
	 
ADDER4 ADDER1 ( 
    .B(PC_Fe_wire), 
    .Out(AdderOut_Fe_wire)
    );

Reg_64S PC_De(
		.D(PC_Fe_wire),
        .Stall(Stall_De_wire),
		.Q(PC_De_wire),
		.clk(clk),
		.Reset(Branch_De_Result_wire)
		);
		
Reg_32S Inst_De(
	.D(Instruction_Fe_wire),
    .Stall(Stall_De_wire),
	.Q(Instruction_De_wire),
	.clk(clk),
	.Reset(Branch_De_Result_wire)
	);

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

Reg ALUOp_Ex(
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

//=========EXECUTE============================

Forwarding_Unit FU(
    .Rn(Rn_Ex_wire),
    .Rm(Rm_Ex_wire),
    .Rd_Mem(Rd_Mem_wire),
    .Rd_WB(Rd_WB_wire),
    .RegWrite_Mem(RegWrite_Mem_wire),
    .RegWrite_WB(RegWrite_WB_wire),
    .ForwardA(ForwardA_Ex_wire),
    .ForwardB(ForwardB_Ex_wire)
);

MUX3_1_64 MUX6(
	.A(ReadData1_Ex_wire),
	.B(ALUResult_Mem_wire),
	.C(RegWriteData_WB_wire),
	.S(ForwardA_Ex_wire),
	.Out(MuxFAOut_Ex_wire)
);

MUX3_1_64 MUX7(
	.A(ReadData2_Ex_wire),
	.B(ALUResult_Mem_wire),
	.C(RegWriteData_WB_wire),
	.S(ForwardB_Ex_wire),
	.Out(MuxFBOut_Ex_wire)
);

MUX2_1_64 MUX3 (
    .A(MuxFBOut_Ex_wire), 
    .B(SignExt_Ex_wire), 
    .S(ALUSrc_Ex_wire), 
    .Out(MUXOut1_Ex_wire)
    );

ALU ARITHMETIC_LOGIC_UNIT (
    .A(ReadData1_Ex_wire), 
    .B(MUXOut1_Ex_wire), 
    .ALUOp(ALUOp_Ex_wire), 
    .ALUResult(ALUResult_Ex_wire), 
    .Zero(Zero_Ex_wire)
    );

Reg_64 ALUResult_Mem(
    .D(ALUResult_Ex_wire),
    .Q(ALUResult_Mem_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_64 DataWrite_Mem(
    .D(MuxFBOut_Ex_wire),
    .Q(DataWrite_Mem_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_5 Rd_Mem(
    .D(Rd_Ex_wire),
    .Q(Rd_Mem_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg MemRead_Mem(
    .D(MemRead_Ex_wire),
    .Q(MemRead_Mem_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg MemWrite_Mem(
    .D(MemWrite_Ex_wire),
    .Q(MemWrite_Mem_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg MemtoReg_Mem(
    .D(MemtoReg_Ex_wire),
    .Q(MemtoReg_Mem_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg RegWrite_Mem(
    .D(RegWrite_Ex_wire),
    .Q(RegWrite_Mem_wire),
    .clk(clk),
	.Reset(Reset)
    );

//=========MEMORY============================

DM DATA_MEMORY (
    .Address(ALUResult_Mem_wire), 
    .DataWrite(DataWrite_Mem_wire), 
    .MemRead(MemRead_Mem_wire), 
    .MemWrite(MemWrite_Mem_wire), 
    .DataRead(DataRead_Mem_wire)
    );

Reg_64 DataRead_WB(
    .D(DataRead_Mem_wire),
    .Q(DataRead_WB_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_64 ALUResult_WB(
    .D(ALUResult_Mem_wire),
    .Q(ALUResult_WB_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg_5 Rd_WB(
    .D(Rd_Mem_wire),
    .Q(Rd_WB_wire),
	.clk(clk),
	.Reset(Reset)
    );

Reg MemtoReg_WB(
    .D(MemtoReg_Mem_wire),
    .Q(MemtoReg_WB_wire),
    .clk(clk),
	.Reset(Reset)
    );

Reg RegWrite_WB(
    .D(RegWrite_Mem_wire),
    .Q(RegWrite_WB_wire),
    .clk(clk),
	.Reset(Reset)
    );

//=========WRITE BACK============================

MUX2_1_64 MUX4 (
    .A(ALUResult_WB_wire), 
    .B(DataRead_WB_wire), 
    .S(MemtoReg_WB_wire), 
    .Out(RegWriteData_WB_wire)
    );
	 
endmodule
