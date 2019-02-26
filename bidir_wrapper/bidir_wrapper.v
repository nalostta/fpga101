`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:11 02/24/2019 
// Design Name: 
// Module Name:    bidir_wrapper 
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
module bidir_wrapper(
		clk,
		Locked,
		my_state_in,
		my_state_out,
		partner_state_out,
		data_link
    );
input  my_state_in,clk,Locked;
output my_state_out,partner_state_out;
inout data_link;
wire data_read;
wire[2:0] count_next;
reg my_state_out,data_en,partner_state_out,count_en;
reg[1:0] shift,count;

//check if the line goes low, yes: allot 2 cycles to read data
//else check self state 

/*
io's:		
	input		:	clk	Locked	my_state_in
	output	:	my_state_out	partner_state_out
	inout		:	data_link
		
*/
assign data_read	=	data_link;
assign data_link	=	data_en?	my_state_out:1'bz;
assign count_next	=	count+1'b1;

always @(posedge clk or posedge Locked)begin
	if(Locked)begin
		//algorithm
			if(my_state_in!=my_state_out && data_en!=1'b1)begin
				shift[1]<=my_state_in;
				data_en<=1'b1;
			end
				
			if(count==2'b10)begin
				data_en<=1'b0;
			end
		end else begin
		//reset state
		data_en<=1'b0;
		//my_state_out<=1'b0;
		partner_state_out<=1'b0;
	end
end

always @(posedge clk or posedge data_en)begin
	if(data_en)begin
		count<=count_next;
		shift[0]<=shift[1];
		my_state_out<=shift[0];
	end else begin
		count<=2'b0;
		shift[0]<=1'b0;
		my_state_out<=my_state_out && Locked;
	end
end
endmodule
