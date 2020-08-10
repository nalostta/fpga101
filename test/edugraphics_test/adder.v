`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: meh...
// Engineer: Nalostta
// 
// Create Date:    02:01:49 01/04/2019 
// Design Name: 
// Module Name:    adder 
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
module adder(
    input [7:0] in,
    output [3:0] out
    );

assign out[3:0] = in[0] + in[1] + in[2] + in[3] +
						in[4] + in[5] + in[6] + in[7];

endmodule
