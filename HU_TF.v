`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:37 02/18/2019
// Design Name:   Hazzard
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/HU_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Hazzard
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HU_TF;

	// Inputs
	reg [4:0] Rn;
	reg [4:0] Rm;
	reg [4:0] Rd;
	reg MemRead;

	// Outputs
	wire Stall;

	// Instantiate the Unit Under Test (UUT)
	Hazzard uut (
		.Rn(Rn), 
		.Rm(Rm), 
		.Rd(Rd), 
		.MemRead(MemRead), 
		.Stall(Stall)
	);

	initial begin
		// Initialize Inputs
		Rn = 1;
		Rm = 1;
		Rd = 0;
		MemRead = 0;
		#100;
		
		Rn = 1;
		Rm = 2;
		Rd = 3;
		MemRead = 0;
		#100;
		
		Rn = 0;
		Rm = 0;
		Rd = 0;
		MemRead = 0;
		#100;
		
		
		Rn = 3;
		Rm = 2;
		Rd = 1;
		MemRead = 0;
		#100;
		
		Rn = 1;
		Rm = 1;
		Rd = 0;
		MemRead = 1;
		#100;
		
		Rn = 1;
		Rm = 2;
		Rd = 3;
		MemRead = 1;
		#100;
		
		Rn = 0;
		Rm = 0;
		Rd = 0;
		MemRead = 1;
		#100;
		
		
		Rn = 3;
		Rm = 2;
		Rd = 1;
		MemRead = 1;
		#100;
        
		// Add stimulus here

	end
      
endmodule

