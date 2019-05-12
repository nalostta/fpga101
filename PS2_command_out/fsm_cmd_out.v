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
output[3:0] debug;
output		command_was_sent,error_comm_timed_out;
inout			ps2_clk,ps2_data;

reg[19:0]	timeout_count_15;
reg[15:0]	timeout_count_2;
reg[11:0]	hold_count;
reg[9:0] 	dataframe;
reg[3:0]		debug;
reg[3:0]		state;
reg 			hold_clock_en,timeout_en,data_write_buf,clk_write_buf,data_write_en,clk_write_en;

reg			posedge_ps2_temp,negedge_ps2_temp,timeout,status;

localparam IDLE 				=	4'd0,
			  HOLD_CLOCK		=	4'd1,
			  START_BIT			=	4'd2,
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
			  TX_END				=	4'd14,
			  TIMEOUT			=	4'd15;

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

always @(posedge clk)begin
	if(hold_clock_en==1'b0)hold_count<=0;
	else if(hold_count==12'h9c5)hold_count<=hold_count;
	else hold_count<=hold_count+1'b1;
end

assign hold_100us = hold_count==12'h9c5; //9b0 tested to give a delay period of 100 us whereas 9c5 gave 116us


assign ack_received = ((state==WAIT_FOR_ACK)&&(!_ps2data)&&(posedge_ps2_clk));

//---------------------debug----------------------------
always @(posedge clk)debug<=state;
//---------------------debug----------------------------
//assign timeout_15 = timeout_count==20'h5b8d8;

always @(posedge clk or posedge reset)begin
	if(reset)begin
		case(state)
		
		IDLE:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b0;
			if(send_command)state<=HOLD_CLOCK;
			else state<=IDLE;
		end
			
		HOLD_CLOCK:begin
			hold_clock_en<=1'b1;
			clk_write_en<=1'b1;
			clk_write_buf<=1'b0;  //write 0 to clk line
			data_write_en<=1'b0;
			if(hold_100us)state<=START_BIT;
			else state<=HOLD_CLOCK;
		end
			
		START_BIT:begin
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=1'b0; //write 0 to data line
			if(negedge_ps2_clk)state<=DATA0;
			else state<=START_BIT;
		end
		
		DATA0:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[0]; //write data[0] to data line
			if(negedge_ps2_clk)state<=DATA1;
			else state<=DATA0;
		end
		
		DATA1:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[1]; //write data[1] to data line
			if(negedge_ps2_clk)state<=DATA2;
			else state<=DATA1;
		end
		
		DATA2:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[2]; //write data[2] to data line
			if(negedge_ps2_clk)state<=DATA3;
			else state<=DATA2;
		end
		
		DATA3:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[3]; //write data[3] to data line
			if(negedge_ps2_clk)state<=DATA4;
			else state<=DATA3;
		end
		
		DATA4:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[4]; //write data[4] to data line
			if(negedge_ps2_clk)state<=DATA5;
			else state<=DATA4;
		end
		
		DATA5:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[5]; //write data[5] to data line
			if(negedge_ps2_clk)state<=DATA6;
			else state<=DATA5;
		end
		
		DATA6:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[6]; //write data[6] to data line
			if(negedge_ps2_clk)state<=DATA7;
			else state<=DATA6;
		end
		
		DATA7:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=the_command[7]; //write data[7] to data line
			if(negedge_ps2_clk)state<=PARITY;
			else state<=DATA7;
		end
		
		PARITY:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=(the_command[0]^the_command[1]^the_command[2]^the_command[3]^the_command[4]^the_command[5]^the_command[6]^the_command[7]^1'b1); //write parity bit to data line
			if(negedge_ps2_clk)state<=STOP;
			else state<=PARITY;
		end
		
		STOP:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b1;
			data_write_buf<=1'b1; //stop bit
			if(negedge_ps2_clk)state<=WAIT_FOR_ACK;
			else state<=STOP;
		end
		
		WAIT_FOR_ACK:begin
			hold_clock_en<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b0;
			if(ack_received)state<=TX_END;
			else state<=WAIT_FOR_ACK;
		end
		
		TX_END:begin
			status<=1'b0;
			clk_write_en<=1'b0;
			data_write_en<=1'b0;
			if(negedge_ps2_clk)state<=IDLE;
			else state<=TX_END;
		end

		
		default : state<=IDLE;
		endcase
	end else begin
		state<=IDLE;
	end
end
endmodule

