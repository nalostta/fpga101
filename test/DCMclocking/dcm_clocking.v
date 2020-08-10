`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:44:44 01/17/2019 
// Design Name: 
// Module Name:    dcm_clocking 
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
module dcm_clocking(
    input clkin,
	 input reset,
    output clk_0,
    output clk_div2,
    output clk_mult2,
    output locked
    );
	 
dcm_clk instance_name (
    .CLKIN_IN(clkin), 
    .RST_IN(reset), 
    .CLKDV_OUT(clk_div2), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(clk_0), 
    .CLK2X_OUT(clk_mult2), 
    .LOCKED_OUT(locked)
    );




endmodule
