`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:19 04/29/2019 
// Design Name: 
// Module Name:    fsm_ps2_in 
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
module fsm_ps2_in(
		clk,
		Locked,
		ps2_clk,
		ps2_data,
		received_data,
		received_data_en,
		debug,
		RedLed
    );
input clk,Locked;
output[7:0] received_data,debug;
output received_data_en,RedLed;
inout ps2_clk,ps2_data;

assign _ps2clk  = ps2_clk;
assign _ps2data = ps2_data;

reg[9:0] rx_data_q;
reg[7:0] received_data,debug;
reg[2:0] bit_count;
reg[1:0] state,next_state,StopBitFlag;
reg cbuf_q,dbuf_q,shift_en,RedLed;

assign data_valid= (rx_data_q[8]==rx_data_q[0]^rx_data_q[1]^rx_data_q[2]^rx_data_q[3]^rx_data_q[4]^rx_data_q[5]^rx_data_q[6]^rx_data_q[7])?	1'b0:1'b1;


integer i;

localparam	IDLE    = 2'd0,
				DATA_IN = 2'd1,
				END_RX  = 2'd3;

//A---------------------------------------------A
always @(posedge clk)begin
	debug[1:0]<=state;
	debug[7:2]<=0;
	cbuf_q<=_ps2clk;
	dbuf_q<=_ps2data;
	received_data<=rx_data_q[8:1];
	state<=next_state;
	RedLed<=data_valid;
end
//A---------------------------------------------A

//Q---------------------------------------------Q
always @(negedge cbuf_q)begin
	if(Locked)begin
		for(i=0;i<=8;i=i+1)	rx_data_q[i]<=rx_data_q[i+1];
		rx_data_q[9]<=dbuf_q;
		bit_count<=bit_count+1'b1;
	end else begin
		rx_data_q<=rx_data_q&&Locked;
		bit_count<=0;
	end
end
//Q---------------------------------------------Q

//Q---------------------------------------------Q
always @(posedge cbuf_q)begin
	if(state==END_RX)begin
		StopBitFlag[0]<=~StopBitFlag[0];
	end else begin
		StopBitFlag[0]<=StopBitFlag[0]&&Locked;
	end
end
//Q---------------------------------------------Q

//U---------------------------------------------U
always @(*)begin
	case(state)
		IDLE:begin
			if(!cbuf_q&&!dbuf_q)next_state<=DATA_IN;
			else next_state<= IDLE;
		end
		
		DATA_IN:begin
			if(bit_count==9&&shift_en)begin
				shift_en<=1'b0;
				next_state<=END_RX;
			end else begin
				shift_en<=1'b1;
				next_state<=DATA_IN;
			end
		end
		
		END_RX:begin
			if(StopBitFlag[1]!=StopBitFlag[0])begin
				StopBitFlag[1]<=StopBitFlag[0];
			end 
		end
		
		default:next_state<=IDLE;
	endcase
end
//U---------------------------------------------U
endmodule
