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
	en,
	ps2clk,
	ps2data,
	rx_complete,
	received_data,
	debug
   );

input clk,en,ps2clk,ps2data;
output [7:0] received_data;
//output [1:0] error_code;
output rx_complete;
output [3:0] debug;

reg ps2clk_in,ps2data_in;
reg curr_rx_complete,next_rx_complete;
reg [3:0] curr_state,next_state;
reg [7:0] received_data;
reg parity;

assign error_code=0;
assign debug = curr_state;

//--------clk edge detection & syncing-------
always @(posedge clk)
if(en)begin
	ps2clk_in<=ps2clk;
	ps2data_in<=ps2data;
end else begin
	ps2data_in<=1'b0;
	ps2clk_in<=1'b0;
end

assign negedge_ps2_clk = ~ps2clk	& ps2clk_in;
//--------------------------------------------
assign rx_complete = curr_rx_complete;

localparam 	IDLE		=	4'h0,
				DATA_LOW	=	4'h1,
				CLK_LOW	=	4'h2,
				DATA0		=	4'h3,
				DATA1		=	4'h4,
				DATA2		=	4'h5,
				DATA3		=	4'h6,
				DATA4		=	4'h7,
				DATA5		=	4'h8,
				DATA6		=	4'h9,
				DATA7		=	4'hA,
				PARITY	=	4'hB,
				STOP		=	4'hC;

always @(posedge clk or posedge en)
if(en)begin
	curr_state<=next_state;
	curr_rx_complete<=next_rx_complete;
end else begin
	curr_state<=0;
	curr_rx_complete<=0;
end

//FSM
always @(*)
begin
	next_state=curr_state;
	next_rx_complete=1'b0;
	
	case(curr_state)
		IDLE:
		begin
			if(!ps2data_in)next_state=DATA_LOW;
		end
		
		DATA_LOW:
		begin
			if(!ps2clk_in)next_state=CLK_LOW;
		end
		
		CLK_LOW:
		begin
			if(negedge_ps2_clk)next_state=DATA0;
		end
		
		DATA0:
		begin
			received_data[0]=ps2data_in;
			if(negedge_ps2_clk)next_state=DATA1;
		end
		
		DATA1:
		begin
			received_data[1]=ps2data_in;
			if(negedge_ps2_clk)next_state=DATA2;
		end
		
		DATA2:
		begin
			received_data[2]=ps2data_in;
			if(negedge_ps2_clk)next_state=DATA3;
		end
		
		DATA3:
		begin
			received_data[3]=ps2data_in;
			if(negedge_ps2_clk)next_state=DATA4;
		end
		
		DATA4:
		begin
			received_data[4]=ps2data_in;
			if(negedge_ps2_clk)next_state=DATA5;
		end
		
		DATA5:
		begin
			received_data[5]=ps2data_in;
			if(negedge_ps2_clk)next_state=DATA6;
		end
		
		DATA6:
		begin
			received_data[6]=ps2data_in;
			if(negedge_ps2_clk)next_state=DATA7;
		end
		
		DATA7:
		begin
			received_data[7]=ps2data_in;
			if(negedge_ps2_clk)next_state=PARITY;
		end
		
		PARITY:
		begin
			parity=ps2data_in;
			if(ps2data_in&ps2clk_in)next_state=STOP;
		end
		
		STOP:
		begin
			next_rx_complete=1'b1;
			next_state=IDLE;
		end
		
		default : next_state=IDLE;
	endcase
end
endmodule
