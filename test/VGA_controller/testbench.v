`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:13:49 01/27/2019 
// Design Name: 
// Module Name:    testbench 
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
module testbench(
    );

//tb_inputs:
reg clk_in;
reg LOCKED;
//tb_outputs:
wire[1:0] blue;
wire[2:0] green;
wire[2:0] red;
wire HSYNC;
wire VSYNC;
/*
wire[9:0] H_counter;
wire[9:0] V_counter;*/


main inst1(
		.clk(clk_in),
		.Hsync(HSYNC),
		.Vsync(VSYNC),
		.Red(red),
		.Green(green),
		.Blue(blue)
    );
	 
always #20 clk_in=~clk_in;

initial begin
	clk_in=1'b1;
	LOCKED=1'b0;
	#40 LOCKED=1'b1;
	$monitor("[%0t] VSYNC=<%b>",$time,VSYNC);
	#100000000 $finish;
end
endmodule
