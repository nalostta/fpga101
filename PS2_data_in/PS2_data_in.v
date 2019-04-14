`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:13:28 04/05/2019 
// Design Name: 
// Module Name:    ps2_data_in 
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
//BIT_TIMEOUT 2ms

module ps2_data_in(
		clk,
		reset,
		start_receiving_data,
		ps2_clk,
		ps2_data,
		hold_data,
		rx_complete,
		state
    );
	 
input clk,reset,start_receiving_data,ps2_data,ps2_clk,hold_data;
//output received_data,received_data;
output rx_complete;
output[3:0] state;
reg rx_complete=0;

/*
all the states : 
IDLE
START
DATA
PARITY
END

detect start bit

code dependability :
//T---T : tested (in isolation).
//Q---Q : quarantined (needs to be observed closely or tested in isolation)
//A---A : untested code written assuming it will work.

*/

localparam	IDLE		= 4'h0,
				DATA0		= 4'h1,
				DATA1		= 4'h2,
				DATA2		= 4'h3,
				DATA3		= 4'h4,
				DATA4		= 4'h5,
				DATA5		= 4'h6,
				DATA6		= 4'h7,
				DATA7		= 4'h8,
				PARITY	= 4'h9,
				RX_COMPLETE = 4'hA;
				//RX_ERROR = #based on timeout 
				
reg[3:0] state,next_state;
reg[7:0] Rx_Buffer;
reg Rx_Parity;

//obtain controlled - negative clock pulses 
assign neg_PS2_clk = start_receiving_data?	!ps2_clk:1'b0;
//

always @(posedge clk or negedge reset)begin
	if(!reset)begin
		state<=next_state;
	end else begin
		state<=IDLE;
	end
end

always @(negedge ps2_clk)begin
	if(!reset)begin
		case(state)
			//A----------------------------------------------------------------A
			IDLE:
				begin
					rx_complete<=1'b0;
					if(neg_PS2_clk&&!ps2_data)	next_state<=DATA0;
					else next_state <= IDLE;
				end
			//A----------------------------------------------------------------A	
			
			//A----------------------------------------------------------------A
			DATA0: //start bit detected ,now receive data bit 0
				begin
					if(neg_PS2_clk)begin
					Rx_Buffer[0]<=ps2_data;
					next_state<=DATA1;
						end else next_state <= DATA0;
				end
			//A----------------------------------------------------------------A
			
			DATA1:
				begin
					if(neg_PS2_clk)begin
						Rx_Buffer[1]<=ps2_data;
						next_state<=DATA2;
					end else next_state <= DATA1;
				end
				
			DATA2:
				begin
					if(neg_PS2_clk)begin
						Rx_Buffer[2]<=ps2_data;
						next_state<=DATA3;
					end else next_state <= DATA2;
				end
				
			DATA3:
				begin
					if(neg_PS2_clk)begin
						Rx_Buffer[3]<=ps2_data;
						next_state<=DATA4;
					end else next_state <= DATA3;
				end

			DATA4:
				begin
					if(neg_PS2_clk)begin
						Rx_Buffer[4]<=ps2_data;
						next_state<=DATA5;
					end else next_state <= DATA4;
				end
				
			DATA5:
				begin
					if(neg_PS2_clk)begin
						Rx_Buffer[5]<=ps2_data;
						next_state<=DATA6;
					end else next_state <= DATA5;
				end
				
			DATA6:
				begin
					if(neg_PS2_clk)begin
						Rx_Buffer[6]<=ps2_data;
						next_state<=DATA7;
					end else next_state <= DATA6;
				end
				
			DATA7:
				begin
					if(neg_PS2_clk)begin
						Rx_Buffer[7]<=ps2_data;
						next_state<=PARITY;
					end else next_state <= DATA7;
				end
			
			PARITY:
				begin
					if(neg_PS2_clk)begin
						Rx_Parity<=ps2_data;
						next_state<=RX_COMPLETE;
					end else next_state <= PARITY;
				end
				
			RX_COMPLETE:
				begin
					rx_complete<=1'b1;
					if(!hold_data)begin
						next_state<=IDLE;
					end else next_state <= RX_COMPLETE;
				end
				
			default  : next_state<=IDLE;
		endcase
	end else begin
		next_state <= IDLE;
	end
end
endmodule
