`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:29 11/18/2018 
// Design Name: 
// Module Name:    Testbench 
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
module Testbench();
	/*reg [1:0] sel;
	reg [3:0] in0;
	reg [3:0] in1;
	reg [3:0] in2;
	reg [3:0] in3;*/
	//wire [3:0] out;
	
	/*Mux4_1 mx (sel, in0, in1, in2, in3, out);
	initial
		begin
			in0 = 4'b0101; in1 = 4'b1101; in2 = 4'b0111; in3 = 4'b0100; sel = 2'b00;
			#200
			sel = 2'b01;
			#200
			sel = 2'b10;
			#200
			sel = 2'b11;
			#200
			$finish;
		end*/
	/*reg [1:0]a;
	reg [1:0]b;
	reg cin;*/
	/*wire [2:0]out;
	Add_2 a2(a, b, cin, out);
		initial
		begin
			a = 2'b01; b = 2'b11; cin = 1'b0;
			#200
			a = 2'b10; b = 2'b10; cin = 1'b1;
			#200
			a = 2'b11; b = 2'b11; cin = 1'b0;
			#200
			a = 2'b01; b = 2'b11; cin = 1'b1;
			#200
			$finish;
		end*/
		/*wire [3:0]out;
		Multiply_2 m2(a, b, out);
		initial
		begin
			a = 2'b01; b = 2'b11; cin = 1'b0;
			#200
			a = 2'b10; b = 2'b10; cin = 1'b1;
			#200
			a = 2'b11; b = 2'b11; cin = 1'b0;
			#200
			a = 2'b01; b = 2'b11; cin = 1'b1;
			#200
			$finish;
		end*/
	reg [1:0]a;
	reg [1:0]b;
	reg cin;
	reg [1:0]select;
	wire [3:0]out;
	ALU alu (a, b, cin, select, out);
	initial
		begin
			a = 2'b01; b = 2'b11; cin = 1'b0; select = 2'b00;
			#200
			select = 2'b01;
			#200
			select = 2'b10;
			#200
			select = 2'b11;
			#200
			$finish;
		end
		
endmodule
