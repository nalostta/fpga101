`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:23 06/04/2019 
// Design Name: 
// Module Name:    external_test 
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
module external_test(
    );

reg reset,clk,clk_mouse_in,trig;
reg [7:0] switch;

wire [7:0] led;
wire ps2clk,ps2data;
wire send;

MouseTransmitter DUT(
	.RESET(reset),
	.CLK(clk),
	.PS2CLK(ps2clk),
	.PS2DATA(ps2data),
	.SEND_BYTE(trig),
	.BYTE_TO_SEND(switch),
	.BYTE_SENT(sent)
);

bfm_ps2_command_in(
	.clk(clk),
	.reset(reset),
	.ps2_data(ps2data),
	.ps2_clock(ps2clk),
	.received_cmd(led),
	.received_cmd_en(),
	.debug_rx()
    );

pullup(ps2clk);
pullup(ps2data);

always #20 clk=!clk;

initial begin
clk=1'b1;
reset=1'b1;
switch = 8'hf4;
trig=0;
#100 reset=1'b0;
trig=1;
#1800000 $stop;
end
endmodule
