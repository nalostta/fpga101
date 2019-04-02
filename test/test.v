`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:00 03/27/2019 
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

reg clk_in,inp;
wire data_io;

main DUT(
		.switch(inp),
		.clk(clk_in),
		.led(),
		.datalink1(data_io),
		.datalink2(data_io)
    );

always #20 clk_in<=~clk_in;

initial begin
	clk_in<=1'b0;
end
endmodule
