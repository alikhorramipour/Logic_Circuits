`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:38 11/18/2018 
// Design Name: 
// Module Name:    Add_2 
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
module Add_2(
    input [1:0]a,
	 input [1:0]b,
	 input cin,
	 output [2:0]out);
	 wire w1, w2;
	 FA fa0(a[0], b[0], cin, cin, out[0], w1);
	 xor ( out[2] ,w2, cin);
	 FA fa1(a[1], b[1], w1, cin, out[1], w2);
	 
endmodule
