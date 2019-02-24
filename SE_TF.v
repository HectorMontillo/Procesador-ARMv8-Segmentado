`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:12:22 02/18/2019
// Design Name:   SE
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/SE_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SE_TF;

	// Inputs
	reg [31:0] A;
	reg [1:0] SignExt;

	// Outputs
	wire [63:0] S;

	// Instantiate the Unit Under Test (UUT)
	SE uut (
		.A(A), 
		.SignExt(SignExt), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		A <= 'b11111000010000000000001010110110;
		SignExt = 0;
		#100;
		A <= 'b11111000010000001000001010110110;
		SignExt = 1;
		#100;
		A <= 'b11111000010000000000001010110110;
		SignExt = 2;
		#100;
		A <= 'b11111000010000000000001010110110;
		SignExt = 3;
		#100;
       
		// Add stimulus here

	end
      
endmodule

