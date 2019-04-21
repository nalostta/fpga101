`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:15 04/04/2019 
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
		switch,
		led,
		pushbtn,
		RedLed,
		datalink
    );
	 
input clk,pushbtn;
input[7:0] switch;
output[7:0] led;
output RedLed;
inout[3:0] datalink;
assign RedLed=0;

wire CLK16,Locked;
//assign led[6:0]=0;
wire datalink;
wire clocklink;

CLK16Mhz clkgen(
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKFX_OUT(CLK16), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(), 
    .LOCKED_OUT(Locked)
    );
/*	 
DataOutModule1 sender(
			.clk(CLK16),
			.ps2clk(datalink[0]),
			.ps2data(datalink[1]),
			.data(switch),
			.Locked(Locked),
			.pushbtn(),
			.debug(RedLed)
		 );*/
		 
bfm_ps2_data_out sender(
		.clk(CLK16),
		.reset(pushbtn),
		.ps2_data(datalink[1]),
		.ps2_clock(datalink[0]),
		.data_to_be_sent(switch)
    );

ps2_data_in receive1(
		.clk(CLK16),
		.ps2clk(datalink[2]),
		.ps2data(datalink[3]),
		.data(led),
		.en(Locked)
    );
endmodule
