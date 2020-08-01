`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:33 12/02/2018 
// Design Name: 
// Module Name:    testbench 
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
module testbench();
	reg a, b, c, d, clk;
	wire y, z;
	
	circuit crk1 (a, b, c, d, clk, y, z);
	
	always
		#30 clk = !clk;
	
	initial 
		begin
		 clk = 1'b0;
		 a = 1'b0;
		 b = 1'b1;
		 c = 1'b1;
		 d = 1'b0;
		 
		 #30
		 c = 1'b0;
		 
		 #30
		 #30
		 a = 1'b1;
		 c = 1'b1;
		 #30
		 #30
		 b = 1'b0;
		 c = 1'b0;
		 d = 1'b1;
		 #30
		 #30
		 a = 1'b0;
		 b = 1'b1;
		 c = 1'b1;
		 d = 1'b0;
		 #120
		 c = 1'b0;
		 
	end
	
endmodule