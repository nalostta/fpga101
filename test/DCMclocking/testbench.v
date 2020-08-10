`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:31 01/17/2019 
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

reg clk_in;
reg rst;

wire clk0,clkdiv2,clkmult2,Locked;

dcm_clocking inst(
    .clkin(clk_in),
	 .reset(rst),
    .clk_0(clk0),
    .clk_div2(clkdiv2),
    .clk_mult2(clkmult2),
    .locked(Locked)
    );
	 
always #20 clk_in=~clk_in;

initial begin
	rst=1'b0;
	clk_in=1'b1;
	#10000 $finish;
end
endmodule
