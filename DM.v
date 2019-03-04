`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:44:18 01/26/2019 
// Design Name: 
// Module Name:    DM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DM(
    input [63:0] Address,
    input [63:0] DataWrite,
    input MemRead,
    input MemWrite,
    output reg [63:0] DataRead
    );
	reg [7:0] data_mem [1023:0];
	initial 
		$readmemb("memory/data.mem", data_mem);
	always @(Address, DataWrite, MemRead, MemWrite)
		begin
			if (MemRead=='b1)			
				DataRead <= data_mem[(Address )];
			if (MemWrite=='b1)
					data_mem[(Address )]	<= DataWrite;		
		end
endmodule
