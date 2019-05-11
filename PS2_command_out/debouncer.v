`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:34 05/10/2019 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
		clk,
		pushbtn,
		trigger_out
    );

input clk,pushbtn;
output trigger_out;

reg[7:0] down_count;
reg disable_input,trigger_out;

always @(posedge clk)begin
	if(pushbtn&&!disable_input)begin
		trigger_out<=1'b1;
		disable_input<=1'b1;
	end else if(down_count==8'hff)begin
		trigger_out<=1'b0;
		disable_input<=1'b0;
	end else trigger_out<=1'b0;
end

always @(posedge clk)begin
	if(disable_input)down_count<=down_count+1'b1;
	else down_count<=8'h0;
end
endmodule
