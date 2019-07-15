`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:29 06/25/2019 
// Design Name: 
// Module Name:    mouse_posn 
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
module mouse_posn(
	clk,
	Locked,
	trig_en,
	XByte,
	YByte,
	StatusByte,
	Xposn,
	Yposn
    );
	 
input trig_en,Locked,clk;
input [7:0]	XByte,YByte,StatusByte;
output [9:0]	Xposn,Yposn;

assign Yovf		=	StatusByte[7];
assign Xovf 	=	StatusByte[6];
assign Ysign	=	StatusByte[5];
assign Xsign	=	StatusByte[4];

reg [9:0] next_Xposn,Xposn,next_Yposn,Yposn;
wire [9:0] Xbuf,Ybuf;

assign Xbuf = (!Xovf)?	{Xsign,Xsign,XByte}:(Xsign)?	{Xsign,Xsign,8'h00}:{Xsign,Xsign,8'hff};
assign Ybuf = (!Yovf)?	{Ysign,Ysign,YByte}:(Ysign)?	{Ysign,Ysign,8'h00}:{Ysign,Ysign,8'hff};

always @(posedge clk)
if(Locked)Xposn<=next_Xposn;
else Xposn<=320;

always @(posedge clk)
if(Locked)Yposn<=next_Yposn;
else Yposn<=240;

always @(*)
if(trig_en)
if(Xposn>520)next_Xposn=519;
else if(Xposn<120)next_Xposn=121;
else next_Xposn=Xposn+Xbuf;

always @(*)
if(trig_en)
if(Yposn>475)next_Yposn=474;
else if(Yposn<5)next_Yposn=6;
else next_Yposn=Yposn-Ybuf;
endmodule
