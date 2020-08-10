`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:49:42 02/07/2019 
// Design Name: 
// Module Name:    Wall 
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
`define	CYAN 8'b00011111

module Wall(
		Hcounter,
		Vcounter,
		PixData
    );
	 
//inputs:
input[9:0] Hcounter,Vcounter;
//outputs:
output[7:0] PixData;
//wires:
wire[9:0] width,height;
wire[9:0] Wrem,Hrem,HQ,oddev;
//frame logic
assign width=32;
assign height=16;
assign Wrem=Hcounter%width;
assign Hrem=Vcounter%height;
assign HQ=Vcounter/height;
assign oddev=HQ%2;
assign PixData=((Hrem==0)||((oddev==0)&&(Wrem==0))||((oddev==1)&&(Wrem==16)))?	`RED:`CYAN;
endmodule
