`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:32 03/26/2019 
// Design Name: 
// Module Name:    rxc 
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
module rxc(
		clk_50khz,
		Locked,
		led,
		datalink
    );
	 
input clk_50khz,Locked;
output led;
inout datalink;

wire rx_in;
reg led,read_trig,count_en;
reg rx_data,rx_data_r;
reg[1:0] count,state;

assign data_read = datalink;
/*
parameter IDLE	 = 2'b00;
parameter READ	 = 2'b01;
parameter WRITE = 2'b10;

always @(posedge i_clk)begin
	rx_data_r<=rx_in;
	rx_data<=rx_data_r;
end

always @(posedge i_clk)begin
	if(Locked)begin
		case(state)
			IDLE : begin
				
			end
		endcase
	end else begin
	
	end
end*/
endmodule
