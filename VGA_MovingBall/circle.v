`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:48:01 02/06/2019 
// Design Name: 
// Module Name:    circle 
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
`define radius_circle = 300


module circle(
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
//wires:
wire signed [9:0] Hdiff,Vdiff;
wire signed [19:0] Hsq,Vsq,Dst;
//
wire[9:0] width,height;
wire[9:0] Wrem,Hrem,HQ,oddev;
//frame logic
assign width=32;
assign height=16;
assign Wrem=Hcounter%width;
assign Hrem=Vcounter%height;
assign HQ=Vcounter/height;
assign oddev=HQ%2;
//
assign Hdiff=Hcounter-Hcentre;
assign Vdiff=Vcounter-Vcentre;
assign Hsq=Hdiff*Hdiff;
assign Vsq=Vdiff*Vdiff;
assign Dst=Hsq+Vsq;
assign PixData=(Dst<=256)?	`BLACK:(((Hrem==0)||((oddev==0)&&(Wrem==0))||((oddev==1)&&(Wrem==16)))?	`RED:`CYAN);
endmodule
