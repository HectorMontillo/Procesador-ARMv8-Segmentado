`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:50:07 03/04/2019 
// Design Name: 
// Module Name:    Transmitter 
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
module Transmitter(
		Clk,
		TxData,
		Tx,
		TxDone,
		TxEn,
		TxData_s
    );

input Clk;
input [7:0] TxData;
input TxEn;
output Tx;
output TxDone;
output [7:0] TxData_s;

wire tick;
wire [15:0] BaudRate;
//wire TxEn;
//wire TxDone;
wire [3:0] NBits;
reg Rst_n = 1'b0;
reg [7:0] TxData_n;


//assign 		TxEn = 1'b1	;
assign 		BaudRate = 16'd5; 	//baud rate set to 9600 for the HC-06 bluetooth module. Why 325? (Read comment in baud rate generator file)
assign 		NBits = 4'b1000	;	//We send/receive 8 bits
assign		TxData_s = TxData_n;

UART_BaudRate_generator I_BAUDGEN(
    	.Clk(Clk)               ,
    	.Rst_n(Rst_n)           ,
    	.Tick(tick)             ,
    	.BaudRate(BaudRate)
    );

UART_rs232_tx I_RS232TX(
   	.Clk(Clk)            	,
    	.Rst_n(Rst_n)         	,
    	.TxEn(TxEn)           	,
    	.TxData(TxData_n)      	,
   	.TxDone(TxDone)      	,
   	.Tx(Tx)               	,
   	.Tick(tick)           	,
   	.NBits(NBits)
    );

always @(posedge TxEn) begin
	if (!Rst_n)
		if (TxEn == 1'b1) TxData_n <= TxData;
		
	if (TxEn == 1'b1) Rst_n <= 1'b1;
end

endmodule
