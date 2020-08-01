`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:09 11/04/2018 
// Design Name: 
// Module Name:    decoder 
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
module decoder(input [3:0] gray, output [3:0] bin);
	assign bin[3] = gray[3]; 
	assign bin[2] = gray[3] ^ gray[2]; 
	assign bin[1] = gray[3] ^ gray[2] ^ gray[1];
	assign bin[0] = gray[3] ^ gray[2] ^ gray[1] ^ gray [0]; 
endmodule