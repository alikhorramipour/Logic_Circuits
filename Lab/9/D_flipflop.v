`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:06 12/02/2018 
// Design Name: 
// Module Name:    D_flipflop 
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
module D_flipflop(D, CLK, Q, Qp);
	input D, CLK;
	output Q, Qp;
	reg Q, Qp;
	always @(negedge CLK)
		begin
			Q <= D;
			Qp <= ~D;
			
		end
endmodule
	