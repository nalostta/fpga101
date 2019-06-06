`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:06:06 05/31/2019 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
	clk,
	Locked,
	trig_in,
	trig_out
    );

input clk,Locked,trig_in;
output trig_out;

/*
input => output, deactivate sense and start count => go back to initial state
*/

localparam SENSE = 2'b0,
			  UPDATE = 2'b01,
			  DEACTIVATE_SENSE = 2'b10;

reg trig_out,d_count_en,trig_out_next;
reg [1:0] curr_state,next_state;
reg [14:0]	d_count;

always @(posedge clk)
if(Locked)curr_state<=next_state;
else curr_state<=SENSE;

always @(posedge clk)
if(!d_count_en)d_count<=0;
else if(d_count==15'd25000)d_count<=d_count;
else d_count<=d_count+1'b1;

assign count_done = d_count==15'd25000;

always @(posedge clk)
if(Locked)trig_out<=trig_out_next;
else trig_out<=0;

always @(*)
begin
	trig_out_next=trig_out;
	d_count_en=1'b0;
	
	case(curr_state)
	SENSE:
	begin
		if(trig_in!=trig_out)next_state=UPDATE;
		else next_state = SENSE;
	end
	
	UPDATE:
	begin
		trig_out_next=trig_in;
		next_state=DEACTIVATE_SENSE;
	end
	
	DEACTIVATE_SENSE:
	begin
		d_count_en=1'b1;
		if(count_done)next_state=SENSE;
		else next_state=DEACTIVATE_SENSE;
	end
	
	default: next_state=SENSE;
	endcase
end
endmodule
