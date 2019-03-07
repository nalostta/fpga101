`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:49 02/04/2019 
// Design Name: 
// Module Name:    pix_Controller 
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

//RGB stripe values
`define	RED 8'b11100000
`define	GREEN 8'b00011100
`define	BLUE 8'b00000011
`define	CYAN 8'b00011111
`define	PINK 8'b11100011
`define	WHITE 8'b11111111
`define	BLACK 8'b0
`define	YELLOW 8'b11111100
//

module pix_Controller(
		PixData,
		Hcounter,
		Vcounter,
		Red,
		Green,
		Blue
    );

//inputs:
input[9:0] Hcounter,Vcounter;
input[7:0] PixData;
//outputs:
output[2:0] Red,Green;
output[1:0] Blue;
//regs:
reg[2:0] Red,Green;
reg[1:0] Blue;
//wire:

//assign frame 
always @(posedge Hcounter[0])begin
	//Vertical stripes
	if(Hcounter<640&& Hcounter>=0)begin
		Red[2:0]<=PixData[7:5];
		Green[2:0]<=PixData[4:2];
		Blue[1:0]<=PixData[1:0];
	end else begin
		Red[2:0]<=3'b0;
		Green[2:0]<=3'b000;
		Blue[1:0]<=2'b00;
	end
end
endmodule

/*
//RED SCREEN
if(Hcounter<640 && Hcounter>=0)begin
		//frame constraints/data:
		Red[2:0]<=3'b111;
		Green[2:0]<=3'b0;
		Blue[1:0]<=2'b0;
	end else begin
		Red[2:0]<=3'b0;
		Green[2:0]<=3'b000;
		Blue[1:0]<=2'b00;
	end
*/


