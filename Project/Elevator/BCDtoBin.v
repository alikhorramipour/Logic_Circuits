`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:18 01/08/2019 
// Design Name: 
// Module Name:    BCDtoBin 
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
module BCDtoBin(
	input in1[3:0],
	input in2[3:0],
	input in3[3:0],
	input in4[3:0],
	output out[15:0]
    );
	 assign out = {in1, in2, in3, in4};
	 


endmodule
