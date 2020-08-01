`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:24 11/04/2018 
// Design Name: 
// Module Name:    func2 
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
module func2(a, b, c, f);
	input a, b, c;
	output f;
	wire w1, w2, w3, w4;
	and #10 (w1, a, b);
	not #15 (w2, b);
	and #10 (w3, a, w2, c);
	and #10 (w4, a, c);
	or #10 (f, w1, w3, w4);
endmodule
