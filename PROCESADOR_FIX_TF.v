`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:02:49 02/19/2019
// Design Name:   PROCESSOR_FIX
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/PROCESADOR_FIX_TF.v
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

module PROCESADOR_FIX_TF;

	// Inputs
	reg clk;
	reg Reset;

	// Outputs
	wire [63:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR_FIX uut (
		.clk(clk), 
		.Reset(Reset), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 0;
        
		// Add stimulus here

	end
	always 
		#100 clk =!clk;
      
endmodule

