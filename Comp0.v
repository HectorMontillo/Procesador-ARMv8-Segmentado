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
module Comp0(
    input [63:0] B,
    output Zero
    );
	assign Zero = (B == 0);
endmodule