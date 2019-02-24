`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:11 01/28/2019 
// Design Name: 
// Module Name:    ADDER 4
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
module ADDER4(
    input [63:0] B,
    output reg[63:0] Out
    );
	always @(B)	
		Out <= 64'b1 + B;
endmodule
