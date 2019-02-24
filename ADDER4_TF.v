`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:15 02/18/2019
// Design Name:   ADDER4
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/ADDER4_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADDER4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADDER4_TF;

	// Inputs
	reg [63:0] B;

	// Outputs
	wire [63:0] Out;

	// Instantiate the Unit Under Test (UUT)
	ADDER4 uut (
		.B(B), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		B = 0;
		#100;
		B = 32;
		#100;
		B = 64;
		#100;
		B = 96;
		#100;
		B = 128;
		#100;
        
		// Add stimulus here

	end
      
endmodule

