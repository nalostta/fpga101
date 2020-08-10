`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:17 01/05/2019 
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

//inputs
input [7:0] switch;
input rst;
input clk;
input push_btn;

//outputs
output [7:0] led;

//registers
reg [7:0] led;
reg [2:0] count=3'b0;
reg [7:0] buffer = 8'b0;

//integers (misc)
integer i=0;

//rst : active low signal
always @(posedge clk or negedge rst) begin
	if(!rst)begin
		if(count[2:0]==3'b1)begin
			buffer[7:0]=switch[7:0];
		end else begin
			for(i=0;i<7;i=i+1)begin
				buffer[i]=buffer[i+1];
			end
		end
		count=count+1'b1;
		led[0]<=buffer[0];
		led[7:1]<=7'b0;
	end else begin
		buffer[7:0]=8'b0;
		led[7:0]<=8'b0;
	end
end
endmodule
