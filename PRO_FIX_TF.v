`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:24 02/19/2019
// Design Name:   PROCESSOR_FIX
// Module Name:   C:/Users/utp/Desktop/Promay/ProcesadorMaykol/PRO_FIX_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR_FIX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PRO_FIX_TF;

	// Inputs
	reg clk;
	reg Reset;
	reg [31:0] Instruction_De_wire;
	reg [63:0] PC_De_wire;
	reg [63:0] AdderOut_De_wire;

	// Outputs
	wire ALUSrc_Ex_wire;
	wire [2:0] ALUOp_Ex_wire;
	wire MemRead_Ex_wire;
	wire MemWrite_Ex_wire;
	wire MemtoReg_Ex_wire;
	wire RegWrite_Ex_wire;
	wire [4:0] Rd_Ex_wire;
	wire [4:0] Rn_Ex_wire;
	wire [4:0] Rm_Ex_wire;
	wire [63:0] SignExt_Ex_wire;
	wire [63:0] ReadData1_Ex_wire;
	wire [63:0] ReadData2_Ex_wire;
	wire Salida;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR_FIX uut (
		.clk(clk), 
		.Reset(Reset), 
		.Instruction_De_wire(Instruction_De_wire), 
		.PC_De_wire(PC_De_wire), 
		
		.AdderOut_De_wire(AdderOut_De_wire), 
		.ALUSrc_Ex_wire(ALUSrc_Ex_wire), 
		.ALUOp_Ex_wire(ALUOp_Ex_wire), 
		.MemRead_Ex_wire(MemRead_Ex_wire), 
		.MemWrite_Ex_wire(MemWrite_Ex_wire), 
		.MemtoReg_Ex_wire(MemtoReg_Ex_wire), 
		.RegWrite_Ex_wire(RegWrite_Ex_wire), 
		
		.Rd_Ex_wire(Rd_Ex_wire), 
		.Rn_Ex_wire(Rn_Ex_wire), 
		.Rm_Ex_wire(Rm_Ex_wire), 
		.SignExt_Ex_wire(SignExt_Ex_wire), 
		.ReadData1_Ex_wire(ReadData1_Ex_wire), 
		.ReadData2_Ex_wire(ReadData2_Ex_wire),
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 0;
		Instruction_De_wire = 'b10001011000111110000001111010100;
		PC_De_wire = 0;
		AdderOut_De_wire = 0;

		// Wait 100 ns for global reset to finish
		#200;
		
		PC_De_wire = 3;
		AdderOut_De_wire = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
		// Add stimulus here

	end
      always
		#200 clk = !clk;
endmodule

