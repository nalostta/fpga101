`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:48:34 01/31/2019 
// Design Name: 
// Module Name:    VGA_control 
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

`define HSyncPulse 10'b1010010000
`define HBackPorch 10'b1011110000
`define HRollOver 10'b1100100000
`define VSyncPulse 10'b0111101010
`define VBackPorch 10'b0111101100
`define VRollOver 10'b1000001101

module VGA_control(
		Hsync,
		Vsync,
		PixClk,
		Locked,
		Hcounts,
		Vcounts
    );
	
//inputs:
input PixClk;
input Locked;
//outputs:
output[9:0] Hcounts;
output[9:0] Vcounts;
output Hsync;
output Vsync;
//regs:
reg[9:0] Hcounts;
reg[9:0] Vcounts;
reg Hsync;
reg Vsync;

/*
1010010000=656
1011110000=752
1100100000=800

0111101010=490
0111101100=492
1000001101=525
*/

always @(posedge PixClk or posedge Locked)begin
	if(Locked)begin
		//stable clk input
		Hcounts<=Hcounts+1'b1;
		if(Hcounts[9:0]>=0 && Hcounts[9:0]<656)begin						
			Hsync<=1'b1;
		end else if(Hcounts[9:0]>=656 && Hcounts[9:0]<752)begin 
			Hsync<=1'b0;
		end else if(Hcounts[9:0]>=752 && Hcounts[9:0]<799)begin
			Hsync<=1'b1;
		end else if(Hcounts[9:0]==800)begin
			Hcounts<=10'b0;
			Vcounts<=Vcounts+1'b1;
		end
		
		if(Vcounts<490 && Vcounts>=0)begin						
			Vsync<=1'b1;
		end else if(Vcounts<492 && Vcounts>=490)begin
			Vsync<=1'b0;
		end else if(Vcounts<525 && Vcounts>=491)begin
			Vsync<=1'b1;
		end else if(Vcounts>=525)begin
			Vcounts<=10'b0;
		end
		
	end else begin
		//reset state
		Hcounts<=0;
		Vcounts<=0;
		Hsync<=1'bz;
		Vsync<=1'bz;
	end
end
endmodule

/**/
