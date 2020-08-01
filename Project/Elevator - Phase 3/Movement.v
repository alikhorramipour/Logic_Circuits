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
module Movement(CLK, RST, inCall[3:1], outCall[3:1], loc[3:1], motor[1:0], door[3:1]);
	input CLK, RST, inCall[3:1], outCall[3:1], loc[3:1];
	output motor[1:0], door[3:1]; // motor : idle = 00, up = 10, down = 11;
	
	reg queue[1:3], direction; 
	reg P, direction; // Direction : up = 1, down = 0; 
	reg [2:0] Prstate, Nxtstate;
	
	parameter S1=3'b000, S2=3'b001, S3=3'b010, Su2=3'b011, Su3=3'b100, Sd2=3'b101, Sd1=1'b110;
	
	always @ (posedge CLK or negedge RST)
		if(~RST){
			Prstate = S2; // Initialize to first floor
			queue = 3'b000;
		}
		else Prstate = Nxtstate; // Clock operations
	
	always @ (Prstate or queue) // Determine the next state
		case(Prstate)
			S1: if (1'b1){
				Nxtstate = S1;
				}
				 else {
					Nxtstate = S2;
				}
		

		endcase
	
	always @ (Prstate or x) // Evaluate output
		case (Prstate)
			S1: y = 0;
			S2: y = 0;
			S3: y = 0;
			Su2: y = 0;
			Su3: y = 0;
			Sd2: y = 0;
			Sd1: y = 0;
		endcase
	
endmodule
