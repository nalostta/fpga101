`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:30 01/23/2019 
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
	clk,
	switch,
	push_btn,
	SSDArray,
	DigCh
    );
	 
//inputs:
input clk;
input [7:0] switch;
input push_btn;

//outputs:
output [7:0] SSDArray;
output [2:0] DigCh; 
	
//registers 
reg [2:0] count=3'b000;
reg [2:0] DigCh=3'b011;
reg [7:0] delay;

//wires

sqroot_mem inst1(
  .clka(clk), // input clka
  .rsta(switch[7]), // input rsta
  .addra({count[2:0],switch[3:0]}), // input [7 : 0] addra
  .douta(SSDArray) // output [7 : 0] douta
);


always @(posedge clk)begin
	delay=delay+1'b1;
	if(delay==8'b1)begin
		DigCh[0]<=~count[0];
		DigCh[1]<=count[1]^count[0];
		DigCh[2]<=~count[1];
		count=count+1'b1;
		if(count[2:0]==3'b111)begin
			count[2:0]=3'b000;
		end
	end
end
endmodule
