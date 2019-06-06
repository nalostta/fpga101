`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:30 05/30/2019 
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
	clocklink,
	datalink,
	led,
	pushbtn,
	debug_tx,
	debug_rx
    );
	 
input clk,pushbtn;
input [7:0] switch;
output[7:0] led;
//output datadisp,DigCh,Red,Green,Blue;

/*output f_edge,r_edge;*/
output [3:0]	debug_tx,debug_rx;

inout [1:0] clocklink,datalink;

wire Locked,CLK0,received_cmd_en,send_cmd;
wire[3:0] debug_tx,debug_rx;
wire [7:0] received_cmd;

reg [7:0] led;
//assign led=received_cmd;//{debug_rx,debug_tx};

ckgen instance_name (
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );

/*debouncer deb1(
	.clk(CLK0),
	.Locked(Locked),
	.trig_in(!pushbtn),
	.trig_out(send_cmd)
    );*/
	 
MouseTransmitter CMD_OUT(
    .RESET(!Locked), 
    .CLK(CLK0), 
    .PS2CLK(clocklink[0]), 
    .PS2DATA(clocklink[1]), 
    .SEND_BYTE(!pushbtn), 
    .BYTE_TO_SEND(switch), 
    .BYTE_SENT()
    );
	 
bfm_ps2_command_in CMD_IN(
	.clk(CLK0),
	.reset(Locked),
	.ps2_data(datalink[1]),
	.ps2_clock(clocklink[1]),
	.received_cmd(received_cmd),
	.received_cmd_en(received_cmd_en),
	.debug_rx(debug_rx)
    );
	 
always @(posedge CLK0)
if(received_cmd_en)led<=received_cmd;
else if(Locked)led<=led;
else led<=0;

endmodule
