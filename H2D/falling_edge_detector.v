`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:40:30 05/31/2019 
// Design Name: 
// Module Name:    falling_edge_detector 
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
module falling_edge_detector(
	clk,
	Locked,
	instream,
	f_edge
    );
	 
	 
input clk,Locked,instream;
output f_edge;

reg [7:0] filter_reg;
reg f_instream_reg;

wire [7:0] filter_next;

assign filter_next 		= {instream,filter_reg[7:1]};
assign f_instream_next	= {filter_reg==8'hff}	?	1'b1:
								  {filter_next==8'h00}	?	1'b0:
								  f_instream_reg;

assign f_edge = f_instream_reg & !f_instream_next;

always @(posedge clk,posedge Locked)
if(Locked)
begin
	filter_reg<=filter_next;
	f_instream_reg<=f_instream_next;
end else begin
	filter_reg<=0;
	f_instream_reg<=0;
end


endmodule
