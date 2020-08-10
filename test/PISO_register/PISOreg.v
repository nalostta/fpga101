`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:29:50 01/05/2019 
// Design Name: 
// Module Name:    PISOreg 
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
module PISOreg(
	 parallel_input,
    serial_op,
	 clk_in
    );
	 
inout [7:0] parallel_input;
input clk_in;
output serial_op;
reg[7:0] Parallel_input;

always @(posedge clk_in)begin
	serial_op<=parallel_input[0];
	parallel_input[0]<=parallel_input[1];
	parallel_input[1]<=parallel_input[2];
	parallel_input[2]<=parallel_input[3];
	parallel_input[3]<=parallel_input[4];
	parallel_input[4]<=parallel_input[5];
	parallel_input[5]<=parallel_input[6];
	parallel_input[6]<=parallel_input[7];
end
endmodule
