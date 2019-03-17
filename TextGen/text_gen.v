`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:02 02/08/2019 
// Design Name: 
// Module Name:    text_gen 
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
`define	GREEN 8'b00011100
`define	BLUE 8'b00000011
`define	CYAN 8'b00011111
`define	PINK 8'b11100011
`define	WHITE 8'b11111111
`define	BLACK 8'b0
`define	YELLOW 8'b11111100
//185 H's , 16 V's

module text_gen(
		Hcounter,
		Vcounter,
		PixData,
		CharData,
		Bin,
		CharRst
    );

//inputs:
input[9:0] Hcounter,Vcounter;
input Bin;
//outputs:
output[7:0] PixData;
output[11:0] CharData;
output CharRst;
//wires:
wire[3:0]	Vwire;
wire[2:0]	Hwire;
//reg:
wire[4:0] CharSelect;

assign Hwire	=	(Hcounter-216);
assign Vwire	=	Vcounter;
assign CharRst	=	((Vcounter<16)&&(Hcounter>=216)&&(Hcounter<424))?	1'b0:1'b1;
assign CharData =	{CharSelect,Vwire,Hwire};
assign PixData	=	(Bin==1)?	`WHITE:`BLACK;
assign CharSelect = (Hcounter<224)?	5'b0:((Hcounter<232)?	5'b1:((Hcounter<240)?	5'b10:((Hcounter<248)?	5'b11:((Hcounter<256)?	5'b100:((Hcounter<264)?	5'b101:((Hcounter<272)?	5'b110:((Hcounter<280)?	5'b111:((Hcounter<288)?	5'b1000:((Hcounter<296)?	5'b1001:((Hcounter<304)?	5'b1010:((Hcounter<312)?	5'b1011:((Hcounter<320)?	5'b1100:((Hcounter<328)?	5'b1101:((Hcounter<336)?	5'b1110:((Hcounter<344)?	5'b1111:((Hcounter<352)?	5'b10000:((Hcounter<360)?	5'b10001:((Hcounter<368)?	5'b10010:((Hcounter<376)?	5'b10011:((Hcounter<384)?	5'b10100:((Hcounter<392)?	5'b10101:((Hcounter<400)?	5'b10110:((Hcounter<408)?	5'b10111:((Hcounter<416)?	5'b11000:((Hcounter<424)?	5'b11001:5'b11010)))))))))))))))))))))))));	
endmodule
