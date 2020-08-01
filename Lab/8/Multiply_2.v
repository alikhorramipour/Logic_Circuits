`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:56 11/18/2018 
// Design Name: 
// Module Name:    Multiply_2 
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
module Multiply_2(
    input [1:0]a,
	 input [1:0]b,
	 output [3:0]out);
	 
	 wire [2:0]w;
	 wire carry;
	 and (out[0], a[0], b[0]);
	 and (w[0], a[0], b[1]);
	 and (w[1], a[1], b[0]);
	 FA fa0(w[0], w[1], 0, 0, out[1], carry);
	 and (w[2], a[1], b[1]);
	 FA fa1(w[2], 0, carry, 0, out[2], out[3]);
	

endmodule
