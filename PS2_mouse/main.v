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

wire Locked,CLK0,rx_complete,rx_en,data_sent;
wire clear_trig,clear_rx_trig;
wire [7:0] received_data;
wire [7:0] debug;
reg  [7:0] rx_buf,next_buf;
reg  data_sent_trig,rx_complete_in;


//reg [7:0] led;
assign led = debug;
/*
always @(posedge CLK0)
if(Locked)rx_buf<=next_buf;
else rx_buf<=8'h55;

always @(*)
begin
	if(rx_complete)next_buf=received_data;
	else next_buf=rx_buf;
end

always @(posedge CLK0)
if(data_sent)data_sent_trig<=1'b1;
else if(clear_trig)data_sent_trig<=1'b0;
else	data_sent_trig<=data_sent_trig;

always @(posedge CLK0)
if(rx_complete)begin
	rx_complete_in<=1'b1;
	//led<=received_data;
end
else if(clear_rx_trig)begin
	rx_complete_in<=1'b0;
	//led<=0;
end
else	begin
	rx_complete_in<=rx_complete_in;
	
end

clkgen SYS_CLK (
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );
	 
MOUSE_FSM_CMD CMD_FSM(
	.clk(CLK0),
	.reset(!Locked),
	.enable_fsm(!pushbtn),
	.command_byte(cmd_to_be_sent),
	.trig_send(trig_send),
	.cmd_sent(data_sent_trig),
	.clear_trig(clear_trig),
	.rx_en(rx_en),
	.data_received(rx_complete_in),
	.clear_rx_trig(clear_rx_trig),
	.received_byte(received_data),
	.debug(debug)
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

RX_stage1 R1(
	.clk(CLK0),
	.Locked(Locked),
	.en(rx_en),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.rx_complete(rx_complete),
	.received_data(received_data),
	.debug()
   );*/

//assign CLK_MOUSE_IN = PS2_CLK;
//assign DATA_MOUSE_IN = PS2_DAT;


endmodule
