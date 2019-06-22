`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:53 04/04/2019 
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
	led,
	pushbtn,
	PS2_CLK,
	PS2_DAT	
    );
	 
input clk,pushbtn;
output [7:0] led;
inout PS2_CLK,PS2_DAT;

wire Locked,CLK0,rx_complete,rx_en,data_sent,trig_send;
wire [7:0] cmd_to_be_sent,received_data;
reg  data_sent_trig,rx_complete_in;

clkgen SYS_CLK (
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );
	 
MOUSE_FSM_CMD FSM_TEST(
	.clk(CLK0),
	.reset(!pushbtn),
	.trig_send(trig_send),
	.cmd_to_send(cmd_to_be_sent),
	.cmd_sent(data_sent),
	.rx_en(rx_en),
	.byte_ready(rx_complete),
	.received_byte(received_data),
	.debug_curr_state(),
	.debug_rx_buf(led),
	.error_codes(error_codes)
	);
	
stage2 S2(
	.clk(CLK0),
	.locked(Locked),
	.trig_send(trig_send),
	.data_to_send(cmd_to_be_sent),
	.data_sent(data_sent),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.line_idle(),
	.debug()
    );
	 
RX_V2 V2(
	.clk(CLK0),
	.Locked(Locked),
	.rx_en(rx_en),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.rx_complete(rx_complete),
	.received_data(received_data),
	.ByteErrorCode(error_codes)
   );

//assign CLK_MOUSE_IN = PS2_CLK;
//assign DATA_MOUSE_IN = PS2_DAT;


endmodule
