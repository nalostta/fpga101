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
module bidir_wrapper2(
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

//resources
wire data_read;

reg read_en,ReadCounter_en,WriteCounter_en,my_state_out,partner_state_out,write_en,Rbuffer;
reg[1:0] state,Wcount,Rcount,Wbuffer;

assign data_read	=	data_link;
assign data_link	=	(write_en)?	Wbuffer[1]:1'bz;

//control module:
always @(posedge clk or posedge Locked)begin
	if(Locked)begin
		case(state)
		
			2'b0	: begin	//Line Idle check for read or write cycle
				if(data_link==1'b0)	state <= 2'b01;
				else if(my_state_in!=my_state_out)begin
					state		<=	2'b10;
					write_en	<=1'b1;
					my_state_out	<=my_state_in;
				end else begin
					write_en<=1'b0;
				end
			end
			
			
			2'b01	:	begin	//module in "read" cycle 
				//check if already reading?
				if(ReadCounter_en==1'b1)begin
					if(Rcount==2'b01)begin	//if counter has counted to 2 cycles, end state and get data
						ReadCounter_en	<=	1'b0;
						state	<=	2'b0;
						partner_state_out <= Rbuffer;
					end
				end else begin
					ReadCounter_en	<=	1'b1;
				end
			end
			
			
			2'b10	: begin	//module in "write" cycle
				if(WriteCounter_en==1'b1)begin
					if(Wcount==2'b01)begin
						WriteCounter_en<=1'b0;
						state	<=	2'b0;
						write_en<=1'b0;
					end 
				end else begin
					WriteCounter_en	<=	1'b1;
					Wbuffer[0]<=my_state_in;
				end
			end
			//
			default :	state <= 2'b0;
		endcase
		
	end else begin
		//state <= 2'b0;
		Wbuffer[0]<=1'b0;
		//write_en<=1'b0;
		my_state_out<=1'b1;
		partner_state_out<=1'b1;
	end
end


//Read module
always @(posedge clk or posedge ReadCounter_en)begin
	if(ReadCounter_en)begin
		Rcount<=Rcount+1'b1;
		Rbuffer<=data_read;
	end else begin
		Rbuffer<=1'b0;
		Rcount<=2'b0;
	end
end

//Write module
always @(posedge clk or posedge WriteCounter_en)begin
	if(WriteCounter_en==1'b1)begin
		Wcount<=Wcount+1'b1;
		Wbuffer[1]<=Wbuffer[0];
	end else begin
		Wcount<=2'b0;
		Wbuffer[1]<=1'b0;
	end
end 
endmodule
