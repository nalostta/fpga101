`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:06:28 05/12/2019 
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

reg[7:0] switch;
reg pushbtn;
reg clk;

wire clocklink,datalink;

main DUT(
		.clk(clk),
		.switch(switch),
		.pushbtn(pushbtn),
		.led(),
		.clocklink(clocklink),
		.datalink(datalink)
		);
		
always #20 clk<=~clk;

	 
reg clk_en,data_en,clkout,dout;

assign clocklink = clk_en?	clkout:1'bz;
assign datalink	=	data_en?	dout:1'bz;

pullup(clocklink);
pullup(datalink);

initial begin
	clk=1'b1;
	clk_en=1'b0;
	clkout=1'b0;
	dout=1'b0;
	data_en=1'b0;
	pushbtn=1'b1;
	switch=8'hf4;
	#10000 pushbtn=1'b0;
	#1000 pushbtn=1'b1;
	#198000	clkout = 1'b0;
	clk_en=1'b1;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#190000	clkout = 1'b1;
	#190000	clkout = 1'b0;
	#198000	clkout = 1'b1;
	dout	 =	1'b0;
	data_en=1'b1;
	#198000	clkout = 1'b0;
	data_en=1'b0;
	#198000	clkout = 1'b1;
	#990000 $stop;
end
endmodule

