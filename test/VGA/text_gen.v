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
		Hcounter,
		Vcounter,
		PixData,
		CharData,
		Bin,
		CharRst
    );

//inputs:
input[9:0] Hcounter,Vcounter;
input Bin;
//outputs:
output[7:0] PixData;
output[6:0] CharData;
output CharRst;
//wires:
wire[3:0]	Vwire;
wire[7:0]	Hwire;

assign Hwire	=	(Hcounter);
assign Vwire	=	Vcounter;
assign CharRst	=	((Vcounter<=16)&&(Hcounter<512))?	1'b0:1'b1;
assign CharData =	{Vwire,Hwire};
assign PixData	=	(Bin==1)?	`WHITE:`BLACK;
endmodule
