`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:39 04/12/2019 
// Design Name: 
// Module Name:    test 
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
module test(
    );

reg clk,reset;
wire op;

main DUT(
		.clk(clk),
		.reset(reset),
		.op(op)
    );

always #1 clk=~clk;

initial begin
	reset = 1'b0;
	#10 reset = 1'b1;
	clk	=	1'b1;
	$monitor("%d",op);
end
endmodule
