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
	pushbtn
    );
	 
input clk,pushbtn;
input [7:0] switch;
output[7:0] led;

inout clocklink,datalink;

wire Locked,CLK0,received_cmd_en,send_cmd;
wire[3:0] debug_tx,debug_rx;
wire [7:0] received_cmd;

assign led[1:0] = {clocklink,datalink};
assign led[7:2]=0;

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
	 
PS2MOUSE_HOST CMD_OUT(
	.clk(CLK0),
	.reset(Locked),
	.ps2clock(clocklink),
	.ps2data(datalink),
	.data_to_send(8'hf4),
	.data_sent(),
	.trig_send(!pushbtn),
	.line_idle(),
	.debug_tx(),
	.f_edge(),
	.r_edge()
    );
/*	 
MouseTransmitter CMD_OUT(
    .RESET(!Locked), 
    .CLK(CLK0), 
    .PS2CLK(clocklink), 
    .PS2DATA(datalink), 
    .SEND_BYTE(!pushbtn), 
    .BYTE_TO_SEND(8'hF4), 
    .BYTE_SENT(),
	 .debug(debug_tx)
    );*/

//not working	
/*always @(posedge CLK0)
if(received_cmd_en)led<=received_cmd;
else if(Locked)led<=led;
else led<=8'hff;*/

endmodule
