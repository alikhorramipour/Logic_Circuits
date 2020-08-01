`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:30 11/18/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [1:0]a,
	 input [1:0]b,
	 input cin,
	 input [1:0]select,
	 output [3:0]out);
	 
	 wire [1:0]w1;
	 wire [2:0]w2;
	 wire [3:0]w3;
	 
	 reg zero = 1'b0;
	 
	 NAND nnd(a, b, w1);
	 Add_2 add2(a, b, cin, w2);
	 Multiply_2 mlt(a, b, w3);
	 
	 Mux4_1 mx(select, {zero, zero, a}, {zero, zero, w1}, {zero, w2}, w3, out);

endmodule
