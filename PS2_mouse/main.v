`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:53 04/04/2019 
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
			PS2_CLK,
			PS2_DAT,
			led,
			datalink1,
			datalink2
    );

output[7:0] led;
inout PS2_CLK,PS2_DAT;
inout datalink1,datalink2;

assign led[7:0]=8'h01;
assign datalink1=PS2_CLK;
assign datalink2=PS2_DAT;
endmodule
