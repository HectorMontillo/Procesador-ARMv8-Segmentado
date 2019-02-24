`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:21:18 02/18/2019
// Design Name:   Reg_64S
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/PROGRAM_COUNTER_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Reg_64S
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROGRAM_COUNTER_TF;

	// Inputs
	reg [63:0] D;
	reg Stall;
	reg clk;
	reg Reset;

	// Outputs
	wire [63:0] Q;

	// Instantiate the Unit Under Test (UUT)
	Reg_64S uut (
		.D(D), 
		.Stall(Stall), 
		.Q(Q), 
		.clk(clk), 
		.Reset(Reset)
	);

	initial begin
		// Initialize Inputs
		D = 5;
		Stall = 0;
		clk = 0;
		Reset = 0;
		#100;
		D = 10;
		#100;
		D = 20;
		#100;
		D = 1;
		Stall = 1;
		#100;
		D = 2;
		Stall = 0;
		Reset = 1;
		#100; 



        
		// Add stimulus here

	end
	
	always
			#5 clk = !clk;
				
      
endmodule

