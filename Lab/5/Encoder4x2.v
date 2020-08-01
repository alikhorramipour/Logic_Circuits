`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:05 10/28/2018 
// Design Name: 
// Module Name:    Encoder4x2 
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
module Encoder4x2(
    input d0,
    input d1,
    input d2,
    input d3,
    output x,
    output y,
    output valid
    );
	 
	 assign x = d3 | d2;
	 assign y = d3 | ((!d2) & d1);
	 assign valid = d0 | d1 | d2 | d3;


endmodule
