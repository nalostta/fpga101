`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
<<<<<<< HEAD
<<<<<<< HEAD
// Create Date:    03:06:28 05/12/2019 
=======
// Create Date:    23:39:38 05/12/2019 
>>>>>>> test
=======
// Create Date:    23:39:38 05/12/2019 
>>>>>>> test
// Design Name: 
// Module Name:    testbench 
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
module testbench(
    );
	 
<<<<<<< HEAD
<<<<<<< HEAD
reg[7:0]	switch;
reg[1:0]	pushbtn;
reg		clk;

wire[7:0] led;
wire[3:0] debug_state_tx,debug_state_rx;
wire datalink,clklink;
=======
=======
>>>>>>> test
reg[7:0] switch;
reg[1:0] pushbtn;
reg send_cmd;
reg clk;

wire[15:0] clk_counter;
wire[7:0] led;
wire[3:0] debug_tx,debug_rx;
wire clocklink,datalink,clk_dis;
<<<<<<< HEAD
>>>>>>> test
=======
>>>>>>> test

main DUT(
		.clk(clk),
		.switch(switch),
		.pushbtn(pushbtn),
		.led(led),
<<<<<<< HEAD
<<<<<<< HEAD
		.datalink({datalink,clklink,datalink,clklink}),
		.debug_state_tx(debug_state_tx),
		.debug_state_rx(debug_state_rx)
		);
		
always #20 clk<=~clk;

pullup(clklink);
pullup(datalink);

initial begin
	clk<=1'b1;
	switch<=0;
	pushbtn<=2'b00;
	#5000
	switch<=8'b10100101;
	#5050 pushbtn<=2'b11;
	#5000 pushbtn<=2'b00;
	#1500000 $finish;
=======
=======
>>>>>>> test
		.datalink({datalink,clocklink,datalink,clocklink}),
		.debug_tx(debug_tx),
		.debug_rx(debug_rx),
		.clk_counter(clk_counter)
    );
/*	 
fsm_cmd_out DUT_cmd(
		.clk(clk),						
		.reset(1'b1),					
		.the_command(switch),
		.send_command(send_cmd),			
		.ps2_clk(clocklink),
		.ps2_data(datalink),
		.command_was_sent(),
		.error_comm_timed_out(),
		.debug(debug_tx),
		.pushbtn(),
		.status()
    );*/

always #20 clk=~clk;

pullup(datalink);
pullup(clocklink);

initial begin
	clk<=1'b1;
	switch<=8'h55;
	send_cmd<=0;
	pushbtn<=2'b11;
	#500000
	#14840
	send_cmd<=1'b1;
	pushbtn<=2'b00;
	#400 send_cmd<=1'b0;
	pushbtn<=2'b00;
	#165000 $finish;
<<<<<<< HEAD
>>>>>>> test
=======
>>>>>>> test
end
endmodule
