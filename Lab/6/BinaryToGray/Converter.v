`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engrayineer: 
// 
// Create Date:    13:32:33 11/04/2018 
// Desigrayn Name: 
// Module Name:    Converter 
// Project Name: 
// Targrayet Devices: 
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
module ConverterBinTogray(bin, gray);
	assign gray[3] = bin[3]; 
	assign gray[2] = bin[3] ^ bin[2]; 
	assign gray[1] = bin[2] ^ bin[1];
	assign gray[0] = bin[1] ^ bin[0]; 
endmodule
