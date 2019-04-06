`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:13:28 04/05/2019 
// Design Name: 
// Module Name:    PS2_data_in 
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

/*

clk[input]						:	main clock signal
reset[input]					:	main reset signal
start_receiving_data[input]:	control signal which starts the receive engine
ps2_clk_posedge[input]		:	positive edge of ps2_clk (received data is captured at positive edge of the ps2_clk)
ps2_data[input]				:	ps2_data line
received_data[output]		:	received data
received_data_en[output]	:	received data enable

*/
`define BIT_TIMEOUT 2ms

module PS2_data_in(
		clk,
		reset,
		start_receiving_data,
		ps2_clk,
		ps2_data,
		received_data,
		received_data_en
    );
	 
integer i;
input clk,reset,start_receiving_data,ps2_clk_posedge,ps2_data;
output received_data,received_data;

/*
all the states : 
IDLE
START
DATA
PARITY
END

detect start bit
*/

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
				TX_ERROR	= 4'hC;
				
reg[2:0] state,next_state;

//obtain controlled - negative clock pulses 
assign neg_PS2_clk = rx_en?	!PS2_clk:1'b0;
//

always @(posedge clk or negedge reset)begin
	if(!reset)begin
		state<=next_state;
	end else begin
		state<=IDLE;
	end
end

always @(posedge clk or negedge reset)begin
	if(!reset)begin
		case(state)
		
			IDLE:
				begin
					if(neg_PS2_clk&&!PS2_data)	next_state<=START;
					else next_state <= IDLE;
				end
				
			START:
				begin
					if(neg_PS2_clk&&!PS2_data)	next_state<=DATA;
						else next_state <= START;
				end
				
			DATA:
				begin
					bit_count_en<=1'b1;
					bit_timeout_en<=1'b1;
					if(neg_PS2_clk && bit_count==8)begin
						next_state	<=	PARITY;
					end else	if(neg_PS2_clk)begin
						next_state	<=	DATA;
						bit_timeout	<= 0;
					end else begin
						next_state	<= DATA;
					end
				end
				
			default  : next_state<=IDLE;
			endcase
	end else begin
		next_state = IDLE;
	end
end



endmodule
