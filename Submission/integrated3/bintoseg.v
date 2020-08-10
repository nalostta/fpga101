`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:31:40 01/06/2019 
// Design Name: 
// Module Name:    bintoseg 
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
module bintoseg(
    ssdarray,
    bin
    );
	 
input [3:0] bin;
output [7:0] ssdarray;
reg [7:0] ssdarray;

always @(*)
begin
	case(bin)
		0:ssdarray=8'h03;
		1:ssdarray=8'h9F;
		2:ssdarray=8'h25;
		3:ssdarray=8'h0D;
		4:ssdarray=8'h99;
		5:ssdarray=8'h49;
		6:ssdarray=8'h41;
		7:ssdarray=8'h1F;
		8:ssdarray=8'h01;	
		9:ssdarray=8'h19;
		10:ssdarray=8'h11;
		11:ssdarray=8'hC1;
		12:ssdarray=8'hE5;
		13:ssdarray=8'h85;
		14:ssdarray=8'h61;
		15:ssdarray=8'h71;
	endcase
end
endmodule
