`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:18 02/12/2019 
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

reg clk_in,reset,data_in1,data_in2,rst_2mhz;

wire datalink,self1,self2,other1,other2,g1,g2,clk_8mhz,clk_2mhz;
wire[1:0] g3;
wire[5:0] g4;

main testmain(
		.clk(clk_in),
		.push_btn(reset),
		.led({self2,g1,other1,g3,other2,g2,self1}),
		.switch({data_in2,g4,data_in1}),
		.datalink1(datalink),
		.datalink2(datalink),
		.clk_8mhz(clk_8mhz),
		.clk_2mhz(clk_2mhz),
		.rst_2mhz(rst_2mhz)
    );

always #20 clk_in=~clk_in;

initial begin
clk_in=1'b0;
reset=1'b1;
rst_2mhz=1'b1;
#60 reset=1'b0;
#1000 rst_2mhz=1'b0;
#400 data_in1=1'b0;
//data_in2=1'b1;
#4000 data_in1=1'b1;
end	 
endmodule
