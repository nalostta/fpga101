`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:24:33 02/06/2019 
// Design Name: 
// Module Name:    rectangle 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This module generates a rectangle with green in the background and red fill.
//
//////////////////////////////////////////////////////////////////////////////////
`define	RED 8'b11100000
`define	GREEN 8'b00011100
`define	height	100
`define	length	200

/*
Assign these 4 signals in top module.
assign length = 200;
assign height = 100;
assign centre_h = 320;
assign centre_v = 240;
*/

module rectangle(
		Hcounter,
		Vcounter,
		Hcen,
		Vcen,
		PixData
    );
	 
//inputs:
input[9:0] Hcounter,Vcounter,Hcen,Vcen;
//outputs:
output[7:0] PixData;

assign PixData = ((Hcounter>(Hcen+5))||(Hcounter<(Hcen-5))||(Vcounter<(Vcen-5))||(Vcounter>(Vcen+5)))?	`RED:`GREEN;

endmodule
