`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:27:49 02/18/2019
// Design Name:   ADDER
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/ADDER_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ADDER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ADDER_TF;

	// Inputs
	reg [63:0] A;
	reg [63:0] B;

	// Outputs
	wire [63:0] Out;

	// Instantiate the Unit Under Test (UUT)
	ADDER uut (
		.A(A), 
		.B(B), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		#100;
      
		A = 1;
		B = 2;
		#100;
		
		A = 3;
		B = 4;
		#100;
		
		A = 5;
		B = 6;
		#100;
		// Add stimulus here

	end
      
endmodule

