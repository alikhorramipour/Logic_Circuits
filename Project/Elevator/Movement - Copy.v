`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:44 12/22/2018 
// Design Name: 
// Module Name:    Movement 
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
module Movement(
	input clk,
	input	RST,
	input [3:1] inCall,
	input [3:1] outCall,
	input [3:1] loc,
	output [1:0] motorOut,
	output [3:1] doorOut); // motor : idle = 00, up = 10, down = 11;
	reg clk_out;
	reg [3:1] door;
	reg [1:0] motor;
	assign motorOut = motor;
	assign doorOut = door;
	reg [3:1] queue; 
	reg direction; // Direction : up = 1, down = 0; 
	reg [3:0] Prstate, Nxtstate;
	freq_divider DUT(.in_freq(clk),.out_freq(clk_out),.reset(RST));

	
	parameter S1=4'b0000, S2=4'b0001, S3=4'b0010, Su2=4'b0011, Su3=4'b0100, Sd2=4'b0101, Sd1=4'b0110, Sd21=4'b0111, Su23=4'b1000;
	
	always @ (posedge clk_out or negedge RST)
	begin
		if(~RST)	begin
			case(loc)
				3'b001 : begin Prstate = S1; Nxtstate=S1;door = 3'b111; end
				3'b010 : begin Prstate = S2; Nxtstate=S2; end
				3'b100 : begin Prstate = S3; Nxtstate=S3; end
				default : begin Prstate = S1; Nxtstate=S1; end
			 // Initialize to first floor Prstate = S1;
			endcase
			queue = 3'b000;
			
		end else begin Prstate = Nxtstate;			// Clock operations
		
		if(inCall[1] | outCall[1])begin
			queue[1] = 1'b1;
		end
		if(inCall[2] | outCall[2])begin
			queue[2] = 1'b1;
		end
		if(inCall[3] | outCall[3])begin
			queue[3] = 1'b1;
		end
		
		case(Prstate)
			S1: if (queue[2]) begin
				motor = 2'b10;
				door = 3'b000;
				direction = 1'b1;
				Nxtstate = Su2;
				end
				 else if (queue[3])begin
					motor = 2'b10;
					door = 3'b000;
					direction = 1'b1;
					Nxtstate = Su3;
				end
				else begin
					motor = 2'b00;
					door = 3'b001;
					Nxtstate = S1;
					queue[1] = 1'b0;
				end
			
			S2: if ((queue[3] & direction) | (queue[3] & ~queue[1]))begin
					motor = 2'b10;
					door = 3'b000;
					direction = 1'b1;
					Nxtstate = Su23;
				end
				 else if ((queue[1] & ~direction) | (queue[1] & ~queue[3]))begin
					motor = 2'b11;
					door = 3'b000;
					direction = 1'b0;
					Nxtstate = Sd21;
				end
				else begin
					motor = 2'b00;
					door = 3'b010;
					Nxtstate = S2;
					queue[2] = 1'b0;
				end
				
			S3: if (queue[2])begin
					motor = 2'b11;
					door = 3'b000;
					direction = 1'b0;
					Nxtstate = Sd2;
				end
				 else if (queue[1])begin
					motor = 2'b11;
					door = 3'b000;
					direction = 1'b0;
					Nxtstate = Sd1;
				end
				else begin
					motor = 2'b00;
					door = 3'b100;
					Nxtstate = S3;
					queue[3] = 1'b0;
				end
				
			Su2: if (loc[2])begin
					Nxtstate = S2;
					motor = 2'b00;
					door = 3'b010;
					queue[2] = 1'b0;
				end
				else Nxtstate = Su2;
				
			Su23: if(loc[3])begin
				Nxtstate = S3;
				motor = 2'b00;
				door = 3'b100;
				queue[3] = 1'b0;
				end
				else Nxtstate = Su23;
			
			Su3: if (loc[2])begin
					Nxtstate = Su23;
					motor = 2'b10;
					door = 3'b000;
				end
				else if (queue[2])begin
					Nxtstate = Su2;
				end
				else Nxtstate = Su3;
			
			Sd1: if (loc[2])begin
					Nxtstate = Sd21;
				end
				else if(queue[2]) Nxtstate = Sd2;
				else Nxtstate = Sd1;
			
			Sd21: if (loc[1])begin
				Nxtstate = S1;
				motor = 2'b00;
				door = 3'b001;
				queue[1] = 1'b0;
				end
				else Nxtstate = Sd21;
			
			Sd2: if (loc[2])begin
				Nxtstate = S2;
				motor = 2'b00;
				door = 3'b010;
				queue[2] = 1'b0;
				end
				else Nxtstate = Sd2;

		endcase
		
		
		end
		end
		
	/*always @ ()
	begin
		if(inCall[1] | outCall[1])begin
			queue[1] = 1'b1;
		end
		if(inCall[2] | outCall[2])begin
			queue[2] = 1'b1;
		end
		if(inCall[3] | outCall[3])begin
			queue[3] = 1'b1;
		end
		
	end*/
	
	
	/*always @ (Prstate or inCall or outCall) // Determine the next state
		begin
		if(inCall[1] | outCall[1])begin
			queue[1] = 1'b1;
		end
		if(inCall[2] | outCall[2])begin
			queue[2] = 1'b1;
		end
		if(inCall[3] | outCall[3])begin
			queue[3] = 1'b1;
		end
		
		case(Prstate)
			S1: if (queue[2]) begin
				motor = 2'b10;
				door = 3'b000;
				direction = 1'b1;
				Nxtstate = Su2;
				end
				 else if (queue[3])begin
					motor = 2'b10;
					door = 3'b000;
					direction = 1'b1;
					Nxtstate = Su3;
				end
				else begin
					motor = 2'b00;
					door = 3'b001;
					Nxtstate = S1;
					queue[1] = 1'b0;
				end
			
			S2: if ((queue[3] & direction) | (queue[3] & ~queue[1]))begin
					motor = 2'b10;
					door = 3'b000;
					direction = 1'b1;
					Nxtstate = Su23;
				end
				 else if ((queue[1] & ~direction) | (queue[1] & ~queue[3]))begin
					motor = 2'b11;
					door = 3'b000;
					direction = 1'b0;
					Nxtstate = Sd21;
				end
				else begin
					motor = 2'b00;
					door = 3'b010;
					Nxtstate = S2;
					queue[2] = 1'b0;
				end
				
			S3: if (queue[2])begin
					motor = 2'b11;
					door = 3'b000;
					direction = 1'b0;
					Nxtstate = Sd2;
				end
				 else if (queue[1])begin
					motor = 2'b11;
					door = 3'b000;
					direction = 1'b0;
					Nxtstate = Sd1;
				end
				else begin
					motor = 2'b00;
					door = 3'b100;
					Nxtstate = S3;
					queue[3] = 1'b0;
				end
				
			Su2: if (loc[2])begin
					Nxtstate = S2;
					motor = 2'b00;
					door = 3'b010;
					queue[2] = 1'b0;
				end
				else Nxtstate = Su2;
				
			Su23: if(loc[3])begin
				Nxtstate = S3;
				motor = 2'b00;
				door = 3'b100;
				queue[3] = 1'b0;
				end
				else Nxtstate = Su23;
			
			Su3: if (loc[2])begin
					Nxtstate = Su23;
					motor = 2'b10;
					door = 3'b000;
				end
				else if (queue[2])begin
					Nxtstate = Su2;
				end
				else Nxtstate = Su3;
			
			Sd1: if (loc[2])begin
					Nxtstate = Sd21;
				end
				else if(queue[2]) Nxtstate = Sd2;
				else Nxtstate = Sd1;
			
			Sd21: if (loc[1])begin
				Nxtstate = S1;
				motor = 2'b00;
				door = 3'b001;
				queue[1] = 1'b0;
				end
				else Nxtstate = Sd21;
			
			Sd2: if (loc[2])begin
				Nxtstate = S2;
				motor = 2'b00;
				door = 3'b010;
				queue[2] = 1'b0;
				end
				else Nxtstate = Sd2;

		endcase
	end*/
endmodule
