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
wire data_read,count_next;
reg my_state_out,data_en,partner_state_out,count_en;
reg[1:0] count,shift;
//check if the line goes low, yes: allot 2 cycles to read data
//else check self state 

assign data_read	=	data_link;
assign data_link	=	data_en?	my_state_out:1'bx;
assign count_next	=	count+1'b1;

always @(posedge clk or posedge Locked)begin
	if(Locked)begin
	
		//locked state
		if(/*data_link!=1'b0 && */(my_state_in!=my_state_out))begin
				data_en<=1'b1;
				count_en<=1'b1;
				shift[0]<=1'b0;
				shift[1]<=my_state_in;
		end else begin
			partner_state_out<=data_read;
		end
		//
		if(count==2'b10)begin
			count_en<=1'b0;
			count<=2'b0;
			data_en<=1'b0;
		end 
		//
		if(count_en)begin
			count<=count_next;
			my_state_out<=shift[0];
			shift[0]<=shift[1];
		end else begin
			count<=2'b0;
		end
	end else begin
		//not locked/reset state
		data_en<=1'b0;
		my_state_out<=1'b0;
		partner_state_out<=1'bz;
	end
end
endmodule
