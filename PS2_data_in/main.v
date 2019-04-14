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
		datalink,
    );
	 
input clk;
input[7:0] switch;
output[7:0] led;
//output[3:0] state;
inout[3:0] datalink;

assign led[7:1]=7'b0;
wire CLK16;

ps2_data_in Receive1(
		.clk(CLK16),
		.reset(switch[7]),
		.start_receiving_data(switch[1]),
		.ps2_clk(datalink[0]),
		.ps2_data(datalink[1]),
		.hold_data(switch[0]),
		.rx_complete(led[0]),
		.state()
    );
	 
CLK16Mhz clkgen(
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKFX_OUT(CLK16), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0_OUT), 
    .LOCKED_OUT()
    );
	 
bfm_ps2_data_out given_module(
	.clk(CLK16),
	.reset(switch[6]),
	.ps2_data(datalink[3]),
	.ps2_clock(datalink[2]),
	.data_to_be_sent(8'b11100001)
    );

endmodule
