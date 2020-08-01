`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:40 10/28/2018 
// Design Name: 
// Module Name:    Decoder_2x4 
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
module Decoder_2x4(
    input a1,
    input a2,
    input enable,
    output b1,
    output b2,
    output b3,
    output b4
    );
	 
	 assign b1 = (enable) & (!a1) & (!a2);
	 assign b2 = (enable) & (!a1) & (a2);
	 assign b3 = (enable) & (a1) & (!a2);
	 assign b4 = (enable) & (a1) & (a2);

endmodule