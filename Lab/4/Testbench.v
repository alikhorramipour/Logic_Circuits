`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:41 10/21/2018 
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
module Testbench;
	reg A,B,C,D;
	wire E;
	Circuit circuit(A,B,C,D,E);
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