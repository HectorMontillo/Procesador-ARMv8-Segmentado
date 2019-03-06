`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:10:21 03/04/2019
// Design Name:   Transmitter
// Module Name:   F:/Universidad/UART/Transmitter_TF.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Transmitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Transmitter_TF;

	// Inputs
	reg Clk;
	reg [7:0] TxData;
	reg TxEn;

	// Outputs
	wire Tx;
	wire TxDone;
	wire [7:0] TxData_s;

	// Instantiate the Unit Under Test (UUT)
	Transmitter uut (
		.Clk(Clk), 
		.TxData(TxData), 
		.Tx(Tx),
		.TxDone(TxDone),
		.TxEn(TxEn),
		.TxData_s(TxData_s)

	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		TxData = 0;
		TxEn = 0;
		
		#10000;
		TxEn = 1;
		TxData = 21;
		
		#20;
		TxEn = 1;
		TxData = 5;
		
		#20;
		TxEn = 0;
		TxData = 6;
		
		#100;
		TxEn = 1;
		TxData = 8;
		
		#500;
		TxEn = 1;
		TxData = 6;

		#1000;
		TxEn = 1;
		TxData = 9;
		
		#5000;
		TxEn = 1;
		TxData = 10;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
	always
		#200 Clk = !Clk;
      
endmodule

