`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:00 11/04/2018 
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
	reg [3:0] in;
	wire [3:0] out;
	//B2G b2g (in , out);
	G2B g2b (in , out);
	initial 
		begin 
			in[3]  = 1'b1; in[2]  = 1'b0; in[1]  = 1'b1; in[0]  = 1'b0; 
			#50
			in[3]  = 1'b0; in[2]  = 1'b1; in[1]  = 1'b1; in[0]  = 1'b1;
			#50
			in[3] = 1'b0; in[2] = 1'b0; in[1] = 1'b1; in[0] = 1'b0;
			#50
			$finish;
		end
endmodule

