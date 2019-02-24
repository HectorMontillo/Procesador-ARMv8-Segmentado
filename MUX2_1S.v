`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:53 01/25/2019 
// Design Name: 
// Module Name:    MULTIPLEXOR(2 TO 1), 5 Bits 
// Project Name:   Design ARM Architecture 
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
module MUX2_1S(
		input Branch,
		input RegWrite,
		input MemRead,
		input MemWrite,
    input Stall,
    output reg OutBranch,
    output reg OutRegWrite,
    output reg OutMemWrite,
    output reg OutMemRead
    );
	always @(Stall,Branch,RegWrite,MemRead,MemWrite)
		case (Stall)
		
			'b1:
			begin 
					OutBranch <= 0;
                 OutRegWrite <= 0;
                 OutMemWrite <= 0;
                 OutMemRead <= 0;
			end
			default: 
			begin
						OutBranch <= Branch;
                 OutRegWrite <= RegWrite;
                 OutMemWrite <= MemWrite;
                 OutMemRead <= MemRead;
			end
		endcase
endmodule
