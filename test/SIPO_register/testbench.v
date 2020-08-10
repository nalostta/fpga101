`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:05 01/15/2019 
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
	 
reg clk_in;
reg rst_in;
reg serial_in;

wire [7:0] led;

main inst(
    .switch(),
    .led(led),
    .clk(clk_in),
    .push_btn(serial_in),
	 .rst(rst_in)
    );

//-----------------clock input--------------
always begin
	#20 clk_in=~clk_in;
end
//-----------------clock input--------------

initial begin
	rst_in=1'b1;
	clk_in=1'b0;
	serial_in=1'b0;
	$display("<begin>");
	#40 rst_in=1'b0;
	#40 serial_in=1'b1;
	#600;
	$finish;
end
endmodule
