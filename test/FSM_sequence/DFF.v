`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:40 01/09/2019 
// Design Name: 
// Module Name:    DFF 
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
module DFF(
	clk_in,
	Din,
	Qout,
	rst
    );
	 
input clk_in;
input Din;
input rst;

output Qout;
reg Qout;

always @(posedge clk_in or negedge rst)begin
	if(!rst)begin
		Qout=Din;
	end else begin
		Qout=1'b0;
	end
end
endmodule
