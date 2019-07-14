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
	BallCentreX,
	BallCentreY,
	BallYDir,
	PaddleCentreX,
	PaddleCentreY,
	PaddleHit,
	HitScore,
	MissScore,
	TrigSound
    );
	 
input		clk,Locked;
input		[9:0]	BallCentreX,BallCentreY;
input		[9:0]	PaddleCentreX,PaddleCentreY;

output	[3:0]	HitScore,MissScore;
output	TrigSound,PaddleHit;

reg		PaddleHit;
reg		[3:0]	HitScore,next_HitScore;

assign	PBDstY	=	BallCentreY-PaddleCentreY;
assign	PBDstX	=	BallCentreX-PaddleCentreX;

always @(posedge clk)
if(Locked)HitScore<=next_HitScore;
else HitScore<=0;

always @(*)
begin
	if((PBDstY<=24)&&(PBDstX<=56))PaddleHit=1;
	else PadlleHit=0;
end

always @(*)
begin
	if(PaddleHit&&BallYDir==1)begin
		next_HitScore=(HitScore==9)?	0:HitScore+1'b1;
	end else next_HitScore=HitScore;
end
endmodule
