`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:08 06/14/2019 
// Design Name: 
// Module Name:    stage1 
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
module stage1(
	clk,
	Locked,
	trig_send,
	ps2clk,
	ps2data,
	line_idle,
	hold_successful,
	debug,
	elapsed_100us
    );
	 
input clk,Locked,trig_send;
output line_idle,hold_successful,elapsed_100us;
output	[1:0]	debug;
inout ps2clk,ps2data;

reg [11:0] hold_count;
reg [1:0] curr_state,next_state;
reg hold_clk_en,data_en,dout,clk_en,line_idle,hold_successful,ps2data_in,ps2clk_in;

localparam 	IDLE				=	2'h0,
				HOLD_CLK			=	2'h1,
				DETECT			=	2'h2,
				HOLD_SUCCESSFUL=	2'h3;

assign ps2clk_in_q=ps2clk;
assign ps2data_in_q=ps2data;

assign ps2clk	 = clk_en?	1'b0:1'bz;
assign ps2data	=	data_en?	dout:1'bz;

always @(posedge clk)begin
if(Locked)curr_state<=next_state;
else curr_state<=0;
end

assign debug=curr_state;

always @(posedge clk)
if(Locked)begin
	ps2clk_in<=ps2clk_in_q;
	ps2data_in<=ps2data_in_q;
end else begin
	ps2clk_in<=1'b0;
	ps2data_in<=1'b0;
end

assign negedge_ps2_clk=~ps2clk_in_q & ps2clk_in;

always @(posedge clk)
if(hold_clk_en==1'b0)hold_count<=0;
else if(hold_count==2501)hold_count<=hold_count;
else hold_count<=hold_count+1'b1;

assign elapsed_100us=hold_count==2501;

always @(*)
begin
	hold_clk_en=0;
	hold_successful=1'b0;
	clk_en=1'b0;
	data_en=1'b0;
	dout=1'b0;
	line_idle=1'b0;
	
	case(curr_state)
	IDLE:
	begin
		line_idle=1'b1;
		if(trig_send)next_state=HOLD_CLK;
		else next_state=IDLE;
	end
	
	HOLD_CLK:
	begin
		hold_clk_en=1'b1;
		clk_en=1'b0;
		if(elapsed_100us)next_state=DETECT;
		else next_state=HOLD_CLK;
	end
	
	DETECT:
	begin
		data_en=1'b1;
		if(negedge_ps2_clk)next_state=HOLD_SUCCESSFUL;
		else next_state=DETECT;
	end
	
	HOLD_SUCCESSFUL:
	begin
		hold_successful=1'b1;
		next_state=HOLD_SUCCESSFUL;
	end
	endcase
end
endmodule
