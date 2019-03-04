`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:33 01/25/2019 
// Design Name: 
// Module Name:    ARITHMETIC LOGIC UNIT 
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
module ALU(
    input [63:0] A,
    input [63:0] B,
    input [2:0] ALUOp,
    output reg [63:0] ALUResult
    );
	always @(ALUOp, A, B)
		case (ALUOp)
			'b000: ALUResult <= A+B;
			'b001: ALUResult <= A-B;
			'b010: ALUResult <= A&B;
			'b011: ALUResult <= A|B;
			'b101: ALUResult <= A << B;
			'b100: ALUResult <= A >> B;
		endcase
endmodule
