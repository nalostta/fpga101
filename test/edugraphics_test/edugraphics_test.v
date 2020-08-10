`timescale 1ns / 1ps
module edugraphics_test(
    switch,
    led,
    push_btn,
    clk
    );

input [7:0] switch;
output [7:0] led;
input push_btn;
input clk;

adder adder_inst(
	.in(switch[7:0]),
	.out(led[3:0])
	);
	
assign led[7:4] = 4'b0;

endmodule
