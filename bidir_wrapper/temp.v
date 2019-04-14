`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:08 03/08/2019 
// Design Name: 
// Module Name:    bidir_wrapper2 
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

module bidir_wrapper3(
		clk,
		Locked,
		my_state_in,
		my_state_out,
		partner_state_out,
		data_link
    );

/*
algorithm:
->check for comms line:  
	->low: start read cycle (2 clocks max) and disable send line in the period.
	->High: check for data to send:
		->data to be sent: set the data-send buffer,allot 2 cycles for data transmission and disable reading in this period.
		->idle : hold all present states.

->reset state : everything stays low


Modules : 
->control module : checks for data idle 
->counter module : counts for 2 cycles
->data-send buffer.
->data-receive buffer.
*/

//I/Os:
input clk,Locked,my_state_in;
output my_state_out,partner_state_out;
inout data_link;
//output write_en,read_en;

//resources
wire data_read;

reg my_state_out=1'b0;
reg partner_state_out=1'b0;
reg Rbuffer=1'b0;
reg write_en = 1'b0;
reg read_en	 =	1'b0;
reg[1:0] Wcount,Rcount;
reg[2:0] Wbuffer=2'b00;

assign data_read	=	data_link;
assign data_link	=	(write_en)?	Wbuffer[1]:1'bz;

//---------------------write control block---------------------------
always @(posedge clk)begin
	if(Locked)begin
		if((!write_en)&&(!read_en)&&(my_state_in!=my_state_out))begin
			write_en<=1'b1;
		end else begin
			if(write_en&&(Wcount==2'b01))begin
				write_en<=1'b0;
			end
		end
	end else begin
		write_en<=1'b0;
	end
end
//---------------------write control block---------------------------

//----------------------write count block----------------------------
always @(posedge clk)begin
	if(Locked&&write_en)begin
		Wcount<=Wcount+1'b1;
	end else begin
		Wcount<=2'b00; 
	end
end
//----------------------write count block----------------------------

//-----------------------write shift block---------------------------
always @(posedge write_en)begin
	my_state_out<=my_state_in;
end

always @(posedge clk)begin
	if(write_en)begin
		Wbuffer[1]<=Wbuffer[0];
	end else begin
		Wbuffer[1]<=1'b0;
		Wbuffer[0]<=my_state_in;
	end
end
//-----------------------write shift block---------------------------

//-----------------------read control block--------------------------
always @(posedge clk)begin
	if(Locked)begin
		if((!write_en)&&(!read_en)&&(data_read==1'b0))begin
			read_en<=1'b1;
		end else begin
			if(read_en&&(Rcount==2'b00))begin
				read_en<=1'b0;
			end
		end
	end else begin
		read_en<=1'b0;
	end
end
//-----------------------read control block--------------------------

always @(posedge clk)begin
	if(Locked&&read_en)begin
		Rcount<=Rcount+1'b1;
	end else begin
		Rcount<=2'b0;
	end
end

always @(posedge clk)begin
	if(Locked&&read_en)begin
		Rbuffer<=data_read;
	end else begin
		Rbuffer<=1'b0;
	end
end

always @(negedge read_en)begin
	partner_state_out<=Rbuffer;
end
endmodule
