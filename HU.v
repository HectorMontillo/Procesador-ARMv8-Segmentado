`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:16:04 02/18/2019 
// Design Name: 
// Module Name:    HU 
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

module Hazzard (
  input [4:0] Rn,
  input [4:0] Rm,
  input [4:0] Rd,
  input MemRead,
  output reg Stall
  );
  always @(Rn, Rm, Rd, MemRead)
  begin
    if (((Rn == Rd) | (Rm == Rd)) & (MemRead))
        Stall <= 'b1;
    else
        Stall <= 'b0;
	end
endmodule
