`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:43 02/19/2019
// Design Name:   PROCESSOR
// Module Name:   C:/Users/utp/Desktop/Promay/ProcesadorMaykol/PROCESSOR_TF.v
// Project Name:  ProcesadorMaykol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_TF;

	// Inputs
	reg clk;
	reg Reset;

	// Outputs
	wire [63:0] Salida;
	wire [31:0] salida2;
	wire [63:0] Salida3;
	wire [1:0] Salida4;
	wire [1:0] Salida5;
	wire [4:0] Rm;
	wire [4:0] Rn;
	wire [4:0] Rdm;
	wire [4:0] Rdw;
	wire [63:0] muxA;
	wire [63:0] muxB;
	wire Tx;
	wire TxDone;
	wire [7:0] TxData; 
	wire memwrite_uart;
	wire [7:0] TxData_s;  

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.clk(clk), 
		.Reset(Reset), 
		.Salida(Salida),
		.salida2(salida2),
		.Salida3(Salida3),
		.Salida4(Salida4),
		.Salida5(Salida5),
		.Rn(Rn),
		.Rm(Rm),
		.Rdm(Rdm),
		.Rdw(Rdw),
		.muxA(muxA),
		.muxB(muxB),
		.Tx(Tx),
		.TxDone(TxDone),
		.TxData(TxData),
		.memwrite_uart(memwrite_uart),
		.TxData_s(TxData_s)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 1;

		// Wait 100 ns for global reset to finish
		#250;
		Reset = 0;
        
		// Add stimulus here

	end
	always
		#200 clk = !clk;
      
endmodule

