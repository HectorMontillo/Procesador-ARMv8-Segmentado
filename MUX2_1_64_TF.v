`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:15:25 02/18/2019
// Design Name:   MUX2_1_64
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/MUX2_1_64_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX2_1_64
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX2_1_64_TF;

	// Inputs
	reg [63:0] A;
	reg [63:0] B;
	reg S;

	// Outputs
	wire [63:0] Out;

	// Instantiate the Unit Under Test (UUT)
	MUX2_1_64 uut (
		.A(A), 
		.B(B), 
		.S(S), 
		.Out(Out)
	);

	initial begin
		// Initialize Inputs
		A = 5;
		B = 2;
		S = 0;
		#20;
		A = 10;
		B = 6;
		S = 0;
		#20;
		A = 2;
		B = 4;
		S = 1;
		#20;
		A = 5;
		B = 6;
		S = 1;
		#20;
        
		// Add stimulus here

	end
      
endmodule

