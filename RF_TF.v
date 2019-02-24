`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:45:42 02/19/2019
// Design Name:   RF
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/RF_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RF_TF;

	// Inputs
	reg [4:0] ReadReg1;
	reg [4:0] ReadReg2;
	reg [4:0] WriteReg;
	reg [63:0] WriteData;
	reg RegWrite;
	reg Reset;
	reg clk;

	// Outputs
	wire [63:0] ReadData1;
	wire [63:0] ReadData2;
	wire [63:0] X20;

	// Instantiate the Unit Under Test (UUT)
	RF uut (
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.WriteReg(WriteReg), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Reset(Reset), 
		.clk(clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2), 
		.X20(X20)
	);

	initial begin
		// Initialize Inputs
		ReadReg1 = 0;
		ReadReg2 = 0;
		WriteReg = 0;
		WriteData = 0;
		RegWrite = 0;
		Reset = 0;
		clk = 0;
		#100;
		
		ReadReg1 = 1;
		ReadReg2 = 2;
		WriteReg = 0;
		WriteData = 0;
		RegWrite = 0;
      #100;
		
		ReadReg1 = 0;
		ReadReg2 = 0;
		WriteReg = 3;
		WriteData = 4;
		RegWrite = 1;
		#100;
		
		ReadReg1 = 3;
		ReadReg2 = 2;
		WriteReg = 0;
		WriteData = 0;
		RegWrite = 0;
		#100;
		// Add stimulus here

	end
	always 
		#20 clk = !clk;
      
endmodule

