`timescale 1ns / 1ps
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

reg clk_in,pushbtn;
wire datalink,clocklink;
reg[7:0] datain;
wire[7:0] dataout;
wire txmatch0,txmatch1,en;

main DUT(
		.clk(clk_in),
		.switch(datain),
		.led(dataout),
		.datalink({datalink,clocklink,datalink,clocklink}),
		.pushbtn(pushbtn),
		.en(en)
    );
	
always #20 clk_in = ~clk_in; 

initial begin
pushbtn =	1'b0;
clk_in = 1'b1;
datain = 8'h0f;
#1600 pushbtn =	1'b1;
#1600 pushbtn =	1'b0;
#18000000 
datain = 8'b10011001;
#1600 pushbtn =	1'b1;
#1600 pushbtn =	1'b0;
#18000000 
$finish;
end
endmodule
