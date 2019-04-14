`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:55 04/12/2019 
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
		reset,
		op
    );
	 
input clk,reset;
output op;

reg[15:0] clk_counter;
reg op;

always @(posedge clk or negedge reset)
	if (~reset) clk_counter <= 16'b0;
	else clk_counter <= clk_counter + 1;

always @(posedge clk or negedge reset)
	if (~reset) op <= 1'b0;
	else op <= op ? 1'b1 : clk_counter[15];
	
endmodule
