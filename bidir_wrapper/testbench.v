`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:15 02/22/2019 
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
	 
reg data_in1,data_in2,clk_in,clk_rst_in;
wire data_out1,data_io,data_out2,clk_2mhz,Locked,other1,other2;

main main_wrapper(
			.clk(clk_in),
			.rst_clkgen(clk_rst_in),
			.Locked(Locked),
			.clk_2mhz(clk_2mhz),
			.other1(other1),
			.other2(other2),
			.data_out1(data_out1),
			.data_out2(data_out2),
			.data_in1(data_in1),
			.data_in2(data_in2),
			.data_io1(data_io),
			.data_io2(data_io)
    );

always #20 clk_in=~clk_in;
	 
initial begin
	clk_in<=1'b1;
	clk_rst_in<=1'b0;
	data_in1<=0;
	data_in2<=0;
	#4000 data_in1=1'b1;
	#4000 $finish;
end
endmodule
