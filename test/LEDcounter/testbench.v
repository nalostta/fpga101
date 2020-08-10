`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:52 01/12/2019 
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
module testbench();

//inputs to te DUT
reg test_clk;
reg reset;

//output frm the DUT
wire [7:0] led_out;
	
main main_inst(
    .switch(),
	 .led(led_out),
    .push_btn(),
    .clk(test_clk),
	 .rst_in(reset)
    );

initial begin
	test_clk=1'b0;
	reset=1'b1;
	#20 reset=1'b0;
	#260000000;
	$finish;
end

always begin
	#20 test_clk=~test_clk;
end
endmodule
