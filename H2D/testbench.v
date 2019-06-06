`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:32 05/31/2019 
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
	 
reg [7:0] switch;
reg clk,pushbtn;

wire clklink,datalink;//,f_edge,r_edge;
wire [7:0] led;
//wire [3:0] debug_tx;//debug_rx,
	 
main DUT(
	.clk(clk),
	.switch(switch),
	.clocklink({clklink,clklink}),
	.datalink({datalink,datalink}),
	.led(led),
	.pushbtn(pushbtn),
	.debug_tx(),
	.debug_rx()
    );
	 
always #20 clk=!clk;

pullup(datalink);
pullup(clklink);

initial begin
	clk=1'b1;
	pushbtn=1'b1;
	switch=8'hf4;
	#10000 pushbtn=1'b0;
	#1000 pushbtn=1'b1;
	#990000 $stop;
end
endmodule
