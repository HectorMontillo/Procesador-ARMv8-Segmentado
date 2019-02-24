`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:24:34 02/18/2019
// Design Name:   LL2
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/LL2_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LL2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LL2_TF;

	// Inputs
	reg [63:0] A;

	// Outputs
	wire [63:0] S;

	// Instantiate the Unit Under Test (UUT)
	LL2 uut (
		.A(A), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		A = 1;
		#100;
		
		A = 2;
		#100;
		
		A = 4;
		#100;
		
		A = 8;
		#100;
        
		// Add stimulus here

	end
      
endmodule

