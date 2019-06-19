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
		datalink,
		clocklink
		);

input[7:0]	switch;
input	pushbtn;
input 		clk;
output[7:0]	led;
inout	datalink,clocklink;

wire[7:0] received_cmd;
wire Locked,received_cmd_en,send_cmd;
wire[3:0] debug_tx,debug_rx;

assign led[1:0] = {clocklink,datalink};//{debug_rx,debug_tx};
assign led[7:3]	=	0;

clkgen ClkGen_1(
		 .CLKIN_IN(clk), 
		 .RST_IN(1'b0), 
		 .CLKFX_OUT(), 
		 .CLKIN_IBUFG_OUT(), 
		 .CLK0_OUT(CLK0), 
		 .LOCKED_OUT(Locked)
    );

fsm_cmd_out CMDOUT(
		.clk(CLK0),
		.reset(Locked),
		.the_command(switch),
		.send_command(!pushbtn),
		.ps2_clk(clocklink),
		.ps2_data(datalink),
		.command_was_sent(led[2]),
		.error_comm_timed_out(),
		.debug(),
		.pushbtn()
    );

/*
debouncer pushbtn_0(
		.clk(CLK0),
		.pushbtn(!pushbtn),
		.trigger_out(send_cmd)
    );*/

endmodule

