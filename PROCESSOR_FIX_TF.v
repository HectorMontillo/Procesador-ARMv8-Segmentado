`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:44:10 02/18/2019
// Design Name:   PROCESSOR_FIX
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/PROCESSOR_FIX_TF.v
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

module PROCESSOR_FIX_TF;

	// Inputs
	reg clk;
	reg Reset;

	// Outputs
	wire [31:0] Inst;
	wire [63:0] Address;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR_FIX uut (
		.clk(clk), 
		.Reset(Reset), 
		.Inst(Inst), 
		.Address(Address)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 0;

	end
		
	always
			#20 clk = !clk;
				
				
      
endmodule

