`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:30 01/16/2019 
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

//inputs
reg clk_in;
reg rst_in;
reg inp;
reg [6:0] no_inp;

//outputs
wire Output;
wire [2:0] State;
wire [3:0] floating;

main inst(
	.clk(clk_in),
	.switch({no_inp,inp}),
	.push_btn(),
	.led({State,floating,Output}),
	.rst(rst_in)
    );

//-------clk@25MHZ/40ns---------
always #20 clk_in=~clk_in;
//------------------------------

initial begin
	clk_in=1'b1;
	rst_in=1'b1;
	inp=1'b0;
	#80 $display("<start>");
	rst_in=1'b0;
	#89 inp=1'b1;
	#40 inp=1'b0;
	#40 inp=1'b1;
	#40 inp=1'b1;
	#40 inp=1'b0;
	#40 inp=1'b1;
	#40 inp=1'b0;
	#100 $finish;
end
endmodule
