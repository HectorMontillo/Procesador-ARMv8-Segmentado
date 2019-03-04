`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:37 01/27/2019 
// Design Name: 
// Module Name:    CONTROL UNIT
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
module CU(
    input [10:0] Opcode,
    output reg Reg2Loc,
    output reg ALUSrc,
    output reg [2:0] ALUOp,
    output reg Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
	 output reg RegWrite,
    output reg [1:0] SignExt
    );
	always @(Opcode)
			casex (Opcode)
				'b10001011000: begin //ADD
										Reg2Loc <= 'b0;
										ALUSrc <= 'b0;
										ALUOp <= 'b000;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b00;
									end
				'b11001011000: begin //SUB
										Reg2Loc <= 'b0;
										ALUSrc <= 'b0;
										ALUOp <= 'b001;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b00;
									end
				'b10001010000: begin //AND
										Reg2Loc <= 'b0;
										ALUSrc <= 'b0;
										ALUOp <= 'b010;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b00;
									end
				'b10101010000: begin //OR
										Reg2Loc <= 'b0;
										ALUSrc <= 'b0;
										ALUOp <= 'b011;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b00;
									end
				'b11111000000: begin //STUR 
										Reg2Loc <= 'b1;
										ALUSrc <= 'b1;
										ALUOp <= 'b000;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b1;
										MemtoReg <= 'b0;
										RegWrite <= 'b0;
										SignExt <= 'b01;
									end
				'b11111000010: begin //LDUR
										Reg2Loc <= 'b0;
										ALUSrc <= 'b1;
										ALUOp <= 'b000;
										Branch <= 'b0;
										MemRead <= 'b1;
										MemWrite <= 'b0;
										MemtoReg <= 'b1;
										RegWrite <= 'b1;
										SignExt <= 'b01;
									end
				
				'b1001000100x: begin //ADDI
										Reg2Loc <= 'b1;
										ALUSrc <= 'b1;
										ALUOp <= 'b000;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b00;
									end
				'b1101000100x: begin //SUBI
										Reg2Loc <= 'b1;
										ALUSrc <= 'b1;
										ALUOp <= 'b001;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b00;
								  end
				'b11010011010: begin //LSR
										Reg2Loc <= 'b0;
										ALUSrc <= 'b1;
										ALUOp <= 'b100;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b10;
									end	
				'b11010011011: begin //LSL
										Reg2Loc <= 'b0;
										ALUSrc <= 'b1;
										ALUOp <= 'b101;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b1;
										SignExt <= 'b10;
									end	
				'b10110100xxx: begin //CBZ
										Reg2Loc <= 'b1;
										ALUSrc <= 'b0;
										ALUOp <= 'b101;
										Branch <= 'b1;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b0;
										SignExt <= 'b11;
									end	
				'b00000000000: begin //NADA
										Reg2Loc <= 'b0;
										ALUSrc <= 'b0;
										ALUOp <= 'b101;
										Branch <= 'b0;
										MemRead <= 'b0;
										MemWrite <= 'b0;
										MemtoReg <= 'b0;
										RegWrite <= 'b0;
										SignExt <= 'b10;
									end	
			endcase				
endmodule
