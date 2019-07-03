`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:41 06/25/2019 
// Design Name: 
// Module Name:    MOUSE_FSM 
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
	trig_send,
	cmd_to_send,
	cmd_sent,
	rx_en,
	byte_ready,
	received_byte,
	error_codes,
	debug_curr_state,
	debug_rx_buf,
	XByte,
	YByte,
	ZByte,
	packet_complete
	);

input 			clk,reset,cmd_sent,byte_ready;
input		[7:0]	received_byte;
input		[1:0]	error_codes;
output 			trig_send,rx_en,packet_complete;
output 	[7:0] cmd_to_send,debug_rx_buf;
output	[3:0]	debug_curr_state;
output	[7:0]	XByte,YByte,ZByte;

reg 		[3:0]	curr_state,next_state;
reg				curr_trig_send,next_trig_send;
reg				curr_rx_en,next_rx_en;
reg				curr_packet_complete,next_packet_complete;
reg		[7:0]	curr_cmd_buf,next_cmd_buf;
reg		[7:0]	curr_rx_buf,next_rx_buf;
reg		[15:0]curr_wait_count,next_wait_count;
reg		[7:0]	next_Xbuf,curr_Xbuf;
reg		[7:0]	next_Ybuf,curr_Ybuf;
reg		[7:0]	next_Zbuf,curr_Zbuf;

assign	debug_curr_state	=	curr_state;
assign	cmd_to_send			=	curr_cmd_buf;
assign	rx_en					=	curr_rx_en;
assign	trig_send			=	curr_trig_send;
assign	debug_rx_buf		=	curr_Xbuf;
assign	XByte					=	curr_Xbuf;
assign	YByte					=	curr_Ybuf;
assign	ZByte					=	curr_Zbuf;
assign 	packet_complete	=	curr_packet_complete;

always @(posedge clk)
if(reset)
begin
	curr_state<=0;
	curr_trig_send<=0;
	curr_rx_en<=0;
	curr_cmd_buf<=0;
	curr_rx_buf<=0;
	curr_wait_count<=0;
	curr_Xbuf<=0;
	curr_Ybuf<=0;
	curr_Zbuf<=0;
	curr_packet_complete<=0;
end else begin
	curr_wait_count<=next_wait_count;
	curr_state<=next_state;
	curr_trig_send<=next_trig_send;
	curr_rx_en<=next_rx_en;
	curr_cmd_buf<=next_cmd_buf;
	curr_rx_buf<=next_rx_buf;
	curr_Xbuf<=next_Xbuf;
	curr_Ybuf<=next_Ybuf;
	curr_Zbuf<=next_Zbuf;
	curr_packet_complete<=next_packet_complete;
end

always @*
begin
	next_state=curr_state;
	next_cmd_buf=curr_cmd_buf;
	next_rx_buf=curr_rx_buf;
	next_trig_send=1'b0;
	next_rx_en=1'b0;
	next_wait_count=0;
	next_Xbuf=curr_Xbuf;
	next_Ybuf=curr_Ybuf;
	next_Zbuf=curr_Zbuf;
	next_packet_complete=1'b0;
	
	case(curr_state)
		0:
		begin
			next_wait_count=curr_wait_count+1'b1;
			if(curr_wait_count==60000)next_state=1;
		end
		
		1:
		begin
			next_cmd_buf=8'hFF;
			next_trig_send=1'b1;
			if(cmd_sent)next_state=2;
		end
		
		2:
		begin
			next_rx_en=1'b1;
			if(byte_ready)
			begin
				if(received_byte==8'hFA && error_codes==2'b00)
				begin
					next_state=3;
				end else next_state=0;
			end
		end
		
		3:
		begin
			next_rx_en=1'b1;
			if(byte_ready)
			begin
				if(received_byte==8'hAA && error_codes==2'b00)
				begin
					next_state=4;
				end else next_state=0;
			end
		end
		
		4:
		begin
			next_rx_en=1'b1;
			if(byte_ready)
			begin
				if(received_byte==8'h00 && error_codes==2'b00)
				begin
					next_state=5;
				end else next_state=0;
			end
		end
		
		5:
		begin
			next_cmd_buf=8'hF4;
			next_trig_send=1'b1;
			if(cmd_sent)next_state=6;
		end
		
		6:
		begin
			next_rx_en=1'b1;
			if(byte_ready)
			begin
				if(received_byte==8'hFA && error_codes==2'b00)
				begin
					next_state=7;
				end else next_state=5;
			end
		end
		
		7:
		begin
			next_rx_en=1'b1;
			if(byte_ready)
			begin
				if(error_codes==2'b00)next_Zbuf=received_byte;
				else next_state=0;
				next_state=8;
			end
		end
		
		8:
		begin
			next_rx_en=1'b1;
			if(byte_ready)
			begin
				if(error_codes==2'b00)next_Xbuf=received_byte;
				else next_state=0;
				next_state=9;
			end
		end
		
		9:
		begin
			next_rx_en=1'b1;
			if(byte_ready)
			begin
				if(error_codes==2'b00)next_Ybuf=received_byte;
				else next_state=0;
				next_state=7;
				next_packet_complete=1'b1;
			end
		end
		
		default:
		begin
			next_wait_count=0;
			next_state=0;
			next_trig_send=0;
			next_rx_en=0;
			next_cmd_buf=0;
			next_rx_buf=0;
			next_Xbuf=0;
			next_Ybuf=0;
			next_Zbuf=0;
			next_packet_complete=1'b0;
		end
	endcase
end

endmodule 
