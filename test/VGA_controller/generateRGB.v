`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:59 01/26/2019 
// Design Name: 
// Module Name:    generateRGB 
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
module generateRGB(
		RedPix,
		GreenPix,
		BluePix,
		Hcount,
		Vcount,
		RGBinp
    );

input[9:0] Hcount;
input[9:0] Vcount;
input[7:0] RGBinp;
output[2:0] RedPix;
output[2:0] GreenPix;
output[1:0] BluePix;
//
reg[2:0] RedPix;
reg[2:0] GreenPix;
reg[1:0] BluePix;

always @(posedge Hcount[0])begin
	if(Hcount<=640)begin
		RedPix[2:0]<=RGBinp[7:5];
		GreenPix[2:0]<=RGBinp[4:2];
		BluePix[1:0]<=RGBinp[1:0];
	end else begin
		RedPix[2:0]<=3'b0;
		GreenPix[2:0]<=3'b000;
		BluePix[1:0]<=2'b00;
	end
end
 
endmodule
