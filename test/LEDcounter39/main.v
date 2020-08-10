`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:17 01/04/2019 
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
	 led,
    push_btn,
    clk,
	 rst_in
    );

input [7:0] switch;
output [7:0] led;
input push_btn;
input clk;
input rst_in;
reg [7:0] led;
reg [3:0] count = 4'b0;



always @(posedge clk or negedge rst_in) begin
	if(!rst_in)begin
		if(count[3:0]==4'b1001)begin
			count[3:0]<=4'b0011;
		end else begin
			count<=count+1'b1;
		end
		led[3:0]<=count[3:0];
	end else begin
		count[3:0]<=4'b0;
		led[7:0]<=8'b0;
	end
	led[7:4]<=4'b0;
end
endmodule
