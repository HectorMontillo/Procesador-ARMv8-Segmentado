`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:43 02/19/2019
// Design Name:   PROCESSOR
// Module Name:   C:/Users/utp/Desktop/Promay/ProcesadorMaykol/PROCESSOR_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_TF;

	// Inputs
	reg clk;
	reg Reset;

	// Outputs
	wire [63:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.clk(clk), 
		.Reset(Reset), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 1;

		// Wait 100 ns for global reset to finish
		#250;
		Reset = 0;
        
		// Add stimulus here

	end
	always
		#200 clk = !clk;
      
endmodule

