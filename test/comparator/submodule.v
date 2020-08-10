`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:15 01/04/2019 
// Design Name: 
// Module Name:    comp_module 
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
module comp_module(
    input [3:0] A,
    input [3:0] B,
    output AgtB,
    output BgtA,
    output AeqB
    );

assign AeqB = (~(A[3]^B[3]))&&(~(A[2]^B[2]))&&(~(A[1]^B[1]))&&(~(A[0]^B[0]));
assign AgtB = (A[3]&&~B[3])||((A[3]||~B[3])&&((A[2]&&~B[2])||((A[2]||~B[2])&&((A[1]&&~B[1])||((A[1]||~B[1])&&(A[0]&&~B[0]))))));
assign BgtA = (~AgtB)&&(~AeqB);
endmodule
