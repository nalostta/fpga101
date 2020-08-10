`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:33 02/12/2019 
// Design Name: 
// Module Name:    bidir_test 
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
module bidir_test(
		my_state_in,
		my_state_out,
		partner_state_out,
		data_link,
		clk,
		reset
    );
//inputs:
input my_state_in,clk,reset;
//outputs:
output my_state_out,partner_state_out;
//inouts:
inout data_link;
//regs:
reg my_state_out,partner_state_out,data_out,data_en;
//wires:
wire data_io,data_read;

//bi-dir inout statements

assign data_link	=	data_en?	data_out:1'bz;
assign data_read = data_link;
/*
detect state change
communicate change
*/

always @(posedge clk or posedge reset)begin 
	//
	if(reset)begin
		if(data_link!=1'b1)begin	
			data_en=1'b1;
			partner_state_out=data_link;
			data_en=1'b0;
		end else begin
			if(my_state_out!=my_state_in)begin
				data_out=1'b0;
				data_en=1'b1;
				data_out=my_state_in;
				data_en=1'b0;
			end
			my_state_out=my_state_in;
		end
	end else begin
		my_state_out=1'b1;
		partner_state_out=1'b1;
		data_en=1'b0;
	end
end


/*
if(data_link==1'b1)begin
			if(my_state_out!=my_state_in)begin
				data_link=1'b0;
				data_link=my_state_in;
				data_link=1'b1;
				my_state_out=my_state_in;
			end
		end else begin
			partner_state_out=data_link;
			partner_state_out=data_link;
		end
*/
endmodule
