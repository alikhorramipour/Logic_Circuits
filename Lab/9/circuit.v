`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:47 12/02/2018 
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
module circuit(A, B, C, D, CLK, Y, Z);
	 input A, B, C, D, CLK;
	 output Y, Z;
	 wire qNot, qNot2;
	 wire w1, w2, w3;
	 wire [1:7]w; 
	 
	 and #20 g1(w[1], A, C);
	 and #20 g2(w[2], B, D);
	 and #20 g3(w[3], Y, D);
	 and #20 g4(w[4], A, C);
	 and #20 g5(w[5], w[6],w[7]);
		
	or #20	g6(w1, w[1], w[2]);
	or #20	g7(w[6], w3, C);
	or #20	g8(w[7], B, qNot);
		
	nand #20 g9(w2, w[3], w[4]);
	not #20 g10(Z, w[5]);
	
	D_flipflop F11(w1, CLK, tmpY, qNot);
		
	wire tmpY;
	and #15 (Y, tmpY, tmpY);
	
	D_flipflop F12(w2, CLK, tmpw3, qNot2);
	
	wire tmpw3;
	and #15 (w3, tmpw3, tmpw3);
	
endmodule
