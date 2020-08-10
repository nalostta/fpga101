`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:00:37 07/15/2019 
// Design Name: 
// Module Name:    ScoreTracker 
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
module ScoreTracker(
	clk,
	Locked,
	reset_score,
	BallCentreX,
	BallCentreY,
	PaddleCentreX,
	PaddleHit,
	HitScore,
	MissScore,
	TrigSound
    );
	 
input		clk,Locked,reset_score;
input		[9:0]	BallCentreX,BallCentreY;
input		[9:0]	PaddleCentreX;

output	[3:0]	HitScore,MissScore;
output	TrigSound,PaddleHit;

reg 		[1:0]	curr_state,next_state;
reg		[3:0]	HitScore,next_HitScore,next_MissScore,MissScore;

assign PaddleHit	=	(BallCentreX>=(PaddleCentreX-56))&&(BallCentreX<=(PaddleCentreX+56))&&(BallCentreY>=(448));
assign PaddleMiss	=	((BallCentreY>=463)&&!PaddleHit);

assign TrigSound	=	PaddleHit;

always @(posedge clk)
if(Locked)begin
	curr_state<=next_state;
end else begin
	curr_state<=0;
end

always @(posedge clk)
if(Locked)begin
HitScore<=next_HitScore;
MissScore<=next_MissScore;
end else begin
HitScore<=0;
MissScore<=0;
end

always @(*)
begin
	next_state=curr_state;
	next_HitScore=HitScore;
	next_MissScore=MissScore;
	case(curr_state)
		0:
		begin
			if(PaddleHit)begin
				next_state=1;
				next_HitScore=(HitScore==9)?	0:HitScore+1'b1;
			end else if(PaddleMiss)begin
				next_state=2;
				next_MissScore=(MissScore==9)?	0:MissScore+1'b1;
			end
		end
		
		1:
		begin
			next_HitScore=HitScore;
			if(!PaddleHit)begin
				 next_state=0;
			end
		end
		
		2:
		begin
			next_MissScore=MissScore;
			if(!PaddleMiss)begin
				 next_state=0;
			end
		end
		
	default : 
	begin
	next_state=0;	
	next_HitScore=0;
	next_MissScore=0;
	end
	endcase
end
endmodule
