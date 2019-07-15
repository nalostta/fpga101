`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:41:50 07/15/2019 
// Design Name: 
// Module Name:    SoundGen 
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
module SoundGen(
	clk,
	Locked,
	PaddleHit,
	NormalHit,
	Buzzer
    );

input clk,Locked,PaddleHit,NormalHit;
output Buzzer;

reg	[15:0]	ClkDivider;
reg	[1:0] 	curr_state,next_state;
reg 	[24:0]	count,next_count;
reg	[5:0]		delay_input;

assign Buzzer	=	(curr_state==2)?	ClkDivider[14]:(curr_state==1)?	ClkDivider[12]:0;

always @(posedge clk)
if(Locked)begin
	delay_input[5:1]<=delay_input[4:0];
	delay_input[0]<=NormalHit;
end else begin
	delay_input<=0;
end

always @(posedge clk)
if(Locked)ClkDivider<=ClkDivider+1'b1;
else ClkDivider<=0;

always @(posedge clk)
if(Locked)curr_state<=next_state;
else curr_state<=0;

always @(posedge clk)
if(Locked)count<=next_count;
else count<=0;

always @(*)
begin
	next_state=curr_state;
	next_count=0;
	case(curr_state)
		0:
		begin
			next_count=0;
			if(PaddleHit)next_state=1;
			else if(delay_input[5])next_state=2;
		end
		
		1:
		begin
			if(count==6000000)next_state=0;
			else next_count=count+1'b1;
		end 
		
		2:
		begin
			if(count==6000000)next_state=0;
			else next_count=count+1'b1;
		end
		
		default:
		begin
			next_state=0;
			next_count=0;
		end
	endcase
end
endmodule
