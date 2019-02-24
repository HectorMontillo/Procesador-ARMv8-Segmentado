`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:04:05 02/18/2019
// Design Name:   MUX2_1S
// Module Name:   C:/Users/hecto/Desktop/Promay/ProcesadorMaykol/MUX2_1S_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX2_1S
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX2_1S_TF;

	// Inputs
	reg Branch;
	reg RegWrite;
	reg MemRead;
	reg MemWrite;
	reg Stall;

	// Outputs
	wire OutBranch;
	wire OutRegWrite;
	wire OutMemWrite;
	wire OutMemRead;

	// Instantiate the Unit Under Test (UUT)
	MUX2_1S uut (
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Stall(Stall), 
		.OutBranch(OutBranch), 
		.OutRegWrite(OutRegWrite), 
		.OutMemWrite(OutMemWrite), 
		.OutMemRead(OutMemRead)
	);

	initial begin
		// Initialize Inputs
		Branch = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 0;
		Stall = 0;
		#100;
        
		Branch = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 0;
		Stall = 1;
		#100;
		
		Branch = 0;
		RegWrite = 0;
		MemRead = 0;
		MemWrite = 0;
		Stall = 0;
		#100;
		// Add stimulus here

	end
      
endmodule

