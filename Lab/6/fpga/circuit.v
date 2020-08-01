`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:28 11/04/2018 
// Design Name: 
// Module Name:    circuit 
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
module circuit(input [3:0]in, output [3:0]out, output [3:0]gray);
	wire [3:0]w;
	assign gray[3] = w[3];
	assign gray[2] = w[2];
	assign gray[1] = w[1];
	assign gray[0] = w[0];
	encoder enc(in, w);
	decoder dec(w, out);
endmodule
