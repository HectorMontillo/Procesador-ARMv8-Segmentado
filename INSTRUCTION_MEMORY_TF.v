`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:56:07 02/18/2019
// Design Name:   IM
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/INSTRUCTION_MEMORY_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module INSTRUCTION_MEMORY_TF;

	// Inputs
	reg [63:0] Address;

	// Outputs
	wire [31:0] Instruction;

	// Instantiate the Unit Under Test (UUT)
	IM uut (
		.Address(Address), 
		.Instruction(Instruction)
	);

	initial begin
		// Initialize Inputs
		Address = 0;
		#20;
      Address = 1;
		#20;
		Address = 2;
		#20;
		Address = 3;
		#20;
		Address = 4;
		#20;
		// Add stimulus here

	end
      
endmodule

