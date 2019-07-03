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
	en,
	reset,
	XByte,
	YByte,
	StatusByte,
	Xposn,
	Yposn
    );
	 
input en,reset,clk;
input [7:0]	XByte,YByte,StatusByte;
output [9:0]	Xposn,Yposn;
	 
reg [9:0]	Xposn,Yposn;
wire [9:0]	next_Xposn,next_Yposn;
reg [7:0]	xbuf,ybuf,clk_divider,sbuf;
wire [9:0]	x_mag,x_mag2,Xposn_raw,Yposn_raw;

assign next_Yposn	=	0;

assign x_mag[9:2]	=	0;
assign x_mag[1:0] = (sbuf[6])?	8'h03:(xbuf/64);
assign x_mag2	=	(sbuf[6])?	((sbuf[4])?	(Xposn+1'b1):(Xposn-1'b1)):((sbuf[4])?	(Xposn-1'b1):(Xposn+1'b1));
assign next_Xposn	=	en?	((x_mag2>630)?	630:(x_mag2<10)?	10:x_mag2):Xposn;

always @(posedge clk)
if(reset)
begin
	xbuf<=0;
	ybuf<=0;
	sbuf<=0;
end else begin
	xbuf<=XByte;
	ybuf<=YByte;
	sbuf<=StatusByte;
end

always @(posedge clk)
if(reset)clk_divider<=0;
else clk_divider<=clk_divider+1'b1;

assign slow_clk = clk_divider[6];

always @(slow_clk)
if(reset)
begin
	Xposn<=320;
	Yposn<=320;
end else if(en)begin
	Xposn<=next_Xposn;
	Yposn<=next_Yposn;
end else begin
	Xposn<=Xposn;
	Yposn<=Yposn;
end
endmodule
