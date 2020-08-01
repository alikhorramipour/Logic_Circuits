`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:19 10/28/2018 
// Design Name: 
// Module Name:    FPGA 
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
module FPGA(
	 input a,
    input b,
    input c,
    input d,
    output out
    );
	 
	 wire e1, e2, e3, e4;
	 wire o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15;
	 
	 Decoder_2x4 g5(a, b, 1, e1, e2, e3, e4);
	 Decoder_2x4 g1(c, d, e1, o0, o1, o2, o3); 
	 Decoder_2x4 g2(c, d, e2, o4, o5, o6, o7);
	 Decoder_2x4 g3(c, d, e3, o8, o9, o10, o11);
	 Decoder_2x4 g4(c, d, e4, o12, o13, o14, o15);
	 
	 assign out = o1 | o2 | o4 | o7 | o8 | o11 | o13 | o14;
	 
endmodule
