`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:27 04/14/2019 
// Design Name: 
// Module Name:    DataOutModule1 
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
module DataOutModule1(
		clk,
		ps2clk,
		ps2data,
		data,
		Locked,
		debug,
		pushbtn
    );

input clk,Locked,pushbtn;
inout ps2data,ps2clk;
input[7:0] data;
output debug;
reg debug;
reg[13:0] ClkDivider;
reg[7:0] buffer,SentData;
reg[1:0] txmatch,shiftmatch;
reg dout,en;
integer i;

assign NewData = (ClkDivider[13:10]==4'b1000)?	1'b1:1'b0;
assign ShiftData = (ClkDivider[12:9]==4'b001)?	1'b1:1'b0;
assign ps2clk 	= (en)?	ClkDivider[9]:1'b1;
assign ps2data = (en)?	buffer[0]:1'b1;
assign detect  = (ClkDivider[9]==1)?	1'b1:1'b0;

//A-----------------------------------------A
always @(posedge clk or posedge en)begin
	if(en)	ClkDivider<=ClkDivider+1;
	else	ClkDivider<=13'b0; //reset state
end

always @(posedge clk)begin
	if(Locked)begin
		if(SentData[0]!=data[0])begin
			SentData[0]<=data[0];
			en<=1'b1;
			debug<=1'b1;
		end
		if(pushbtn)debug<=1'b0;
		if(NewData)en<=1'b0;
	end else begin
		en<=1'b0;
		SentData<=8'h00;
		debug<=0;
	end
end

always @(posedge ps2clk or posedge en)begin
	if(en)begin
		if(ShiftData)	buffer[7:0]<=data[7:0];
		else begin
			for(i=0;i<=6;i=i+1)	buffer[i]<=buffer[i+1];
			dout<=buffer[0];
		end
	end else begin
		buffer[7:0]<=8'b0;
		dout<=1'b0;
	end
end
//A-----------------------------------------A
endmodule
