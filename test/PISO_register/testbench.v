`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:13 01/15/2019 
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
reg [7:0] P_in;

//outputs
wire [7:0] led_out;

main inst(
    .switch(P_in),
    .led(led_out),
    .clk(clk_in),
    .push_btn(),
	 .rst(rst_in)
    );

//-------clk@25MHZ/40ns-------
always #20 clk_in=~clk_in; 
//----------clk---------------


initial begin
	$display("<begin>");
	clk_in=1'b0;
	rst_in=1'b1;
	P_in=8'b00000000;
	#20 
	rst_in=1'b0;
	P_in=8'b10010011;
	#340
	P_in=8'b00000000;
	#3660
	//simtime
	$display("<end>");
	$finish;
end
endmodule
