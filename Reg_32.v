module Reg_32(
    input [31:0] D,
    output reg [31:0] Q,
    input clk,
    input Reset
    );
	always @(posedge clk)
		if (Reset)
			Q <= 31'b0;
		else
			Q <= D;
endmodule
