`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:50 11/04/2018 
// Design Name: 
// Module Name:    G2B 
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
module G2B(input [3:0] gray, output [3:0] bin);
	assign bin[3] = gray[3]; 
	assign bin[2] = gray[3] ^ gray[2]; 
	assign bin[1] = gray[3] ^ gray[2] ^ gray[1];
	assign bin[0] = gray[3] ^ gray[2] ^ gray[1] ^ gray [0]; 
endmodule