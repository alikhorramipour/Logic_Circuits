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
	input [3:0] keypad	// 1111 is no signal, 1010 is *, 1011 is #
	);
	
	reg clk_out;
	reg counter = 0;
	reg userInsert;
	reg admincheck;
	reg usercheck;
	reg isAdmin;
	reg passcheck;
	reg keypadR0[3:0];
	reg keypadR1[3:0];
	reg keypadR2[3:0];
	reg keypadR3[3:0];
	reg keypadR4[3:0];
	
	reg [4:0] Prstate, Nxtstate; // 29 states
	freq_divider DUT(.in_freq(clk),.out_freq(clk_out),.reset(RST));
	
	parameter S0=5'b00000, SDigit0=5'b00001, SDigit1=5'b00010, SDigit2=5'b00011, SDigit3=5'b00100, SDigit4=5'b00101, S1=5'b00110,
				 S2=5'b00111, SPassCheck=5'b01000, SOK=5'b01001, SCounterIncrease=5'b01010, SUserLock=5'b01011, SUsernameCheck=5'b01100, SAdminCheck=5'b01101,
				 SCounter0=5'b01110, SAdminUserCheck=5'b01111, SAdminPassCheck=5'b10000, SAdmin=5'b10001, SAdminChange=5'b10010, SUserPassCheck=5'b10011, SReset=5'b10100,
				 SRemoveUser=5'b10101, SAdd=5'b10110, S3=5'b10111, S4=5'b11000, S5=5'b11001, S6=5'b11010, S7=5'b11011, S8=5'b11100;
	

	// instantiating added modules
		// instantiating RAM
 	SYNCSRAM DUT1(
          .clk(clk_out), // my_clk
          .rst(RST), // my_rst
          .cs(my_cs),  // chip select
	// read/write control   // read=0/write=1
          .pass_rw(my_pass_rw), 
          .admin_rw(my_admin_rw),
          .lock_rw(my_lock_rw),
          .count_rw(my_count_rw),
	// address
          .addr(my_addr), // my_addr
	//input data
          .pass_in(my_pass_in),
          .count_in(my_count_in),
          .admin_in(my_admin_in),
          .lock_in(my_lock_in),
	// output data
          .pass_out(my_pass_out), // data
          .count_out(my_count_out), // user try count
          .admin_out(my_admin_out),
          .lock_out(my_lock_out));
       // instantiating Counter
	 counter DUT2(
    .clk(clk_out), // my_clk
    .rst(RST), // my_clk
    .direction(my_direction),
    .my_count(my_count));
    	// instantiating Comparator
    /*compare #(.W(my_compare_width)) DUT3(    
    .a(inp1),
    .b(inp2),
    .result(my_res));*/
	
	always @ (posedge clk_out or negedge RST)
		/* userInsert=1 RST*/
		case(Prstate)
			S0: if (keypad == 4'b1010) begin
				Nxtstate = SDigit0;
				end
				else begin
					Nxtstate = S0;
				end
			
			SDigit0: if (keypad != 4'b1111)begin
					keypadR1 = keypad;
					Nxtstate = SDigit1;
				end
				else begin
					Nxtstate = SDigit0;
				end
				
			SDigit1: if (keypad != 4'b1111 && keypad == 4'b1010 && userInsert)begin
					
					Nxtstate = SUsernameCheck;
				end
				else if (keypadR2 != 4'b1111)begin
					keypadR2 = keypad;
					Nxtstate = SDigit2;
				end
				else begin
					Nxtstate = SDigit1;
				end
				
			SDigit2: if (keypad != 4'b1111 && keypad == 4'b1010 && userInsert)begin
					
					Nxtstate = SUsernameCheck;
				end
				else if (keypadR2 != 4'b1111)begin
					keypadR3 = keypad;
					Nxtstate = SDigit3;
				end
				else begin
					Nxtstate = SDigit2;
				end
			
			SDigit3: if (keypad != 4'b1111 && keypad == 4'b1011 && pass_rw(0) == my_pass_rw/*isPasswordAdmin*)begin
					Nxtstate = S5;
				end
				else if (keypad != 4'b1111 && keypad == 4'b1010 && admin_out /*isAdmin*/)begin
					Nxtstate = SAdminUserCheck;
				end
				else if(keypad != 4'b1111)begin
					keypadR4 = keypad;
					Nxtstate = SDigit4;
				end
				else begin
					Nxtstate = SDigit3;
				end
			
			SDigit4: if (keypad == 4'b1010 && pass_rw(0) == my_pass_rw /*PassCheck*/)begin
					Nxtstate = S1;
				end
				else if (keypad == 4'b1010 && DUT1.admin_out/*AdminCheck*/)begin
					Nxtstate = S4;
				end
				else if (keypad == 4'b1010 && DUT1.admin_out/*isAdminUser*/)begin
					Nxtstate = SUserPassCheck;
				end
				else begin
					Nxtstate = SDigit4;
				end
			
			S1: if (keypad == 4'b1011)begin
				/*user and password check*/
					if(pass_rw(0) == my_pass_rw)
					Nxtstate = SPassCheck;
				end
				else begin
					Nxtstate = S1;
				end
			
			SPassCheck: if (pass_rw(0) == my_pass_rw/*correct*/)begin
					Nxtstate = SOK;
				end
				else if(pass_rw(0) != my_pass_rw/*wrong*/) begin
					/*user counter + 1*/ 
					my_count = my_count + 1;

					Nxtstate = SCounterIncrease;
				end
				
			
			SCounterIncrease: if (counter < 3)begin
				/*reset state registers*/
				Nxtstate = S0;
				end
				else if(counter >= 3) Nxtstate = SUserLock;
				
			SUserLock:begin
				/*lock user in memory*/
				my_lock_rw = 1;
				Nxtstate = S0;
			end
			SUsernameCheck: if (keypad != 4'b1111)
				begin
					keypadR1 = keypad;
					Nxtstate = SAdminCheck;
				end
				else if(!DUT1.lock_out/*!userlock*/ && keypad == 4'b1011) begin
					passcheck = 1;
					Nxtstate = SCounter0;
				end
				else if(DUT1.lock_out/*userlock*/) begin
					/*reset*/
					DUT1.my_rst = 1;


					Nxtstate = S0;
				end
				else begin
					Nxtstate =SUsernameCheck;
				end
				
			SAdminCheck:begin
				admincheck=1;
				passcheck=0;
				usercheck=0;
				Nxtstate = SDigit1;
			end

			SAdminUserCheck: if (keypadR0 == 4'b1011)begin
				Nxtstate = SAdd;
				end
				else if (keypadR0 == 4'b1010) begin
					Nxtstate = S2;
				end
				
			SAdd: Nxtstate = SDigit0;
			
			S2: if (keypadR0 == 4'b1011)begin
				Nxtstate = SRemoveUser;
				end
				else begin
					Nxtstate = S2;
				end
					
			S3: if (keypadR0 != 4'b1111)begin
				Nxtstate = SDigit1;
				end
				else begin
					Nxtstate = S3;
				end
			
			
			S4: if (keypadR0 == 4'b1011)begin
				Nxtstate = SAdminPassCheck;
				end
				else begin
					Nxtstate = S4;
				end
			
			SAdminPassCheck: if(pass_rw(0) == my_pass_rw/*correct*/) begin
				isAdmin = 1;
				Nxtstate = SAdmin;
				end
				else if (pass_rw(0) == my_pass_rw) begin
					Nxtstate = SReset;
				end
				
			SReset:begin
				/*reset*/
				Nxtstate = S0;
			end
			
			SAdmin: if (keypad == 4'b1010)begin
				Nxtstate = SDigit0;
				end
				else begin
					Nxtstate = S4;
				end
				
			S5: if (keypad == 4'b1011)begin
				Nxtstate = SAdminChange;
				end
				else begin
					Nxtstate = S5;
				end
				
			SAdminChange: Nxtstate = S0;
			
			SUserPassCheck: if(pass_rw(0) == my_pass_rw/*correct*/) begin
				Nxtstate = S6;
				end
				else begin
					Nxtstate = SUserPassCheck;
				end
				
			S6: if(keypad == 4'b1011) begin
				Nxtstate = S7;
				end
				else begin
					Nxtstate = S6;
				end
				
			S7: if(keypad == 4'b1010) begin
				Nxtstate = S8;
				end
				else begin
					Nxtstate = S7;
				end
				
			S8: Nxtstate = SDigit0;
			
			

		endcase

endmodule
