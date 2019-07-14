`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:02 02/08/2019 
// Design Name: 
// Module Name:    text_gen 
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
`define	CYAN 8'b00011111
`define	PINK 8'b11100011
`define	WHITE 8'b11111111
`define	BLACK 8'b0
`define	YELLOW 8'b11111100
//185 H's , 16 V's

module text_gen(
		clk,
		Locked,
		Hcounter,
		Vcounter,
		PixData,
		CharAddr,
		Bin,
		HitScore,
		MissScore
    );

input 	Bin,clk,Locked;
input 	[3:0]		HitScore,MissScore;
input		[9:0]		Hcounter,Vcounter;
output	[7:0]		PixData;
output	[11:0]	CharAddr;

reg		[3:0]		counter;
reg		[11:0]	CharAddr;

wire 		[4:0]		HitScoreChar,MissScoreChar;

assign	HitScoreChar=HitScore+19;
assign	MissScoreChar=MissScore+19;

assign PixData	=	(Bin==1)?	`BLACK:`WHITE;

always @(posedge clk)
if(CharAddr[11:7]==31)counter<=0;
else counter<=counter+1'b1;

always @(*)
begin
	CharAddr[6:3]=Vcounter;
	CharAddr[2:0]=counter;
	if(Hcounter>=184&&Hcounter<192)CharAddr[11:7]=0;//w1
	else if(Hcounter>=193&&Hcounter<201)CharAddr[11:7]=1;//w2
	else if(Hcounter>=201&&Hcounter<209)CharAddr[11:7]=2;//e
	else if(Hcounter>=209&&Hcounter<218)CharAddr[11:7]=3;//l
	else if(Hcounter>=219&&Hcounter<227)CharAddr[11:7]=4;//c
	else if(Hcounter>=228&&Hcounter<236)CharAddr[11:7]=5;//o
	else if(Hcounter>=237&&Hcounter<245)CharAddr[11:7]=6;//m
	else if(Hcounter>=246&&Hcounter<254)CharAddr[11:7]=2;//e
	else if(Hcounter>=256&&Hcounter<264)CharAddr[11:7]=7;//t
	else if(Hcounter>=264&&Hcounter<272)CharAddr[11:7]=5;//o
	else if(Hcounter>=275&&Hcounter<283)CharAddr[11:7]=8;//p
	else if(Hcounter>=283&&Hcounter<291)CharAddr[11:7]=9;//h
	else if(Hcounter>=291&&Hcounter<299)CharAddr[11:7]=10;//i
	else if(Hcounter>=300&&Hcounter<309)CharAddr[11:7]=17;//-
	else if(Hcounter>=309&&Hcounter<318)CharAddr[11:7]=2;//e
	else if(Hcounter>=318&&Hcounter<326)CharAddr[11:7]=11;//d
	else if(Hcounter>=326&&Hcounter<334)CharAddr[11:7]=12;//u
	else if(Hcounter>=334&&Hcounter<342)CharAddr[11:7]=4;//c
	else if(Hcounter>=342&&Hcounter<349)CharAddr[11:7]=13;//a
	else if(Hcounter>=349&&Hcounter<357)CharAddr[11:7]=7;//t
	else if(Hcounter>=357&&Hcounter<365)CharAddr[11:7]=10;//i
	else if(Hcounter>=365&&Hcounter<373)CharAddr[11:7]=5;//o
	else if(Hcounter>=374&&Hcounter<382)CharAddr[11:7]=14;//n
	else if(Hcounter>=382&&Hcounter<390)CharAddr[11:7]=16;//!
	else if(Hcounter>=392&&Hcounter<400)CharAddr[11:7]=9;//h
	else if(Hcounter>=400&&Hcounter<408)CharAddr[11:7]=10;//i
	else if(Hcounter>=408&&Hcounter<416)CharAddr[11:7]=7;//t
	else if(Hcounter>=417&&Hcounter<425)CharAddr[11:7]=18;//=
	else if(Hcounter>=426&&Hcounter<434)CharAddr[11:7]=HitScoreChar;	// HitScore
	else if(Hcounter>=436&&Hcounter<444)CharAddr[11:7]=6;//m
	else if(Hcounter>=444&&Hcounter<452)CharAddr[11:7]=10;//i
	else if(Hcounter>=452&&Hcounter<460)CharAddr[11:7]=15;//s
	else if(Hcounter>=460&&Hcounter<468)CharAddr[11:7]=15;//s
	else if(Hcounter>=469&&Hcounter<477)CharAddr[11:7]=18;//=
	else if(Hcounter>=478&&Hcounter<486)CharAddr[11:7]=MissScoreChar;	// MissScore
	else CharAddr[11:7]=31;
end
endmodule
