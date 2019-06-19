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

reg[3:0] 	state,next_state;
reg 			hold_clock_en,clk_write_en,data_write_en,dout,negedge_ps2_temp_q,command_was_sent;
reg 			ps2clk_q,ps2data_q;


reg			posedge_ps2_temp,negedge_ps2_temp,timeout;

localparam IDLE 				=	4'h0,
			  HOLD_CLOCK		=	4'h1,
			  START_BIT			=	4'h2,
			  DATA0				=	4'h3,
			  DATA1				=	4'h4,
			  DATA2				=	4'h5,
			  DATA3				=	4'h6,
			  DATA4				=	4'h7,
			  DATA5				=	4'h8,
			  DATA6				=	4'h9,
			  DATA7				=	4'hA,
			  PARITY				=	4'hB,
			  STOP				=	4'hC,
			  WAIT_FOR_ACK		=	4'hD,
			  TX_END				=	4'hE,
			  TIMEOUT			=	4'hF;

//--------------------------------------------------------------------------------------------------------------------
assign _ps2clk		= ps2_clk;
assign _ps2data	= ps2_data;

assign ps2_clk 	= clk_write_en?	1'b0:1'bz;
assign ps2_data	= data_write_en?	dout:1'bz;

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

assign hold_100us = hold_count==12'h9c5; //(redundant now)9b0 tested to give a delay period of 100 us whereas 9c5 gave 116us

assign ack_received = (!_ps2data)&&(posedge_ps2_clk);

assign parity = (the_command[0]^the_command[1]^the_command[2]^the_command[3]^the_command[4]^the_command[5]^the_command[6]^the_command[7]^1'b1);
//--------------------------------------------------------------------------------------------------------------------

//---------------------debug----------------------------
assign debug = state;
//---------------------debug----------------------------
//assign timeout_15 = timeout_count==20'h5b8d8;

always @(posedge clk or posedge reset)
begin
	if(reset)state<=next_state;
	else state<=IDLE;
end

always @(*)
begin	
	next_state=state;
	hold_clock_en=1'b0;
	clk_write_en=1'b0;
	data_write_en=1'b0;
	command_was_sent=1'b0;

	
	case(state)
	
	IDLE:
	begin
		if(send_command)next_state=HOLD_CLOCK;
		else next_state=IDLE;
	end
	
	HOLD_CLOCK:
	begin
		hold_clock_en=1'b1;
		clk_write_en=1'b1;
		if(hold_100us)next_state=START_BIT;
		else next_state=HOLD_CLOCK;
	end
		
	START_BIT:
	begin
		data_write_en=1'b1;
		dout=1'b0;
		if(negedge_ps2_clk)next_state=DATA0;
		else next_state=START_BIT;
	end
	
	DATA0:
	begin
		data_write_en=1'b1;
		dout=the_command[0];
		if(negedge_ps2_clk)next_state=DATA1;
		else next_state=DATA0;
	end
	
	DATA1:
	begin
		data_write_en=1'b1;
		dout=the_command[1];
		if(negedge_ps2_clk)next_state=DATA2;
		else next_state=DATA1;
	end
	
	DATA2:
	begin
		data_write_en=1'b1;
		dout=the_command[2];
		if(negedge_ps2_clk)next_state=DATA3;
		else next_state=DATA2;
	end
	
	DATA3:
	begin
		data_write_en=1'b1;
		dout=the_command[3];
		if(negedge_ps2_clk)next_state=DATA4;
		else next_state=DATA3;
	end
	
	DATA4:
	begin
		data_write_en=1'b1;
		dout=the_command[4];
		if(negedge_ps2_clk)next_state=DATA5;
		else next_state=DATA4;
	end
	
	DATA5:
	begin
		data_write_en=1'b1;
		dout=the_command[5];
		if(negedge_ps2_clk)next_state=DATA6;
		else next_state=DATA5;
	end
	
	DATA6:
	begin
		data_write_en=1'b1;
		dout=the_command[6];
		if(negedge_ps2_clk)next_state=DATA7;
		else next_state=DATA6;
	end
	
	DATA7:
	begin
		data_write_en=1'b1;
		dout=the_command[7];
		if(negedge_ps2_clk)next_state=PARITY;
		else next_state=DATA7;
	end
	
	PARITY:
	begin
		data_write_en=1'b1;
		dout=parity;
		if(negedge_ps2_clk)next_state=STOP;
		else next_state=PARITY;
	end
	
	STOP:
	begin
		data_write_en=1'b1;
		dout=1'b1;
		if(negedge_ps2_clk)next_state=WAIT_FOR_ACK;
		else next_state=STOP;
	end
	
	WAIT_FOR_ACK:
	begin
		if(ack_received)next_state=TX_END;
		else next_state=WAIT_FOR_ACK;
	end
	
	TX_END:begin
		command_was_sent=1'b1;
		next_state=IDLE;
	end
	
	default next_state=IDLE;
	endcase
end
endmodule
