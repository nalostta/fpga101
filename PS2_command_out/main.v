`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:59 05/04/2019 
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
		pushbtn,
		led,
		datalink
    );

input[7:0]	switch;
input[1:0]	pushbtn;
input 		clk;
output[7:0]	led;
inout[3:0]	datalink;

wire[7:0] garbage,received_cmd;
wire CLK16,CLK0,Locked,received_cmd_en;
//reg[7:0] led;

clkgen ClkGen_1(
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKFX_OUT(CLK16), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );

fsm_cmd_out command_module(
		.clk(CLK0),						
		.reset(Locked),					
		.the_command(8'b10100101),			
		.send_command(!pushbtn[0]),	
		.ps2_clk(datalink[0]),
		.ps2_data(datalink[1]),
		.command_was_sent(),
		.error_comm_timed_out(),
		.debug({garbage[3:0],led[3:0]}),
		.pushbtn(!pushbtn[1])
    );
	 
bfm_ps2_command_in RX_module(
	.clk(CLK0),
	.reset(Locked),
	.ps2_data(datalink[3]),
	.ps2_clock(datalink[2]),
	.received_cmd(),
	.received_cmd_en(),
	.debug({garbage[7:4],led[7:4]})
    );
	 
endmodule
