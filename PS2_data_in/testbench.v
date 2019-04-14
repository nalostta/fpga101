`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:13 04/11/2019 
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

/* 
reset - S7
rx_en - S1
hold_data	- S0
rx_complete	-	L0
ps2clk		-	DL0
ps2data		-	DL1
*/

reg clk_in,HoldData,rx_en,_PS2CLK,_PS2DATA;
wire PS2CLK,PS2DATA;
wire RX_complete;
wire[3:0] state;

assign PS2CLK = _PS2CLK;
assign PS2DATA = _PS2DATA;

main DUT(
		.clk(clk_in),
		.switch({6'b0,rx_en,HoldData}),
		.led({RX_complete}),
		.datalink({PS2DATA,PS2CLK}),
		.state(state)
    );
	
always #1 clk_in = ~clk_in; 

always #50 _PS2CLK = ~_PS2CLK; 
	
initial begin
clk_in = 1'b1;
rx_en = 1'b1;
HoldData = 1'b1;
_PS2DATA = 1'b0;
_PS2CLK = 1'b0;
#10000 HoldData = 1'b0;
//$monitor("%d",RX_complete);
end
endmodule
