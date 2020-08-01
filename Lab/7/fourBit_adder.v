`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:59 11/11/2018 
// Design Name: 
// Module Name:    fourBit_adder 
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
module fourBit_adder(a, b, select, res, carry);
	input [3:0] a;
	input [3:0] b;
	input select;
	output [3:0] res;
	output carry;
	wire [2:0] w;
	FA fa1(a[0], b[0], select, select, res[0], w[0]);
	FA fa2(a[1], b[1], w[0], select, res[1], w[1]);
	FA fa3(a[2], b[2], w[1], select, res[2], w[2]);
	FA fa4(a[3], b[3], w[2], select, res[3], carry);
endmodule
