`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:45 01/10/2019 
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
	clk,
	switch,
	push_btn,
	led
    );
	 
input clk;
input push_btn;
input	[7:0] switch;
output [7:0] led;
reg [7:0] led;
reg [26:0] count;
reg [3:0] combination=4'b0;

always @(posedge clk)begin
	count <= count+1'b1;
	led[7]<= count[26];
	if(count==27'b1)begin
		combination[3:2]=combination[1:0];
		combination[1:0]=switch[1:0];
	end
end

always @(posedge clk)begin
	if(combination==4'b0110)begin
		led[0]<=1'b1;
		led[6:1]<=6'b0;
	end else begin
		led[6:0]<=7'b0;
	end
end
endmodule
