`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:34 04/05/2019 
// Design Name: 
// Module Name:    PS2_data_out 
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
`timescale 1ns / 1ps

module bfm_ps2_data_out(
	clk,
	reset,
	ps2_data,
	ps2_clock,
	data_to_be_sent
    );

input clk, reset;
inout ps2_data, ps2_clock;

reg ps2_data_en, ps2_clock_en, ps2_data_out;
wire ps2_data_in;
wire ps2_clock_in, ps2_clock_out;
wire ps2_clk_sig;
reg [15:0] clk_counter;
reg start_xmit_temp, start_xmit_temp_q, ps2_clk_sig_q;
wire start_xmit;

input [7:0] data_to_be_sent;

reg [3:0] curr_state, next_state;

assign ps2_data_in = ps2_data;
assign ps2_data = ps2_data_en ? ps2_data_out : 1'bz;

assign ps2_clock_in = ps2_clock;
assign ps2_clock = ps2_clock_en ? ps2_clock_out : 1'bz;

assign ps2_clock_out = ps2_clk_sig_q;

always @(posedge clk or negedge reset)
	if (~reset) clk_counter <= 16'b0;
	else clk_counter <= clk_counter + 1;

always @(posedge clk or negedge reset)
	if (~reset) start_xmit_temp <= 1'b0;
	else start_xmit_temp <= start_xmit_temp ? 1'b1 : clk_counter[15];

always @(posedge clk or negedge reset)
	if (~reset) start_xmit_temp_q <= 1'b0;
	else start_xmit_temp_q <= start_xmit_temp;

assign start_xmit = start_xmit_temp & ~start_xmit_temp_q;

assign ps2_clk_sig = clk_counter[10];

always @(posedge clk or negedge reset)
	if (~reset) ps2_clk_sig_q <= 1'b0;
	else ps2_clk_sig_q <= ps2_clk_sig;

assign negedge_ps2_clk_sig = ~ps2_clk_sig & ps2_clk_sig_q;

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
				STOP   	= 4'hB;

always @(posedge clk or negedge reset)
	if (~reset) curr_state <= IDLE;
	else curr_state <= next_state;
		
always @(curr_state, negedge_ps2_clk_sig, start_xmit)
begin
	next_state = IDLE;
	case (curr_state)
	IDLE:
		begin
			ps2_data_en = 1'b0;
			ps2_clock_en = 1'b0;	
			if (start_xmit) 
			begin
				next_state = START;
				ps2_data_en = 1'b1;
				ps2_data_out = 1'b0;
			end
			else next_state = IDLE;
		end
	START:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = 1'b0;
			if (negedge_ps2_clk_sig) next_state = DATA0;
			else next_state = START;
		end
	DATA0:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[0];
			if (negedge_ps2_clk_sig) next_state = DATA1;
			else next_state = DATA0;
		end
	DATA1:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[1];
			if (negedge_ps2_clk_sig) next_state = DATA2;
			else next_state = DATA1;
		end
	DATA2:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[2];
			if (negedge_ps2_clk_sig) next_state = DATA3;
			else next_state = DATA2;
		end
	DATA3:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[3];
			if (negedge_ps2_clk_sig) next_state = DATA4;
			else next_state = DATA3;
		end
	DATA4:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[4];
			if (negedge_ps2_clk_sig) next_state = DATA5;
			else next_state = DATA4;
		end
	DATA5:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[5];
			if (negedge_ps2_clk_sig) next_state = DATA6;
			else next_state = DATA5;
		end
	DATA6:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[6];
			if (negedge_ps2_clk_sig) next_state = DATA7;
			else next_state = DATA6;
		end
	DATA7:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[7];
			if (negedge_ps2_clk_sig) next_state = PARITY;
			else next_state = DATA7;
		end
	PARITY:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = data_to_be_sent[0] ^ data_to_be_sent[1] ^ data_to_be_sent[2] ^ data_to_be_sent[3] ^ data_to_be_sent[4] ^ data_to_be_sent[5] ^ data_to_be_sent[6] ^ data_to_be_sent[7] ^ 1'b1;; 
			if (negedge_ps2_clk_sig) next_state = STOP;
			else next_state = PARITY;
		end
	STOP:
		begin
			ps2_data_en = 1'b1;
			ps2_clock_en = 1'b1;	
			ps2_data_out = 1'b1;
			if (negedge_ps2_clk_sig) next_state = IDLE;
			else next_state = STOP;
		end
	default:
		begin
			next_state = IDLE;
		end
	endcase
end

endmodule

