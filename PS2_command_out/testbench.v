`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:06:28 05/12/2019 
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
	 
reg[7:0]	switch;
reg[1:0]	pushbtn;
reg		clk;

wire[7:0] led;
wire[3:0] debug_state_tx,debug_state_rx;
wire datalink,clklink;

main DUT(
		.clk(clk),
		.switch(switch),
		.pushbtn(pushbtn),
		.led(led),
		.datalink({datalink,clklink,datalink,clklink}),
		.debug_state_tx(debug_state_tx),
		.debug_state_rx(debug_state_rx)
		);
		
always #20 clk<=~clk;

pullup(clklink);
pullup(datalink);

initial begin
	clk<=1'b1;
	switch<=0;
	pushbtn<=2'b00;
	#5000
	switch<=8'b10100101;
	#5050 pushbtn<=2'b11;
	#5000 pushbtn<=2'b00;
	#1500000 $finish;
end
endmodule
