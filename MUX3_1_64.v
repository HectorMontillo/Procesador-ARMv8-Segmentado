  `timescale 1ns / 1ps

module MUX3_1_64(
    input [63:0] A,
    input [63:0] B,
    input [63:0] C,
    input [1:0] S,
    output reg [63:0] Out
    );
	always @(A, B, S)
		case (S)
			'b00: Out <= A;
			'b01: Out <= B;
			'b10: Out <= C;
		endcase
endmodule
