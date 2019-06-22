`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:22 06/15/2019 
// Design Name: 
// Module Name:    RX_stage1 
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
module RX_stage1(
	clk,
	Locked,
	rx_en,
	ps2clk,
	ps2data,
	rx_complete,
	received_data,
	ByteErrorCode,
	debug
   );

input clk,rx_en,Locked;
input ps2clk,ps2data;
output rx_complete;
output [7:0] received_data;
output [12:0] debug;
output [1:0] ByteErrorCode;

reg [7:0] rx_buf,temp_buf;
reg curr_rx_complete,next_rx_complete;
reg curr_state,next_state;
reg ps2clk_in,ps2data_in;
reg curr_parity,next_parity;
reg [3:0] curr_bitcount,next_bitcount;
reg [1:0] curr_error_code,next_error_code;
reg [20:0] curr_timeoutcount,next_timeoutcount;

localparam	IDLE			=	4'h0,
				RX_DATA		=	4'h1,
				RX_PARITY	=	4'h2,
				RX_STOP		=	4'h3,
				RX_END		=	4'h4;
				
assign negedge_ps2_clk = ps2clk_in & ~ps2clk;
assign ByteErrorCode	=	curr_error_code;
assign debug = {curr_state,next_state,curr_bitcount,negedge_ps2_clk};
assign received_data	=	rx_buf;
assign rx_complete = curr_rx_complete;

always @(posedge clk)
if(Locked)begin
	ps2clk_in<=ps2clk;
	ps2data_in<=ps2data;
	curr_state<=next_state;
	rx_buf<=temp_buf;
	curr_rx_complete<=next_rx_complete;
	curr_bitcount<=next_bitcount;
	curr_parity<=next_parity;
	curr_error_code<=next_error_code;
	curr_timeoutcount<=next_timeoutcount;
end else begin
	ps2clk_in<=0;
	ps2data_in<=0;
	curr_state<=0;
	rx_buf<=0;
	curr_rx_complete<=0;
	curr_bitcount<=0;
	curr_parity<=0;
	curr_error_code<=0;
	curr_timeoutcount<=0;
end

always @(*)
begin
	temp_buf=rx_buf;
	next_bitcount=curr_bitcount;
	next_rx_complete=0;
	next_state=0;
	next_error_code=curr_error_code;
	next_timeoutcount=curr_timeoutcount+1'b1;
		
	case(curr_state)
		
		0:
		begin
			if(rx_en)next_state=1;
			else next_state=0;
		end
		
		1:
		begin
			next_state=1;
		end
		
	endcase
end
endmodule

/*
0:
		begin
			next_bitcount=0;
			next_error_code=2'b0;
			if(rx_en && negedge_ps2_clk && !ps2data_in)next_state=1;
			else next_state=0;
		end
		
		1:
		begin
			if(curr_timeoutcount==50000)next_state=0;
			else if(curr_bitcount==8)
			begin
				next_bitcount=0;
				next_state=2;
			end else if(negedge_ps2_clk)
			begin
				next_bitcount=curr_bitcount+1'b1;
				next_timeoutcount=0;
				temp_buf[6:0]=rx_buf[7:1];
				temp_buf[7]=ps2data_in;
			end
		end
		
		2:
		begin
			if(curr_timeoutcount == 50000)next_state=0;
			else if(negedge_ps2_clk)
			begin
				if(ps2data_in != ~^rx_buf[7:0])next_error_code[0]=1'b1;
				
				next_bitcount=0;
				next_state=3;
				next_timeoutcount=0;
			end
		end
		
		3: 
		begin
			if(curr_timeoutcount == 100000)next_state=0;
			else if(negedge_ps2_clk) 
			begin
				if (ps2data_in)next_error_code[1]= 1'b0;
				else	next_error_code[1]= 1'b1;
				next_state = 4;
				next_timeoutcount=0;
			end
		end
		
		4:
		begin
			next_rx_complete=1'b1;
			next_state=0;
		end
*/
