`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:27 01/10/2019 
// Design Name: 
// Module Name:    main 
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
module main(
	push_btn,
	led,
	switch,
	clk,
	buzzer
    );
input	clk;
input	[3:0] push_btn;
input	[7:0]	switch;
output	[7:0] led;
output buzzer;
reg [15:0] count;
reg buzzer;

always @(posedge clk)begin
	count=count+1'b1;
	buzzer<=count[14];
end
endmodule
