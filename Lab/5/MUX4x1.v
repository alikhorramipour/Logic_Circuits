`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:28 10/28/2018 
// Design Name: 
// Module Name:    MUX4x1 
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
module MUX4x1 (
    input d0,
    input d1,
    input d2,
    input d3,
    input c0,
    input c1,
    output out
    );
	 
	 assign out = ((!c0) & (!c1) & d0) | ((!c0) & (c1) & d1) | ((c0) & (!c1) & d2) | ((c0) & (c1) & d3);


endmodule