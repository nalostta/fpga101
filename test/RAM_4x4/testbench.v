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
reg writeE;
reg [3:0] datain;
reg rst_in;
reg clk_in,en;
//outputs
wire [3:0] dataout;

main inst1(
		.addr(address),
		.datain(datain),
		.dataout(dataout),
		.clk(clk_in),
		.reset(rst_in),
		.en(en),
		.writeEn(writeE)
    );
	 
always begin #20 clk_in=~clk_in;
end
	 
initial begin
	clk_in=1'b1;
	rst_in=1'b0;
	en=1'b1;
	address=2'b0;
	writeE=1'b0;
	datain=4'b0;
	$display("<start>");
	#200;
	
	address=2'b10;
	#100 datain=4'b1001;
	#100 writeE=1'b1;
	#100 writeE=1'b0;
	
	address=2'b11;
	#100 datain=4'b1111;
	#100 writeE=1'b1;
	#100 writeE=1'b0;
	
	address=2'b01;
	#100 datain=4'b0010;
	#100 writeE=1'b1;
	#100 writeE=1'b0;
	
	address=2'b00;
	#100 datain=4'b0110;
	#100 writeE=1'b1;
	#100 writeE=1'b0;
	
	//read all
	#100 address=2'b00;
	#100 $display("<read>address[%b] data=[%b]",address,dataout[3:0]);
	#100 en=1'b0;
	#100 en=1'b1;
	
	$finish;
end
endmodule
