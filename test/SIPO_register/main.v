`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:37 01/05/2019 
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
    clk,
    push_btn,
	 rst
    );


integer i=0;
output [7:0] led;
input clk;
input [7:0] switch;
input push_btn;
input rst;
reg [7:0] led;
reg [23:0] count=24'b0;

always @(posedge clk or negedge rst) begin
//	count = count + 1'b1;
	if(!rst) begin
	//if(count[19:0]==20'b1) begin
		for(i=0;i<7;i=i+1)
			led[i] <= led[i+1];
			led[7] <= ~push_btn;
	//end
	end else begin
		led[7:0]<=0;
	end
end
endmodule
