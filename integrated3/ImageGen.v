`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:36 07/14/2019 
// Design Name: 
// Module Name:    ImageGen 
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
`define	RED 8'b11100000
`define	GREEN 8'b00011100
`define	BLUE 8'b00000011
`define	BLYAN 8'b00011110
`define	CYAN 8'b00011111
`define	PINK 8'b11100011
`define	WHITE 8'b11111111
`define	BLACK 8'b0
`define	YELLOW 8'b11111100

module ImageGen(
	Hcounter,
	Vcounter,
	PixData,
	PaddleCentreX,
	TextConstructor,
	BallCentreX,
	BallCentreY
    );

input		[9:0] Hcounter,Vcounter;
input		[9:0] PaddleCentreX;
input		[9:0]	BallCentreX,BallCentreY;
input		[7:0]	TextConstructor;
output	[7:0] PixData;

reg		[7:0]	PixData;
wire		[7:0]	WallConstructor;

//-------------------Wall contructor--------------------
parameter width 	= 	32;
parameter height	=	16;

wire		[9:0] Wrem,Hrem,HQ,oddev;

assign 	Wrem		=	Hcounter%width;
assign 	Hrem		=	Vcounter%height;
assign 	HQ			=	Vcounter/height;
assign 	oddev		=	HQ%2;
assign	WallConstructor=((Hrem==0)||((oddev==0)&&(Wrem==0))||((oddev==1)&&(Wrem==16)))?	`RED:`CYAN;
//------------------------------------------------------

//-----------------Paddle contructor--------------------
wire		PaddleGen;

assign PaddleGen	=	((Hcounter>=PaddleCentreX-40)&&(Hcounter<=PaddleCentreX+40))?	1'b1:1'b0;
//------------------------------------------------------

//-----------------ball constructor---------------------
wire signed [9:0] Hdiff,Vdiff;
wire signed [19:0] Hsq,Vsq,Dst;
//
assign Hdiff=Hcounter-BallCentreX;
assign Vdiff=Vcounter-BallCentreY;
assign Hsq=Hdiff*Hdiff;
assign Vsq=Vdiff*Vdiff;
assign Dst=Hsq+Vsq;
assign BallGen	=	(Dst<=256)?	1'b1:1'b0;
//------------------------------------------------------

always @(*)
begin
	if(Vcounter<16&&Hcounter>=160&&Hcounter<512)PixData=TextConstructor;
	else if(Hcounter>=80&&Hcounter<=560&&Vcounter>160)begin
		if(BallGen)	PixData	=	`BLYAN;
		else if((Vcounter>=464&&PaddleGen))	PixData=`RED;
		else PixData=`BLACK;
	end else PixData=WallConstructor;
end
endmodule
