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
		pushbtn,
		debug
    );

input clk,Locked,pushbtn;
output debug;
inout ps2data,ps2clk;
input[7:0] data;

reg[13:0] ClkDivider;
reg[7:0] buffer,SentData;
reg[3:0] count;
reg[1:0] txmatch,shiftmatch;
reg[14:0] disable_input;
reg cbuf,cbuf_q,dbuf,dbuf_q;
reg dout,en,debug;
integer i;

//assign disable_input_next = (disable_input==0)?	1'b0:disable_input-1'b1;

//assign debug_inp = (disable_input==0)?	debug:1'bz;

assign ps2clk 	= (en)?	cbuf_q:1'b1;
assign ps2data = (en)?	dbuf_q:1'bz;
/*
assign NewData = (ClkDivider[13:10]==4'b1000)?	1'b1:1'b0;
assign ShiftData = (ClkDivider[12:9]==4'b001)?	1'b1:1'b0;
assign detect  = (ClkDivider[9]==1)?	1'b1:1'b0;

*/
//A-----------------------------------------A
always @(posedge clk or posedge en)begin
	if(en)	ClkDivider<=ClkDivider+1;
	else	ClkDivider<=13'b0; //reset state
end

always @(posedge clk)begin
	if(Locked)begin
		if((SentData[7:0]!=data[7:0])&&en==0)begin
			SentData[7:0]<=data[7:0];
			en<=1'b1;
		end
		if(count==4'b1001)en<=1'b0;
		//if(NewData)en<=1'b0;
	end else begin
		en<=1'b0;
		SentData<=8'hff;
	end
end

always @(posedge clk)begin
	dbuf<=dbuf_q;
	dbuf_q<=buffer[0];
	cbuf<=cbuf_q;
	cbuf_q<=ClkDivider[9];
end


always @(posedge clk)begin
	if(count==0)debug<=1;
	else debug<=0;
	if(en)begin
		if(cbuf_q)begin
			//active shift state
			count<=count+1'b1;	
			for(i=0;i<=6;i=i+1)	buffer[i]<=buffer[i+1];
		end 
	end else begin
		//reset state
		buffer[7:0]<=data[7:0];
		count<=0;
	end
end


/*always @(posedge ps2clk)begin
	if(count==0)debug<=1;
	else debug<=0;
	if(en)begin
		count<=count+1'b1;
		if(count==4'b0)	buffer[7:0]<=data[7:0];
		else begin
			for(i=0;i<=6;i=i+1)	buffer[i]<=buffer[i+1];
		end
	end else begin
		buffer[7:0]<=8'b0;
		dout<=1'b0;
		count<=0;
	end
end*/

/*always @(posedge clk)begin
	if(debug)begin
		disable_input<=15'hffff;
	end else begin
		disable_input<=disable_input_next;
	end
end*/
//A-----------------------------------------A
endmodule
