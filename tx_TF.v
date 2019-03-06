`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:30:10 03/04/2019
// Design Name:   UART_rs232_tx
// Module Name:   C:/Users/hecto/Desktop/Proyecto full 2019 4K Crackeado gracias diosito/tx_TF.v
// Project Name:  paila
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_rs232_tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tx_TF;

	// Inputs
	reg Clk;
	reg Rst_n;
	reg TxEn;
	reg [7:0] TxData;
	reg Tick;
	reg [3:0] NBits;

	// Outputs
	wire TxDone;
	wire Tx;

	// Instantiate the Unit Under Test (UUT)
	UART_rs232_tx uut (
		.Clk(Clk), 
		.Rst_n(Rst_n), 
		.TxEn(TxEn), 
		.TxData(TxData), 
		.TxDone(TxDone), 
		.Tx(Tx), 
		.Tick(Tick), 
		.NBits(NBits)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Rst_n = 0;
		TxEn = 0;
		TxData = 0;
		Tick = 0;
		NBits = 8;

		// Wait 100 ns for global reset to finish
		#100;
		Rst_n = 1;
		TxEn = 1;
		TxData = 5; 
		
        
		// Add stimulus here

	end
	always begin
		//#100 Clk = !Clk;
      #100 Tick = !Tick;
	end
endmodule

