`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:16 11/04/2018 
// Design Name: 
// Module Name:    Testbench 
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
module Testbench();
	reg a, b, c;
	wire w;
	func1 f1 (a, b, c, w);
	//func2 f2 (a, b, c, w);
	initial
		begin
			a = 1'b1; b = 1'b1; c = 1'b1;
			#50
			a = 1'b1; b = 1'b0; c = 1'b1;
			#50
			$finish;
		end
endmodule
