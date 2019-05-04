`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:58 05/01/2019 
// Design Name: 
// Module Name:    fsm_cmd_out 
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
module fsm_cmd_out(
		clk,						//main clk
		reset,					//reset signal
		the_command,			//input cmd to be sent to mouse (device)
		send_command,			//input trigger for the command to be sent
		ps2_clk,					//input ps2 clk line
		ps2_data,				//input ps2_data line
		command_was_sent,		//successful transmission of the command
		error_comm_timed_out,//unsuccessful transmission of command
		debug,
		pushbtn
    );

/*
ps2_clk_negedge,		//data is sent at neg edge of ps2 clk
ps2_clk_posedge,		//received Ack is captured at posedge of ps2clk
*/

input[7:0]	the_command;
input			clk,reset,send_command,pushbtn;
output[7:0] debug;
output		command_was_sent,error_comm_timed_out;
inout			ps2_clk,ps2_data;

reg[17:0]	timeout_count;
reg[10:0]	hold_count;
reg[9:0] 	dataframe;
reg[7:0]		debug;
reg[3:0] 	state,next_state;
reg 			hold_clock_en,ack_received,clk_write_en,data_write_en,clk_write_buf,data_write_buf,negedge_ps2_temp_q;

reg posedge_ps2_temp,negedge_ps2_temp;

localparam IDLE 				=	4'd14,
			  HOLD_CLOCK		=	4'd1,
			  WAIT_FOR_DEVICE	=	4'd2,
			  DATA0				=	4'd3,
			  DATA1				=	4'd4,
			  DATA2				=	4'd5,
			  DATA3				=	4'd6,
			  DATA4				=	4'd7,
			  DATA5				=	4'd8,
			  DATA6				=	4'd9,
			  DATA7				=	4'd10,
			  PARITY				=	4'd11,
			  STOP				=	4'd12,
			  WAIT_FOR_ACK		=	4'd13,
			  TX_END				=	4'd0;

assign _ps2clk		= ps2_clk;
assign _ps2data	= ps2_data;

assign ps2_clk 	= clk_write_en?	clk_write_buf:1'bz;
assign ps2_data	= data_write_en?	data_write_buf:1'bz;

assign negedge_ps2_clk	=	~_ps2clk	&	negedge_ps2_temp;
assign posedge_ps2_clk	=	_ps2clk	&	~posedge_ps2_temp;

always @(posedge clk or negedge reset)begin
	if(~reset)negedge_ps2_temp<=1'b0;
	else negedge_ps2_temp<=_ps2clk;
end

always @(posedge clk or negedge reset)begin
	if(~reset)posedge_ps2_temp<=1'b0;
	else posedge_ps2_temp<=_ps2clk;
end

always @(posedge clk or negedge reset)begin
	if(~reset) state<=IDLE;
	else state<=next_state;
end

always @(posedge clk)begin
	debug[3:0]<=state;
	debug[4]<=hold_clock_en;
	debug[7:5]<=0;
end

always @(posedge clk)begin
	if(hold_clock_en) hold_count<=hold_count+1'b1;
	else hold_count<=0;
end

always @(state,negedge_ps2_clk,posedge_ps2_clk,send_command)begin
	next_state<=IDLE;
	case(state)
		IDLE:begin
			//detect external trigger to initiate
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b0;
			if(send_command)next_state<=HOLD_CLOCK;
			else next_state<=IDLE;
		end
		
		HOLD_CLOCK:begin
			//pull down clock low for 100 us
			clk_write_en<=1'b1;
			data_write_en<=1'b0;
			clk_write_buf<=1'b0;
			hold_clock_en<=1'b1;
			if(hold_count==10'd1600&&hold_clock_en)begin
				hold_clock_en<=1'b0;
				next_state<=WAIT_FOR_DEVICE;
			end else begin
				hold_clock_en<=1'b1;
				next_state<=HOLD_CLOCK;
			end
		end
		
		WAIT_FOR_DEVICE:begin
			//time_out = 15ms
			//pull dataline down low & release clock
			//wait for device to generate clock
			data_write_en<=1'b1;
			data_write_buf<=1'b0;
			clk_write_en<=1'b0;
			if(negedge_ps2_clk)next_state<=DATA0;
			else next_state<=WAIT_FOR_DEVICE;
		end
		
		DATA0:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[0];
			if(negedge_ps2_clk)next_state<=DATA1;
			else next_state<=DATA0;
		end
		
		DATA1:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[1];
			if(negedge_ps2_clk)next_state<=DATA2;
			else next_state<=DATA1;
		end
		
		DATA2:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[2];
			if(negedge_ps2_clk)next_state<=DATA3;
			else next_state<=DATA2;
		end
		
		DATA3:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[3];
			if(negedge_ps2_clk)next_state<=DATA4;
			else next_state<=DATA3;
		end
		
		DATA4:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[4];
			if(negedge_ps2_clk)next_state<=DATA5;
			else next_state<=DATA4;
		end
		
		DATA5:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[5];
			if(negedge_ps2_clk)next_state<=DATA6;
			else next_state<=DATA5;
		end
		
		DATA6:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[6];
			if(negedge_ps2_clk)next_state<=DATA7;
			else next_state<=DATA6;
		end
		
		DATA7:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[7];
			if(negedge_ps2_clk)next_state<=PARITY;
			else next_state<=DATA7;
		end
		
		PARITY:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[0]^the_command[1]^the_command[2]^the_command[3]^the_command[4]^the_command[5]^the_command[6]^the_command[7];
			if(negedge_ps2_clk)next_state<=STOP;
			else next_state<=PARITY;
		end
		
		STOP:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=1'b1;
			if(negedge_ps2_clk)next_state<=WAIT_FOR_ACK;
			else next_state<=STOP;
		end
		
		WAIT_FOR_ACK:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b0;
			if(posedge_ps2_clk)next_state<=WAIT_FOR_ACK;
			else next_state<=TX_END;
		end
		
		TX_END:begin
			if(pushbtn)next_state<=IDLE;
			else next_state<=TX_END;
		end
	default: next_state<=IDLE;
	endcase
end
endmodule

