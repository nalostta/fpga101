`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:15 01/11/2019 
// Design Name: 
// Module Name:    test_tb 
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
module test_tb(
    );

wire [7:0] led;
reg [7:0] switch;

edugraphics_test design_inst(
    .switch(switch),
    .led(led),
    .push_btn(),
    .clk()
    );

initial begin
	switch = 8'b0;
	#26000;
	$finish;
end

always begin
	#100;
	switch[7:0] = switch[7:0] + 1;
	$display("switch = %b, led=%d",switch[7:0],led[7:0]);
end

endmodule
