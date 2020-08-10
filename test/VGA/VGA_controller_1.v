`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:18 01/26/2019 
// Design Name: 
// Module Name:    VGA_controller 
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

//800 horizontal counts
//525 vertical counts

module VGAcontroller(
		Locked,
		PixClk,
		Hsync,
		Vsync,
		Hcounter,
		Vcounter
    );

//
input Locked;
input PixClk;
//
output Hsync,Vsync;
output[9:0] Hcounter,Vcounter;
//
reg Hsync,Vsync;
reg[9:0] Hcounter,Vcounter;
//
wire[9:0] Hcounter_next,Vcounter_next;
wire Hsync_next,Vsync_next;
//
assign Hcounter_next = (Hcounter>=795)?	0:Hcounter+1'b1;
assign Vcounter_next = (Vcounter>=542)?	0:Vcounter+1'b1;
assign Hsync_next = (Hcounter<560)?	1'b1:((Hcounter<572)?	1'b0:1'b1);
assign Vsync_next = (Vcounter<940)?	1'b1:((Vcounter<492)?	1'b0:1'b1);

always @(posedge PixClk)begin
	if(!Locked)begin
		Hcounter<=10'b0;
		Vcounter<=10'b0;
		Hsync<=1'b0;
		Vsync<=1'b0;
	end else begin
		Hcounter<=Hcounter_next;
		Hsync<=Hsync_next;
		Vsync<=Vsync_next;
	end
end
endmodule

