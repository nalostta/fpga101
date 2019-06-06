`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:26:35 05/31/2019 
// Design Name: 
// Module Name:    ps2host_test 
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
module ps2host_test(
    );
	 
reg clk,reset,trig_send,clkout,clk_en,data_en,dout;
reg [7:0] switch;
wire line_idle,data_sent;

tri ps2clock,ps2data;

PS2MOUSE_HOST DUT(
	.clk(clk),
	.reset(reset),
	.ps2clock(ps2clock),
	.ps2data(ps2data),
	.data_to_send(switch),
	.data_sent(data_sent),
	.trig_send(trig_send),
	.line_idle(line_idle)
    );
	 
always #20 clk=!clk;

assign ps2clock = clk_en?	clkout:1'bz;
assign ps2data	 =	data_en?	dout:1'bz;	

pullup(ps2clock);
pullup(ps2data);

initial begin
	reset=1'b1;
	clk=1'b1;
	switch=8'hF4;
	clk_en=0;
	data_en=0;
	dout=0;
	clkout=0;
	trig_send=0;
	#4000 trig_send=1'b1;
	#4000 trig_send=1'b0;
	#100000 clk_en=1'b1;
	clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	#400000 clkout=1'b1;
	#400000 clkout=1'b0;
	
	#320000 $stop;
end
endmodule
