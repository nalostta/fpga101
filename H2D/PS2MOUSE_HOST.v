`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:00 05/30/2019 
// Design Name: 
// Module Name:    PS2MOUSE_HOST 
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
module PS2MOUSE_HOST(
	clk,
	reset,
	ps2clock,
	ps2data,
	data_to_send,
	data_sent,
	trig_send,
	line_idle,
	debug_tx,
	f_edge,
	r_edge
    );

input clk,reset,trig_send;
input	[7:0]	data_to_send;
output data_sent,line_idle,f_edge,r_edge;
output [3:0] debug_tx;
inout ps2clock,ps2data;

reg ps2clk_en,ps2clk_out,ps2data_en,ps2data_out,holdclk_en,line_idle,data_sent,ps2clk_in,ps2data_in;
reg [3:0]	curr_state,next_state;
reg [11:0]	hold_count;

localparam	IDLE			=	4'h0,
				HOLD_CLK		=	4'h1,
				START_BIT1	=	4'h2,
				START_BIT2	=	4'h3,
				DATA0			=	4'h4,
				DATA1			=	4'h5,
				DATA2			=	4'h6,
				DATA3			=	4'h7,
				DATA4			=	4'h8,
				DATA5			=	4'h9,
				DATA6			=	4'hA,
				DATA7			=	4'hB,
				PARITY		=	4'hC,
				STOP			=	4'hD,
				WAIT_FOR_ACK=	4'hE,	
				TX_END		=	4'hF;

assign ps2clock = ps2clk_en?	ps2clk_out:1'bz;
assign ps2data = ps2data_en?	ps2data_out:1'bz;

assign parity = data_to_send[0]^data_to_send[1]^data_to_send[2]^data_to_send[3]^data_to_send[4]^data_to_send[5]^data_to_send[6]^data_to_send[7]^1'b1;

//-----------------debug code--------------------
assign debug_tx = next_state;
//-----------------debug code--------------------


//--------------------clk edges------------------
always @(posedge clk or negedge reset)
begin
	if(!reset)
	begin
		ps2clk_in<=0;
		ps2data_in<=0;
	end else begin
		ps2clk_in<=ps2clock;
		ps2data_in<=ps2data;
	end
end


assign posedge_ps2clk = ps2clock & ~ps2clk_in;
assign negedge_ps2clk = ~ps2clock & ps2clk_in;
assign f_edge = negedge_ps2clk;
assign r_edge = posedge_ps2clk;
//-----------------------------------------------

//---------------hold clock logic----------------
assign elapsed_100us = hold_count==12'd2501;

always @(posedge clk)
begin
	if(!holdclk_en) hold_count<=0;
	else if(hold_count==12'd2501)hold_count<=hold_count;
	else hold_count<=hold_count+1'b1;
end
//-----------------------------------------------


//-----------state machine sequential------------
always @(posedge clk or negedge reset)
if(!reset)curr_state<=IDLE;
else curr_state<=next_state;
	
//-----------------------------------------------

//----------state machine combinational----------
always @(*)
begin
	//default values
	holdclk_en=1'b0;
	ps2clk_en=1'b0;
	ps2data_en=1'b0;
	ps2data_out=1'b1;
	ps2clk_out=1'b1;
	line_idle=1'b0;
	data_sent=1'b0;
	
	case(curr_state)
		IDLE:
		begin
		ps2clk_en=1'b0;
		line_idle=1'b1;
		if(trig_send)next_state=HOLD_CLK;
		else next_state=IDLE;
		end
		
		HOLD_CLK:
		begin
			ps2clk_out=1'b0;
			ps2clk_en=1'b1;
			holdclk_en=1'b1;
			if(elapsed_100us)next_state=START_BIT1;
			else next_state=HOLD_CLK;
		end
		
		START_BIT1:
		begin
			ps2clk_en=1'b0;
			ps2data_out=1'b0;
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=START_BIT2;
			else next_state=START_BIT1;
		end
		
		START_BIT2:
		begin
			ps2data_out=1'b0;
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA0;
			else next_state=START_BIT2;
		end
		
		DATA0:
		begin
			ps2data_out=data_to_send[0];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA1;
			else next_state=DATA0;
		end
		
		DATA1:
		begin
			ps2data_out=data_to_send[1];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA2;
			else next_state=DATA1;
		end
		
		DATA2:
		begin
			ps2data_out=data_to_send[2];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA3;
			else next_state=DATA2;
		end
		
		DATA3:
		begin
			ps2data_out=data_to_send[3];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA4;
			else next_state=DATA3;
		end
		
		DATA4:
		begin
			ps2data_out=data_to_send[4];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA5;
			else next_state=DATA4;
		end
		
		DATA5:
		begin
			ps2data_out=data_to_send[5];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA6;
			else next_state=DATA5;
		end
		
		DATA6:
		begin
			ps2data_out=data_to_send[6];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=DATA7;
			else next_state=DATA6;
		end
		
		DATA7:
		begin
			ps2data_out=data_to_send[7];
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=PARITY;
			else next_state=DATA7;
		end
		
		PARITY:
		begin
			ps2data_out=parity;
			ps2data_en=1'b1;
			if(posedge_ps2clk)next_state=STOP;
			else next_state=PARITY;
		end
		
		STOP:
		begin
			ps2data_out=1'b1;
			ps2data_en=1'b1;
			if(negedge_ps2clk)next_state=WAIT_FOR_ACK;
			else next_state=STOP;
		end
		
		WAIT_FOR_ACK:
		begin
			ps2data_en=1'b0;
			ps2clk_en=1'b0;
			if(posedge_ps2clk && !ps2data_in)next_state=TX_END;
			else next_state=WAIT_FOR_ACK;
		end
		
		TX_END:
		begin
			data_sent=1'b1;
			next_state=TX_END;
			
		end
		
	default : next_state=IDLE;
	endcase
end
//-----------------------------------------------
endmodule
