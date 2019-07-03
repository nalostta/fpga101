`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:09 06/13/2019 
// Design Name: 
// Module Name:    PS2RX 
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
module PS2RX(
	clk,
	en,
	PS2CLK,
	PS2DATA,
	RX_BUFFER,
	rx_complete
    );

input clk,en;
output [7:0] RX_BUFFER;
output rx_complete;
inout PS2DATA,PS2CLK;

reg ps2_clk_in,ps2_data_in;
reg [7:0]	RX_BUFFER;
reg [3:0]	Curr_state,next_state;
reg parity,rx_complete;

assign ps2_clk_in_q=PS2CLK; 
assign ps2_data_in_q=PS2DATA;
assign negedge_ps2_clk= ~ps2_clk_in_q & ps2_clk_in;

always @(posedge clk or posedge en)
if(en)begin
	ps2_clk_in<=ps2_clk_in_q;
	ps2_data_in<=ps2_data_in_q;
end else begin
	ps2_clk_in<=1'b1;
	ps2_data_in<=1'b1;
end

always @(posedge clk or posedge en)
if(en)	Curr_state<=next_state;
else 		Curr_state<=0;

localparam 	IDLE			=	4'h0,
				START_BIT	=	4'h1,
				DATA0			=	4'h2,
				DATA1			=	4'h3,
				DATA2			=	4'h4,
				DATA3			=	4'h5,
				DATA4			=	4'h6,
				DATA5			=	4'h7,
				DATA6			=	4'h8,
				DATA7			=	4'h9,
				PARITY		=	4'hA,
				RX_END		=	4'hB;
				
always @(*)
begin
	rx_complete=1'b0;
	
	case(Curr_state)
	IDLE:
	begin
		if(!ps2_data_in)next_state=DATA0;
		else next_state=IDLE;
	end
	
	START_BIT:
	begin
		if(negedge_ps2_clk)next_state=DATA0;
		else next_state=START_BIT;
	end
	
	DATA0:
	begin
		RX_BUFFER[0]=ps2_data_in;
		if(negedge_ps2_clk)next_state=DATA1;
		else next_state=DATA0;
	end
	
	DATA1:
	begin
		RX_BUFFER[1]=ps2_data_in;
		if(negedge_ps2_clk)next_state=DATA2;
		else next_state=DATA1;
	end
	
	DATA2:
	begin
		RX_BUFFER[2]=ps2_data_in;
		if(negedge_ps2_clk)next_state=DATA3;
		else next_state=DATA2;
	end
	
	DATA3:
	begin
		RX_BUFFER[3]=ps2_data_in;
		if(negedge_ps2_clk)next_state=DATA4;
		else next_state=DATA3;
	end
	
	DATA4:
	begin
		RX_BUFFER[4]=ps2_data_in;
		if(negedge_ps2_clk)next_state=DATA5;
		else next_state=DATA4;
	end
	
	DATA5:
	begin
		RX_BUFFER[5]=ps2_data_in;
		if(negedge_ps2_clk)next_state=DATA6;
		else next_state=DATA5;
	end
	
	DATA6:
	begin
		RX_BUFFER[6]=ps2_data_in;
		if(negedge_ps2_clk)next_state=DATA7;
		else next_state=DATA6;
	end
	
	DATA7:
	begin
		RX_BUFFER[7]=ps2_data_in;
		if(negedge_ps2_clk)next_state=PARITY;
		else next_state=DATA7;
	end
	
	PARITY:
	begin
		parity=ps2_data_in;
		if(negedge_ps2_clk)next_state=RX_END;
		else next_state=PARITY;
	end
	
	RX_END:
	begin
		rx_complete=1'b1;
		next_state=RX_END;
	end
	
	default:next_state=IDLE;
	endcase
end
endmodule
