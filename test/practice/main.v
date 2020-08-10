`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:12 02/01/2019 
// Design Name: 
// Module Name:    main 
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
module main(
		clk,
		dataout
    );
// 
input clk;
//
output[9:0] dataout;
//
wire signed[9:0] dataout;
wire[9:0] A,B,C;
//
assign A=20;
assign B=40;
assign C=-A;
assign dataout=B+C;
endmodule
