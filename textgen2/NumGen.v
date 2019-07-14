`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:34:46 07/14/2019 
// Design Name: 
// Module Name:    NumGen 
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

module NumGen(
	switch,
   Hcounter,
	Vcounter,
	PixData,
	NumData,
	Bin
   );
	
input [9:0] Hcounter,Vcounter;
input [7:0] switch;
input Bin;
output [10:0] NumData;
output [7:0] PixData;

reg [10:0]	NumData;
/*
always @(*)
begin
	if(Vcounter<16)
	begin
		NumData[2:0]=Hcounter[2:0];
		NumData[6:3]=Vcounter[3:0];
		if(Hcounter>=320&&Hcounter<328)NumData[10:7]=0;
		else if(Hcounter>=336&&Hcounter<344)NumData[10:7]=1;
		else if(Hcounter>=352&&Hcounter<360)NumData[10:7]=2;
		else if(Hcounter>=368&&Hcounter<376)NumData[10:7]=3;
		else if(Hcounter>=384&&Hcounter<392)NumData[10:7]=4;
		else if(Hcounter>=400&&Hcounter<408)NumData[10:7]=5;
		else if(Hcounter>=416&&Hcounter<424)NumData[10:7]=6;
		else if(Hcounter>=432&&Hcounter<440)NumData[10:7]=7;
		else if(Hcounter>=448&&Hcounter<456)NumData[10:7]=8;
		else if(Hcounter>=464&&Hcounter<472)NumData[10:7]=9;
		else NumData[10:7]=10;
	end
end
*/
always @(*)
begin
	if(Vcounter<16)
	begin
		if(Hcounter>=320&&Hcounter<328)begin
			NumData[2:0]=Hcounter[2:0];
			NumData[6:3]=Vcounter[3:0];
			case(switch)
				0:NumData[10:7]=0;
				1:NumData[10:7]=1;
				2:NumData[10:7]=2;
				3:NumData[10:7]=3;
				4:NumData[10:7]=4;
				5:NumData[10:7]=5;
				6:NumData[10:7]=6;
				7:NumData[10:7]=7;
				8:NumData[10:7]=8;
				9:NumData[10:7]=9;
				default: NumData=10;
			endcase
		end else begin
			NumData[2:0]=0;
			NumData[6:3]=0;
			NumData=0;
		end
	end else begin
			NumData[6:3]=0;
			NumData[2:0]=0;
			NumData=0;
	end
end


assign PixData = Bin?	`WHITE:`BLACK;
endmodule
