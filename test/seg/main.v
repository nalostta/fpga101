`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:39:18 01/06/2019 
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
	SSDArray,
	DigCh,
	switch,
	push_btn,
	led,
	clk
    );
output [7:0] SSDArray;
output [7:0] led;
input [7:0] switch;
input clk;
input push_btn;
output [2:0] DigCh;
reg [7:0] led;
reg [23:0] count;
reg [2:0] DigCh;

bintoseg inst1(
    .ssdarray(SSDArray),
    .bin(count[23:20]),
	 .active(DigCh[0])
    );
	 
bintoseg inst2(
    .ssdarray(SSDArray),
    .bin(count[19:16]),
	 .active(DigCh[1])
    );
	 
bintoseg inst3(
    .ssdarray(SSDArray),
    .bin(count[15:12]),
	 .active(DigCh[2])
    );
	 
always @(posedge clk)begin
	count=count+1'b1;
	led[7:0]<=8'b0;
	DigCh[2:0]<=count[2:0];
	
end
endmodule
