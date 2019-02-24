`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:27 02/18/2019
// Design Name:   CU
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/CONTROL_UNIT_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CONTROL_UNIT_TF;

	// Inputs
	reg [10:0] Opcode;

	// Outputs
	wire Reg2Loc;
	wire ALUSrc;
	wire [2:0] ALUOp;
	wire Branch;
	wire MemRead;
	wire MemWrite;
	wire MemtoReg;
	wire RegWrite;
	wire [1:0] SignExt;

	// Instantiate the Unit Under Test (UUT)
	CU uut (
		.Opcode(Opcode), 
		.Reg2Loc(Reg2Loc), 
		.ALUSrc(ALUSrc), 
		.ALUOp(ALUOp), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.SignExt(SignExt)
	);

	initial begin
		// Initialize Inputs
		Opcode <= 'b10001011000;
		#100;
		Opcode <= 'b11001011000;
		#100;
		Opcode <= 'b10001010000;
		#100;
		Opcode <= 'b10101010000;
		#100;
		Opcode <= 'b11111000000;
		#100;
		Opcode <= 'b11111000010;
		#100;
		Opcode <= 'b11111000010;
		#100;

        
		// Add stimulus here

	end
      
endmodule

