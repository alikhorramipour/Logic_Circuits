`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:43 11/18/2018 
// Design Name: 
// Module Name:    bcd2seven 
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
module bcd2seven_seg(a,b,cin,select,SEG_SEL,SEG_DATA);
	input [1:0]a;
	input [1:0]b;
	input cin;
	input [1:0]select;
	output [4:0]SEG_SEL;
	output [7:0]SEG_DATA;
	reg [7:0]SEG_DATA;
	//reg [3:0]mux_out;
	wire [3:0]mux_out;
	ALU alu(a, b, cin, select, mux_out);
	
	always @(mux_out)
		begin
			case(mux_out)
				0:SEG_DATA = 8'b00111111;
				1:SEG_DATA = 8'b00000110;
				2:SEG_DATA = 8'b01011011;
				3:SEG_DATA = 8'b01001111;
				4:SEG_DATA = 8'b01100110;
				5:SEG_DATA = 8'b01101101;
				6:SEG_DATA = 8'b01111101;
				7:SEG_DATA = 8'b00000111;
				8:SEG_DATA = 8'b01111111;
				9:SEG_DATA = 8'b01101111;
			endcase
		end
	assign SEG_SEL=5'b00001;
endmodule
//MODULE INSTANTIATIONS IN BASED ON TABLE 1
