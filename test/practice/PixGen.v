`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:55:37 02/01/2019 
// Design Name: 
// Module Name:    PixGen 
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
module PixGen(
		hcounts,
		vcounts,
		Red,
		Green,
		Blue
    );
	 
input[9:0] hcounts,vcounts;
output[2:0] Red,Green;
output[1:0] Blue;
	 
assign Red[2:0]=3'b111;
assign Green[2:0]=3'b000;
assign Blue[1:0]=2'b0;
endmodule
