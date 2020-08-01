`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:37 11/11/2018 
// Design Name: 
// Module Name:    FA 
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
module FA(a, b, cin, select, sum, carry);
	input a;
	input b;
	input cin;
	input select;
	output sum;
	output carry;
	wire w1, w2, w3, w4, w5;
	
	xor #10 (w1, b, select);
	
	xor #10 (w2, a, w1);
	xor #10 (sum, w2, cin);
	
	/*or #5 (w3, a, w1);*/
	and #5 (w4, w2, cin);
	and #5 (w5, a, w1);
	or #5 (carry, w4, w5);
	
endmodule
