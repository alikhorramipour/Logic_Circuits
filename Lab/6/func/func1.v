`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:15 11/04/2018 
// Design Name: 
// Module Name:    func1 
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
module func1(a, b, c, f);
	input a, b, c;
	output f;
	wire w1, w2, w3;
	and #10 (w1, a, b);
	not #15 (w2, b);
	and #10 (w3, a, w2, c);
	or #10 (f, w1, w3);
endmodule
