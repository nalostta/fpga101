`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:19:17 07/15/2019 
// Design Name: 
// Module Name:    PS2MouseReceiver 
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
module PS2MouseReceiver(
	clk,
	Locked,
	rx_en,
	ps2clk,
	ps2data,
	rx_complete,
	received_data,
	ByteErrorCode,
	debug_curr_state,
	debug_next_state,
	debug_negedge,
	debug_bitcount
   );

input clk,Locked,rx_en;
input ps2clk,ps2data;
output rx_complete;
output [7:0]	received_data;
output [1:0]	ByteErrorCode;
output [2:0]	debug_curr_state,debug_next_state;
output			debug_negedge;
output [3:0]	debug_bitcount;

reg ps2clk_in,ps2data_in,ps2data_q;
reg curr_rx_complete,next_rx_complete;
reg [2:0]	curr_state,next_state;
reg [15:0]	curr_timeoutcount,next_timeoutcount;
reg [7:0]	curr_rxbuf,next_rxbuf;
reg [1:0]	curr_errorcode,next_errorcode;
reg [3:0]	curr_bitcount,next_bitcount;

assign negedge_ps2_clk	=	~ps2clk & ps2clk_in;
assign debug_negedge = negedge_ps2_clk;
assign rx_complete		=	curr_rx_complete;
assign received_data		=	curr_rxbuf;
assign ByteErrorCode		=	curr_errorcode;
assign debug_curr_state	=	curr_state;
assign debug_next_state	=	next_state;
assign debug_bitcount	=	curr_bitcount;

always @(posedge clk)
if(Locked)
begin
	curr_state<=next_state;
	curr_timeoutcount<=next_timeoutcount;
	ps2clk_in<=ps2clk;
	ps2data_q<=ps2data;
	ps2data_in<=ps2data_q;
	curr_rx_complete<=next_rx_complete;
	curr_rxbuf<=next_rxbuf;
	curr_errorcode<=next_errorcode;
	curr_bitcount<=next_bitcount;
end else begin
	curr_state<=0;
	curr_timeoutcount<=0;
	ps2clk_in<=0;
	ps2data_in<=0;
	ps2data_q<=0;
	curr_rx_complete<=0;
	curr_rxbuf<=0;
	curr_errorcode<=0;
	curr_bitcount<=0;
end

always @(*)
begin
	next_timeoutcount=curr_timeoutcount+1'b1;
	next_state=curr_state;
	next_rx_complete=1'b0;
	next_rxbuf=curr_rxbuf;
	next_errorcode=curr_errorcode;
	next_bitcount=curr_bitcount;
	
	case(curr_state)
		0:
		begin
			if(rx_en && negedge_ps2_clk && !ps2data_in)
			begin
				next_state=1;
				next_errorcode=2'b0;
			end
			next_bitcount=0;
		end
		
		1:
		begin
			if(curr_timeoutcount==50000)
			begin
				next_state=0;
			end else if(curr_bitcount==8)
			begin
				next_bitcount=0;
				next_state=2;
			end else if(negedge_ps2_clk)
			begin
				next_rxbuf[6:0]=curr_rxbuf[7:1];
				next_rxbuf[7]=ps2data_in;
				next_bitcount=curr_bitcount+1'b1;
				next_timeoutcount=0;
			end
		end
		
		2:
		begin
			if(curr_timeoutcount == 50000)next_state=0;
			else if(negedge_ps2_clk)
			begin
				if(ps2data_in != ~^curr_rxbuf[7:0])next_errorcode[0]=1'b1;
				
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
				if (ps2data_in)next_errorcode[1]= 1'b0;
				else	next_errorcode[1]= 1'b1;
				next_state = 4;
				next_timeoutcount=0;
			end
		end
		
		4:
		begin
			next_rx_complete=1'b1;
			next_state=0;
		end
		
		default:begin
			next_timeoutcount=0;
			next_state=0;
			next_rx_complete=1'b0;
			next_rxbuf=0;
			next_errorcode=0;
			next_bitcount=0;
		end
	endcase
end
endmodule

