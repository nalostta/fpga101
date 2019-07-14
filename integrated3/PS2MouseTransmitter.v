`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:28 07/15/2019 
// Design Name: 
// Module Name:    PS2MouseTransmitter 
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
module PS2MouseTransmitter(
	clk,
	locked,
	trig_send,
	data_to_send,
	data_sent,
	ps2clk,
	ps2data,
	line_idle,
	debug,
	curr_ps2data_en,
	curr_ps2clk_en,
	curr_dout
    );
	 
input clk,locked,trig_send;
output line_idle,data_sent,curr_ps2clk_en,curr_ps2data_en,curr_dout;
input	[7:0]	data_to_send;
output	[3:0]	debug;
input ps2clk,ps2data;

reg [11:0] hold_count;

reg [7:0] curr_data_to_send,next_data_to_send;
reg [3:0] curr_state,next_state;
reg curr_hold_ps2clk_en,next_hold_ps2clk_en;
reg curr_ps2data_en,next_ps2data_en;
reg curr_dout,next_dout;
reg curr_ps2clk_en,next_ps2clk_en;
reg curr_data_sent,next_data_sent;

reg line_idle;
reg ps2data_in;
reg ps2clk_in;

localparam 	IDLE				=	4'h0,
				HOLD_CLK			=	4'h1,
				START_BIT		=	4'h2,
				DATA0				=	4'h3,
				DATA1				=	4'h4,
				DATA2				=	4'h5,
				DATA3				=	4'h6,
				DATA4				=	4'h7,
				DATA5				=	4'h8,
				DATA6				=	4'h9,
				DATA7				=	4'hA,
				PARITY			=	4'hB,
				STOP				=	4'hC,
				ACK_DATA_LOW	=	4'hD,
				ACK_CLK_LOW		=	4'hE,
				TX_END			=	4'hF;

assign ps2clk_in_q=ps2clk;
assign ps2data_in_q=ps2data;
//assign ps2clk 	= 	curr_ps2clk_en?	1'b0:1'bz;
//assign ps2data	=	curr_ps2data_en?	curr_dout:1'bz;

always @(posedge clk)
if(locked)
begin
	curr_state<=next_state;
	curr_dout<=next_dout;
	curr_ps2clk_en<=next_ps2clk_en;
	curr_hold_ps2clk_en<=next_hold_ps2clk_en;
	curr_ps2data_en<=next_ps2data_en;
	curr_data_to_send<=next_data_to_send;
	curr_data_sent<=next_data_sent;
end else begin
	curr_state<=0;
	curr_dout<=0;
	curr_ps2clk_en<=0;
	curr_hold_ps2clk_en<=0;
	curr_ps2data_en<=0;
	curr_data_to_send<=0;
	curr_data_sent<=0;
end

assign debug=curr_state;
assign data_sent=curr_data_sent;

always @(posedge clk)
if(locked)begin
	ps2clk_in	<=	ps2clk_in_q;
	ps2data_in	<=	ps2data_in_q;
end else begin
	ps2clk_in	<=	1'b0;
	ps2data_in	<=	1'b0;
end

assign negedge_ps2_clk	=		~ps2clk_in_q & ps2clk_in;
assign posedge_ps2_clk	=		ps2clk_in_q & ~ps2clk_in;

always @(posedge clk)
if(curr_hold_ps2clk_en==1'b0)hold_count<=0;
else if(hold_count==2501)hold_count<=hold_count;
else hold_count<=hold_count+1'b1;

assign elapsed_100us=hold_count==2501;

always @(*)
begin
	next_hold_ps2clk_en=1'b0;
	next_ps2clk_en=1'b0;
	next_ps2data_en=1'b0;
	next_dout=curr_dout;
	line_idle=1'b0;
	next_data_sent=1'b0;
	next_data_to_send=curr_data_to_send;
	next_state=curr_state;
	
	case(curr_state)
	IDLE:
	begin
		next_ps2data_en=1'b0;
		next_ps2clk_en=1'b0;
		line_idle=1'b1;
		if(trig_send)begin
			next_state=HOLD_CLK;
			next_data_to_send=data_to_send;
		end else next_state=IDLE;
	end
	
	HOLD_CLK:
	begin
		next_hold_ps2clk_en=1'b1;
		next_ps2clk_en=1'b1;
		if(elapsed_100us)next_state=START_BIT;
		else next_state=HOLD_CLK;
	end
	
	START_BIT:
	begin
		//release clk and pull down data line for start bit
		next_ps2data_en=1'b1;
		next_dout=1'b0;
		if(negedge_ps2_clk)next_state=DATA0;
		else next_state=START_BIT;
	end
	
	DATA0:
		begin
			next_dout=data_to_send[0];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=DATA1;
			else next_state=DATA0;
		end
		
		DATA1:
		begin
			next_dout=data_to_send[1];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=DATA2;
			else next_state=DATA1;
		end
		
		DATA2:
		begin
			next_dout=data_to_send[2];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=DATA3;
			else next_state=DATA2;
		end
		
		DATA3:
		begin
			next_dout=data_to_send[3];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=DATA4;
			else next_state=DATA3;
		end
		
		DATA4:
		begin
			next_dout=data_to_send[4];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=DATA5;
			else next_state=DATA4;
		end
		
		DATA5:
		begin
			next_dout=data_to_send[5];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=DATA6;
			else next_state=DATA5;
		end
		
		DATA6:
		begin
			next_dout=data_to_send[6];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=DATA7;
			else next_state=DATA6;
		end
		
		DATA7:
		begin
			next_dout=data_to_send[7];
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=PARITY;
			else next_state=DATA7;
		end
		
		PARITY:
		begin
			next_dout=~^curr_data_to_send[7:0];
			next_ps2data_en=1'b1;
			if(posedge_ps2_clk)next_state=STOP;
			else next_state=PARITY;
		end
		
		STOP:
		begin
			next_dout=1'b1;
			next_ps2data_en=1'b1;
			if(negedge_ps2_clk)next_state=ACK_DATA_LOW;
			else next_state=STOP;
		end
		
		ACK_DATA_LOW:
		begin
			if(!ps2data_in)next_state=ACK_CLK_LOW;
			else next_state=ACK_DATA_LOW;
		end
		
		ACK_CLK_LOW:
		begin
			if(!ps2clk_in)next_state=TX_END;
			else next_state=ACK_CLK_LOW;
		end
		
		TX_END:
		begin
			next_ps2data_en=1'b0;
			next_ps2clk_en=1'b0;
			next_data_sent=1'b1;
			if(ps2clk_in&&ps2data_in)next_state=IDLE;
			else next_state=TX_END;
		end
		
	endcase
end
endmodule

