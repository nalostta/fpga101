`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:47 01/16/2019 
// Design Name: 
// Module Name:    testbench 
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
module testbench(
    );
	 
//inputs
reg [1:0] address;
reg readE;
reg clk_in;
reg rst_in;

//outputs
wire [3:0] data;

main inst(
		.addr(address),
		.data(data),
		.clk(clk_in),
		.reset(rst_in),
		.en(readE)
    );
	 
always begin #20 clk_in = ~clk_in; 
end
	 
initial begin
	clk_in=1'b0;
	rst_in=1'b1;
	address=2'b0;
	readE=1'b0;
	#40 readE=1'b1;
	#40 rst_in=1'b0;
	$display("<start>");
	#20;
	//read all
	#40 readE=0'b1;
	#40 address=2'b00;
	#41 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	#40 address=2'b01;
	#41 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	#40 address=2'b10;
	#41 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	#40 address=2'b11;
	#41 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	#100;
	$finish;
end
endmodule
