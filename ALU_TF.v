`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:16:08 03/01/2019
// Design Name:   ALU
// Module Name:   C:/Users/maicol/Documents/Arquitectura/Nueva carpeta/paila/ALU_TF.v
// Project Name:  paila
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TF;

	// Inputs
	reg [63:0] A;
	reg [63:0] B;
	reg [2:0] ALUOp;

	// Outputs
	wire [63:0] ALUResult;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALUOp(ALUOp), 
		.ALUResult(ALUResult)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		ALUOp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

