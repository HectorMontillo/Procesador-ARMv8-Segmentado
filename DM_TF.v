`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:09:21 02/19/2019
// Design Name:   DM
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/DM_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DM_TF;

	// Inputs
	reg [63:0] Address;
	reg [63:0] DataWrite;
	reg MemRead;
	reg MemWrite;

	// Outputs
	wire [63:0] DataRead;

	// Instantiate the Unit Under Test (UUT)
	DM uut (
		.Address(Address), 
		.DataWrite(DataWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.DataRead(DataRead)
	);

	initial begin
		// Initialize Inputs
		Address = 0;
		DataWrite = 1;
		MemRead = 0;
		MemWrite = 1;
		#100;
		Address = 1;
		DataWrite = 2;
		MemRead = 0;
		MemWrite = 1;
		#100;
		Address = 0;
		DataWrite = 0;
		MemRead = 1;
		MemWrite = 0;
		#100;
		Address = 1;
		DataWrite = 0;
		MemRead = 1;
		MemWrite = 0;
		#100;
		
        
		// Add stimulus here

	end
      
endmodule

