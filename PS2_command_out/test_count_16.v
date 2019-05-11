`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:41:27 05/10/2019 
// Design Name: 
// Module Name:    test_count_16 
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
module test_count_16(
		clk,
		Locked,
		status
    );
	 
/*
when trigger = 1, count;
when count = reached, status = 1;
if both status = 1 , led = on else off; 
*/

	 
input clk,Locked;
output status;

reg [11:0] count;

always @(posedge clk or posedge Locked)begin
	if(Locked)begin
	if(status==1'b0) count<=count+1'b1;
	else count<=0;
	end else count<=0;
end

assign status = count == 12'h640;

endmodule
