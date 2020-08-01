`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:57 01/04/2019 
// Design Name: 
// Module Name:    Management 
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
module Management(
	input clk,
	input	RST,
	input keypad[3:0]	// 1111 is no signal, 1010 is *, 1011 is #
	);
	
	reg clk_out;
	reg counter = 0;
	reg keypadR1[3:0];
	reg keypadR2[3:0];
	reg keypadR3[3:0];
	reg keypadR4[3:0];
	reg keypadR5[3:0];
	
	reg [4:0] Prstate, Nxtstate; // 29 states
	freq_divider DUT(.in_freq(clk),.out_freq(clk_out),.reset(RST));
	
	parameter S0=5'b00000, SDigit0=5'b00001, SDigit1=5'b00010, SDigit2=5'b00011, SDigit3=5'b00100, SDigit4=5'b00101, S1=5'b00110,
				 S2=5'b00111, SPassCheck=5'b01000, SOK=5'b01001, SCounterIncrease=5'b01010, SUserLock=5'b01011, SUsernameCheck=5'b01100, SAdminCheck=5'b01101,
				 SCounter0=5'b01110, SAdminUserCheck=5'b01111, SAdminPassCheck=5'b10000, SAdmin=5'b10001, SAdminChange=5'b10010, SUserPassCheck=5'b10011, SReset=5'b10100,
				 SRemoveUser=5'b10101, SAdd=5'b10110, S3=5'b10111, S4=5'b11000, S5=5'b11001, S6=5'b11010, S7=5'b11011, S8=5'b11100;
	
	
	
	always @ (posedge clk_out or negedge RST)
		case(Prstate)
			S0: if (keypad0 == 4'b1010) begin
				Nxtstate = SDigit0;
				end
				else begin
					Nxtstate = S0;
				end
			
			SDigit0: if (keypad1 != 4'b1111)begin
					Nxtstate = SDigit1;
				end
				else begin
					Nxtstate = SDigit0;
				end
				
			SDigit1: if (keypad2 != 4'b1111 && keypad2 == 4'b1010 && userInsert)begin
					Nxtstate = SUsernameCheck;
				end
				else if (keypad2 != 4'b1111)begin
					Nxtstate = SDigit2;
				end
				else begin
					Nxtstate = SDigit1;
				end
				
			SDigit2: if (keypad2 != 4'b1111 && keypad2 == 4'b1010 && userInsert)begin
					Nxtstate = SUsernameCheck;
				end
				else if (keypad2 != 4'b1111)begin
					Nxtstate = SDigit3;
				end
				else begin
					Nxtstate = SDigit2;
				end
				
			SDigit3: if (keypad2 != 4'b1111 && keypad2 == 4'b1011 && isPasswordAdmin)begin
					Nxtstate = S5;
				end
				else if (keypad2 != 4'b1111 && keypad2 == 4'b1011 && isAdmin)begin
					Nxtstate = SAdminUserCheck;
				end
				else if(keypad2 != 4'b1111)begin
					Nxtstate = SDigit4;
				end
				else begin
					Nxtstate = SDigit3;
				end
			
			SDigit4: if (keypad0 == 4'b1010 && PassCheck)begin
					Nxtstate = S1;
				end
				else if (keypad0 == 4'b1010 && AdminCheck)begin
					Nxtstate = S4;
				end
				else if (keypad0 == 4'b1010 && isAdminUser)begin
					Nxtstate = SUserPassCheck;
				end
				else begin
					Nxtstate = SDigit4;
				end
			
			S1: if (keypad0 == 4'b1011)begin
					Nxtstate = SPassCheck;
				end
				else begin
					Nxtstate = S1;
				end
			
			SPassCheck: if (correct)begin
					Nxtstate = SOK;
				end
				else if(wrong) begin
					Nxtstate = SCounterIncrease;
				end
				
			
			SCounterIncrease: if (counter < 3)begin
				Nxtstate = S0;
				end
				else if(counter >= 3) Nxtstate = SUserLock;
				
			SUserLock: Nxtstate = S0;
			
			SUsernameCheck: if (keypad0 != 4'b1111)begin
					Nxtstate = SAdminCheck;
				end
				
			SAdminCheck: Nxtstate = SDigit1;
			
			S1: if (keypad0 == 4'b1011)begin
				Nxtstate = SPassCheck;
				end
				else begin
					Nxtstate = S1;
				end
				
			SAdminUserCheck: if (keypad0 == 4'b1011)begin
				Nxtstate = SAdd;
				end
				else if (keypad0 == 4'b1010) begin
					Nxtstate = S2;
				end
				
			SAdd: Nxtstate = Digit0;
			
			S2: if (keypad0 == 4'b1011)begin
				Nxtstate = SRemoveUser;
				end
				else begin
					Nxtstate = S2;
				end
					
			S3: if (keypad0 != 4'b1111)begin
				Nxtstate = SDigit1;
				end
				else begin
					Nxtstate = S3;
				end
			
			
			S4: if (keypad0 == 4'b1011)begin
				Nxtstate = SAdminPassCheck;
				end
				else begin
					Nxtstate = S4;
				end
			
			SAdminPassCheck: if(correct) begin
				Nxtstate = SAdmin;
				end
				else if (wrong) begin
					Nxtstate = SReset;
				end
				
			SReset: Nxtstate = S0;
			
			SAdmin: if (keypad0 == 4'b1011)begin
				Nxtstate = SDigit0;
				end
				else begin
					Nxtstate = S4;
				end
				
			S5: if (keypad0 == 4'b1011)begin
				Nxtstate = SAdminChange;
				end
				else begin
					Nxtstate = S5;
				end
				
			SAdminChange: Nxtstate = S0;
			
			SUserPassCheck: if(correct) begin
				Nxtstate = S6;
				end
				else begin
					Nxtstate = SUserPassCheck;
				end
				
			S6: if(keypad0 == 4'b1011) begin
				Nxtstate = S7;
				end
				else begin
					Nxtstate = S6;
				end
				
			S7: if(keypad0 == 4'b1010) begin
				Nxtstate = S8;
				end
				else begin
					Nxtstate = S7;
				end
				
			S8: Nxtstate = Digit0;
			
			

		endcase

endmodule
