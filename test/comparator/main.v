`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:57 01/04/2019 
// Design Name: 
// Module Name:    main 
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
module main(
    input [7:0] switch,
    output [7:0] led,
    input clk,
    input push_btn,
	 output RedLed,
	 output GreenLed,
	 output BlueLed
    );

comp_module inst1(
	.A(switch[7:4]),
	.B(switch[3:0]),
	.AgtB(BlueLed),
	.AeqB(GreenLed),
	.BgtA(RedLed)
	);
		
assign led[7:0] = 8'b0;

endmodule
