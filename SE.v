`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:07:20 01/26/2019 
// Design Name: 
// Module Name:    SIGN EXTEND 
// Project Name: 	 Design ARM Architecture 	
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
module SE(
    input [31:0] A,
	 input [1:0] SignExt,
    output reg[63:0] S
    );
	wire [11:0] ALU_immediate = A[21:10];
	wire [8:0] DT_address = A[21:12];
	wire [5:0] SHAMT = A[15:10];
	wire [18:0] COND_BR_address = A[23:5];	
	always @(SignExt, ALU_immediate, DT_address, SHAMT, COND_BR_address)
		case(SignExt)
			'b00: S <= {{52{ALU_immediate[11]}},ALU_immediate};
			'b01: S <= {{55{DT_address[8]}},DT_address};
			'b10: S <= {{58{SHAMT[5]}},SHAMT};
			'b11: S <= {{45{COND_BR_address[18]}},COND_BR_address};
			default: S<=64'b11;
		endcase
endmodule
