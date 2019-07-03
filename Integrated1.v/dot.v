`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:38:53 06/23/2019 
// Design Name: 
// Module Name:    dot 
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
`define Hcen = 320
`define Vcen = 240

module dot(
	Hcounter,
	Vcounter,
	PixData,
	Hcentre,
	Vcentre
    );
	 
//inputs:
input[9:0] Hcounter,Vcounter,Hcentre,Vcentre;
//outputs:
output[7:0] PixData;

assign H_posn=	(Hcentre>=620)?	620:(Hcentre<0)?	0:Hcentre;
assign V_posn=	(Vcentre>460)?	460:(Vcentre<0)?	0:Vcentre;
assign PixData=	(Vcounter>=Vcentre)?	`RED:`GREEN;

endmodule
