`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:16:55 03/01/2019
// Design Name:   CU
// Module Name:   C:/Users/maicol/Documents/Arquitectura/Nueva carpeta/paila/CU_TV.v
// Project Name:  paila
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

module CU_TV;

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
		Opcode = 'b10001011000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

