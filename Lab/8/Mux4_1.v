`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:25 11/18/2018 
// Design Name: 
// Module Name:    Mux4_1 
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
module Mux4_1(
		input [1:0]sel,
		input [3:0]in0,
		input [3:0]in1,
		input [3:0]in2,
		input [3:0]in3,
		output [3:0]out);
		
	wire [3:0]w0;
	wire [3:0]w1;
	wire [3:0]w2;
	wire [3:0]w3;
	wire [1:0]nSel;
	
	not (nSel[0], sel[0]); // !b
	not (nSel[1], sel[1]); // !a
				  
	and (w0[0], nSel[0], nSel[1], in0[0]); // !a!bI0
	and (w0[1], sel[0], nSel[1], in1[0]); // !abI1
	and (w0[2], nSel[0], sel[1], in2[0]); // a!bI2
	and (w0[3], sel[0], sel[1], in3[0]); // abI3
	or (out[0], w0[0], w0[1], w0[2], w0[3]); // output
	
	and (w1[0], nSel[0], nSel[1], in0[1]); // !a!bI0
	and (w1[1], sel[0], nSel[1], in1[1]); // !abI1
	and (w1[2], nSel[0], sel[1], in2[1]); // a!bI2
	and (w1[3], sel[0], sel[1], in3[1]); // abI3
	or (out[1], w1[0], w1[1], w1[2], w1[3]); // output
	
	and (w2[0], nSel[0], nSel[1], in0[2]); // !a!bI0
	and (w2[1], sel[0], nSel[1], in1[2]); // !abI1
	and (w2[2], nSel[0], sel[1], in2[2]); // a!bI2
	and (w2[3], sel[0], sel[1], in3[2]); // abI3
	or (out[2], w2[0], w2[1], w2[2], w2[3]); // output
	
	and (w3[0], nSel[0], nSel[1], in0[3]); // !a!bI0
	and (w3[1], sel[0], nSel[1], in1[3]); // !abI1
	and (w3[2], nSel[0], sel[1], in2[3]); // a!bI2
	and (w3[3], sel[0], sel[1], in3[3]); // abI3
	or (out[3], w3[0], w3[1], w3[2], w3[3]); // output
	

endmodule
