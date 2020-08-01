`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:44 10/28/2018 
// Design Name: 
// Module Name:    Testbench1 
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
module Testbench1;
	reg A,B,C,D;
	wire E;
	XOR_using_Decoder XOR(A,B,C,D,E);
	initial
		begin
			A=0; B=0; C=0; D=0;
			#100
			A=0; B=0; C=0; D=1;
			#100
			A=0; B=0; C=1; D=0;
			#100
			A=0; B=0; C=1; D=1;
			#100
			A=0; B=1; C=0; D=0;
			#100
			A=0; B=1; C=0; D=1;
			#100
			A=0; B=1; C=1; D=0;
			#100
			A=0; B=1; C=1; D=1;
			#100
			A=1; B=0; C=0; D=0;
			#100
			A=1; B=0; C=0; D=1;
			#100
			A=1; B=0; C=1; D=0;
			#100
			A=1; B=0; C=1; D=1;
			#100
			A=1; B=1; C=0; D=0;
			#100
			A=1; B=1; C=0; D=1;
			#100
			A=1; B=1; C=1; D=0;
			#100
			A=1; B=1; C=1; D=1;
			#100
			$finish;
		end
endmodule
