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
		transmit
    );

input clk,Locked,transmit;
inout ps2data,ps2clk;
input[7:0] data;

reg[13:0] ClkDivider;
reg[7:0] buffer;
reg[1:0] txmatch,shiftmatch;
reg dout;
reg en;
integer i;
reg[9:0] disablecount;
reg txdisable;

assign NewData = (ClkDivider[13:10]==4'b1001)?	1'b1:1'b0;
assign ShiftData = (ClkDivider[12:9]==4'b001)?	1'b1:1'b0;
assign ps2clk 	= (en)?	ClkDivider[9]:1'bz;
assign ps2data = (en)?	buffer[0]:1'bz;
assign detect  = (ClkDivider[9]==1)?	1'b1:1'b0;

/*
buffer => b4 the 1st ps2clk
*/

//A-----------------------------------------A
always @(posedge clk or posedge en)begin
	if(en)	ClkDivider<=ClkDivider+1;
	else	ClkDivider<=13'b0; //reset state
end

always @(posedge clk)begin
	if(Locked)begin
		if(txmatch[1]!=txmatch[0])begin
			txmatch[1]<=txmatch[0];
			en<=1'b1;
		end
		if(NewData)en<=1'b0;
	end else begin
		en<=1'b0;
		txmatch[1]<=1'b0;
	end
end

always @(posedge clk)begin
	if(txdisable)begin
		disablecount<=disablecount+1;
	end else begin
		disablecount<=10'b0;
	end
end

always @(posedge ps2clk or posedge en)begin
	if(en)begin
		for(i=0;i<=6;i=i+1)	buffer[i]<=buffer[i+1];
		dout<=buffer[0];
		//Q-------------------------------------------Q
		//if(detect) buffer[7:0]<=data[7:0];
		if(ShiftData)begin
			buffer<=data;
			shiftmatch[1]<=shiftmatch[0];
		end
		//Q-------------------------------------------Q
	end else begin
		buffer[7:0]<=8'b0;
		dout<=1'b0;
		shiftmatch[1]<=1'b0;
	end
end
//A-----------------------------------------A
endmodule
