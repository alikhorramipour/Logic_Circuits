`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:54 10/21/2018 
// Design Name: 
// Module Name:    Circuit 
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
module Circuit(A, B, C, D, E);
   input A,B,C,D;
	output E;
	wire w1,w2,w3,w4;
	nor(w1, B, C);
	and(w2, A, w1);
	not(w4, D);
	and(w3, w1, w4);
	or(E, w2, w3);

endmodule