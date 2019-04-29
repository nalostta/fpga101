`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:31:40 01/06/2019 
// Design Name: 
// Module Name:    bintoseg 
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
module seg7display(
    clk,
	 en,
	 ssdarray,
    Bin,
	 DigCh
    );

output[7:0]	ssdarray;
output[2:0] DigCh;
input[7:0] Bin;
input clk,en;

//reg[7:0] ssdarray;
//reg[2:0] DigCh;

assign bit0=(DigCh[0]==0)?	Bin[0]:Bin[4];
assign bit1=(DigCh[0]==0)?	Bin[1]:Bin[5];
assign bit2=(DigCh[0]==0)?	Bin[2]:Bin[6];
assign bit3=(DigCh[0]==0)?	Bin[3]:Bin[7];

assign DigCh[0]=clk;
assign DigCh[1]=!clk;
assign DigCh[2]=1'b1;

assign ssdarray[7] = (bit2&!bit1&(!bit0|bit3))|(!bit2&bit0&!(bit1^bit3));
assign ssdarray[6] = (!bit3&bit2&!bit1&bit0)|(bit3&bit2&!bit0)|(bit3&bit2&bit1)|(bit3&bit1&bit0)|(bit2&bit1&!bit0);
assign ssdarray[5] = (!bit3&!bit2&bit1&!bit0)|(bit3&bit2&!bit0)|(bit3&bit2&bit1);
assign ssdarray[4] = (!bit3&bit2&!bit1&!bit0)|(!bit3&!bit2&!bit1&bit0)|(bit3&!bit2&bit1&!bit0)|(bit2&bit1&bit0);
assign ssdarray[3] = (!bit3&bit2&!bit1)|(!bit3&bit0)|(!bit2&!bit1&bit0);
assign ssdarray[2] = (bit3&bit2&!bit1)|(!bit3&!bit2&bit0)|(!bit3&!bit2&bit1)|(!bit3&bit1&bit0);
assign ssdarray[1] = (!bit3&!bit2&!bit1)|(!bit3&bit2&bit1&bit0);
assign ssdarray[0] = 1'b1;

endmodule
