`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:29 06/19/2019 
// Design Name: 
// Module Name:    MOUSE_FSM_CMD 
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
module MOUSE_FSM_CMD(
	clk,
	reset,
	enable_fsm,
	command_byte,
	trig_send,
	cmd_sent,
	clear_trig,
	rx_en,
	data_received,
	clear_rx_trig,
	received_byte,
	debug
	);
	
input clk,reset,enable_fsm;
input cmd_sent;
input data_received;
input clear_rx_trig;
input [7:0] received_byte;
output trig_send;
output rx_en;
output clear_trig;
output [7:0] command_byte;
output [7:0] debug;

reg [3:0] curr_state,next_state;
reg curr_trig_send,next_trig_send;
reg curr_rx_en,next_rx_en;
reg [7:0] rx_buffer,tx_buffer;
reg curr_clear_trig,next_clear_trig;
reg curr_clear_rx_trig,next_clear_rx_trig;

assign trig_send 		= 	curr_trig_send;
assign rx_en			=	curr_rx_en;
assign command_byte	=	tx_buffer;
assign debug			=	curr_state;
assign clear_trig		=	curr_clear_trig;

always @(posedge clk)
if(data_received)rx_buffer<=received_byte;
else if(reset)rx_buffer<=0;
else rx_buffer<=rx_buffer;

always @(posedge clk)
if(!reset)begin
	curr_state<=next_state;
	curr_trig_send<=next_trig_send;
	curr_rx_en<=next_rx_en;
	curr_clear_trig<=next_clear_trig;
	curr_clear_rx_trig<=next_clear_rx_trig;
end else begin
	curr_state<=0;
	curr_trig_send<=0;
	curr_rx_en<=0;
	curr_clear_trig<=0;
	curr_clear_rx_trig<=0;
end

always @(*)
begin
	next_state=curr_state;
	next_trig_send=1'b0;
	tx_buffer=0;
	next_clear_trig<=0;
	
	case(curr_state)
		0:begin
			if(enable_fsm)next_state=1;
		end
		
		1:begin
			tx_buffer=8'hFF;  //reset mouse
			next_trig_send=1'b1;
			if(cmd_sent)next_state=2;
		end
		
		2:begin
			next_clear_trig<=1;
			next_rx_en=1'b1;
			if(data_received)next_state=3;
		end
		
		3:begin
			next_clear_rx_trig=1'b0;
			next_state=0;
		end
	default : next_state=0;
	endcase
end
endmodule 
