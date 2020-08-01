`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:52:02 11/11/2018 
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
	reg [3:0] a;
	reg [3:0] b;
	reg select;
	wire [3:0] res;
	wire carry;
	fourBit_adder adder (a, b, select, res, carry);
	initial
		begin 
			a = 4'b0100; b = 4'b0110; select = 1'b0; 
			#200
			a = 4'b0101; b = 4'b0101; select = 1'b0; 
			#200
			a = 4'b0111; b = 4'b0100; select = 1'b1; 
			#200
			a = 4'b0100; b = 4'b0110; select = 1'b1;
			#200
			a = 4'b0100; b = 4'b1000; select = 1'b1;
			#200
			a = 4'b0100; b = 4'b1010; select = 1'b0;
			#200
			a = 4'b1110; b = 4'b1111; select = 1'b1;
			#200
			$finish;
		end
endmodule
