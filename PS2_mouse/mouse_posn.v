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
	en,
	reset,
	XByte,
	YByte,
	ZByte,
	Xposn,
	Yposn
    );
	 
input en,reset;
input [7:0]	XByte,YByte,ZByte;
output [9:0]	Xposn,Yposn;
	 
reg [9:0]	Xposn,Yposn;
reg [7:0]	xbuf,ybuf,zbuf;
reg [9:0]	x_mag,y_mag;

assign x_mag = (zbuf[6])?	((zbuf[4])?	340:-340):{zbuf[4],zbuf[4],xbuf};
assign y_mag = (zbuf[7])?	((zbuf[5])?	240:-240):{ybuf[5],ybuf[5],ybuf};
assign next_Xposn	=	Xposn+xmag;
assign next_Xposn	=	Yposn+ymag;

always @(posedge clk)
if(en)begin
	xbuf<=XByte;
	ybuf<=YByte;
	zbuf<=ZByte;
end else if(reset)begin
	xbuf<=0;
	ybuf<=0;
	zbuf<=0;
end else begin
	xbuf<=xbuf;
	ybuf<=ybuf;
	zbuf<=zbuf;
end

always @(posedge clk)
begin
	if(reset)
	begin
		Xposn<=0;
		Yposn<=0;
	end else begin
		Xposn<=next_Xposn;
		Yposn<=next_Yposn;
	end
end
endmodule
