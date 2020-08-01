`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:38 11/18/2018 
// Design Name: 
// Module Name:    NAND 
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
module NAND(
    input [1:0]a,
	 input [1:0]b,
	 output [1:0]out);
	 nand (out[0], a[0], b[0]);
	 nand (out[1], a[1], b[1]);
endmodule
