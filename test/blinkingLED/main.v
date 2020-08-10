`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:21:48 01/06/2019 
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
		switch,
		clk,
		led,
		push_btn
    );
input [7:0] switch;
input clk;
input push_btn;
output [7:0] led;
reg [7:0] led;
reg [28:0] counter;

always @(posedge clk)begin
	counter[28:0]=counter[28:0]+1'b1;
	if(counter[24:0]==25'b0)begin
	led[0]=~led[0];
	led[7:1]=7'b0;
	end
end
endmodule
