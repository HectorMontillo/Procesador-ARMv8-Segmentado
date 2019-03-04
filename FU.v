`timescale 1ns / 1ps

module Forwarding_Unit (
  input [4:0] Rn,
  input [4:0] Rm,
  input [4:0] Rd_Mem,
  input [4:0] Rd_WB,
  input RegWrite_Mem,
  input RegWrite_WB,
  output reg [1:0] ForwardA,
  output reg [1:0] ForwardB
);
  always@(Rn, Rm, Rd_Mem, Rd_WB, RegWrite_WB, RegWrite_Mem)
  begin
    if (Rn == Rd_Mem & (RegWrite_Mem=='b1))
      ForwardA <= 'b01;
    else
      if (Rn == Rd_WB & (RegWrite_WB=='b1))
			ForwardA <= 'b10;
      else
			ForwardA <= 'b00;
    if (Rm == Rd_Mem & (RegWrite_Mem=='b1))
        ForwardB <= 'b01;
      else
        if (Rm == Rd_WB & (RegWrite_WB=='b1))
			ForwardB <= 'b10;
        else
			ForwardB <= 'b00;
  end
endmodule
