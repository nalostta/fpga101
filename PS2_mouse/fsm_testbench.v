`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:41:45 06/22/2019 
// Design Name: 
// Module Name:    fsm_testbench 
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
module fsm_testbench(
    );
	 
reg clk,reset;
reg [7:0] received_byte;
reg cmd_sent,byte_ready;
wire trig_send,rx_en;
wire [3:0]	debug_state;
wire [7:0]	command,rx_buf;

/*MOUSE_FSM_CMD test(
	.clk(clk),
	.reset(reset),
	.trig_send(trig_send),
	.cmd_to_send(command),
	.cmd_sent(cmd_sent),
	.rx_en(rx_en),
	.byte_ready(byte_ready),
	.received_byte(received_byte),
	.debug_curr_state(debug_state),
	.debug_rx_buf(rx_buf)
	);*/
	
always #20 clk=~clk;

initial begin
	clk=1'b1;
	reset=1'b0;
	cmd_sent=0;
	byte_ready=1'b0;
	received_byte=0;
	#900 cmd_sent=1'b1;
	#900 cmd_sent=0;
	received_byte=8'hFA;
	byte_ready=1'b1;
	#40
	received_byte=8'h00;
	byte_ready=1'b0;
	#5000 $stop;
end
endmodule
