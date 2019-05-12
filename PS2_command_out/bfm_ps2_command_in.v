`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:00:18 02/19/2016 
// Design Name: 
// Module Name:    bfm_ps2_command_in 
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
module bfm_ps2_command_in(
	clk,
	reset,
	ps2_data,
	ps2_clock,
	received_cmd,
	received_cmd_en,
	debug,
	pushbtn
    );

input clk, reset,pushbtn;
inout ps2_data, ps2_clock;
output [7:0] received_cmd;
output [3:0] debug;
output received_cmd_en;
reg [11:0] clk_pulldown_ctr;
reg [3:0] debug;

reg  ps2_data_en;
reg  ps2_clock_en;
reg  ps2_data_out;      
wire ps2_data_in;
wire ps2_clock_in;
wire ps2_clock_out;          
wire ps2_clk_sig;
reg [15:0] clk_counter;
wire clk_pulldown_100ms;
reg [3:0] curr_state, next_state;
reg ps2_clk_sig_q;
reg [7:0] received_cmd;
reg received_cmd_en;
reg received_parity;
assign ps2_data_in = ps2_data;
assign ps2_data = ps2_data_en ? ps2_data_out : 1'bz;

assign ps2_clock_in = ps2_clock;
assign ps2_clock = ps2_clock_en ? ps2_clock_out : 1'bz;

assign ps2_clock_out = ps2_clk_sig_q;

always @(posedge clk or negedge reset)
	if (~reset) clk_pulldown_ctr <= 12'b0;
	else if (ps2_clock_in == 1'b1) clk_pulldown_ctr <= 12'b0;
	else if (clk_pulldown_ctr == 12'h9C5) clk_pulldown_ctr <= clk_pulldown_ctr;
	else clk_pulldown_ctr <= clk_pulldown_ctr + 1;

assign clk_pulldown_100ms = clk_pulldown_ctr == 12'h9C5;

always @(posedge clk or negedge reset)
	if (~reset) clk_counter <= 16'b0;
	else clk_counter <= clk_counter + 1;

assign ps2_clk_sig = clk_counter[10];

always @(posedge clk or negedge reset)
	if (~reset) ps2_clk_sig_q <= 1'b0;
	else ps2_clk_sig_q <= ps2_clk_sig;

assign negedge_ps2_clk_sig = ~ps2_clk_sig & ps2_clk_sig_q;
assign posedge_ps2_clk_sig = ps2_clk_sig & ~ps2_clk_sig_q;

localparam	IDLE		= 4'h0,
				START		= 4'h1,
				DATA0		= 4'h2,
				DATA1		= 4'h3,
				DATA2		= 4'h4,
				DATA3		= 4'h5,
				DATA4		= 4'h6,
				DATA5		= 4'h7,
				DATA6		= 4'h8,
				DATA7		= 4'h9,
				PARITY	= 4'hA,
				STOP   	= 4'hB,
				ACK		= 4'hC,
				FINISH   = 4'hD,
				DEBUG		= 4'hE;

always @(posedge clk or negedge reset)
	if (~reset) curr_state <= IDLE;
	else curr_state <= next_state;
	
always @(posedge clk)debug<=curr_state;
		
always @(curr_state, negedge_ps2_clk_sig, posedge_ps2_clk_sig, clk_pulldown_100ms,ps2_data_in)
begin
	next_state = IDLE;
	ps2_data_en = 1'b0;
	ps2_clock_en = 1'b0;	
	ps2_data_out = 1'b0;
	case (curr_state)
	IDLE:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b0;	
			received_cmd = 8'b0;
			received_cmd_en = 1'b0;
			if (clk_pulldown_100ms && ~ps2_data_in) next_state = START;
			else next_state = IDLE;
		end
	START:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			if (posedge_ps2_clk_sig) next_state = DATA0;
			else next_state = START;
		end
	DATA0:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[0] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = DATA1;
			else next_state = DATA0;
		end
	DATA1:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[1] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = DATA2;
			else next_state = DATA1;
		end
	DATA2:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[2] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = DATA3;
			else next_state = DATA2;
		end
	DATA3:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[3] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = DATA4;
			else next_state = DATA3;
		end
	DATA4:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[4] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = DATA5;
			else next_state = DATA4;
		end
	DATA5:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[5] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = DATA6;
			else next_state = DATA5;
		end
	DATA6:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[6] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = DATA7;
			else next_state = DATA6;
		end
	DATA7:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_cmd[7] = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = PARITY;
			else next_state = DATA7;
		end
	PARITY:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			received_parity = ps2_data_in;
			if (posedge_ps2_clk_sig) next_state = STOP;
			else next_state = PARITY;
		end
	STOP:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b1;	
			if ((received_cmd[0] ^ received_cmd[1] ^ received_cmd[2] ^ received_cmd[3] ^ received_cmd[4] ^ received_cmd[5] ^ received_cmd[6] ^ received_cmd[7] ^ received_parity)		
					& ps2_data_in & negedge_ps2_clk_sig) next_state = ACK;
			else if (posedge_ps2_clk_sig) next_state = IDLE;
			else next_state = STOP;
		end
	ACK:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = 1'b0;
			received_cmd_en = 1'b1;
			if (negedge_ps2_clk_sig) next_state = FINISH;
			else next_state = ACK;
		end
	FINISH:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = 1'b0;
			received_cmd_en = 1'b0;
			if (negedge_ps2_clk_sig) next_state = IDLE;
			else next_state = DEBUG;
		end
		
	DEBUG:
		begin
			if(pushbtn)next_state=IDLE;
			else next_state=DEBUG;
		end
		
	default:
		begin
			next_state = IDLE;
		end
	endcase
end

				
endmodule
