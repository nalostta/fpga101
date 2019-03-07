`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:01 02/05/2019 
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
		led,
		Red,
		Green,
		Blue,
		Hsync,
		Vsync,
		push_btn,
		switch
    );
//inputs
input clk;
input push_btn;
input[7:0] switch;
//outputs:
output[7:0] led;
output Hsync,Vsync;
output[2:0] Red,Green;
output[1:0] Blue;
//regs:
reg[20:0] count;
reg[7:0] led;
//wires
wire PixClk,Locked,CharBit,CharRst;
wire[20:0] count_next;
wire[9:0] Hcounter,Vcounter,Hcen,Vcen;
wire[7:0] PixData,CharData;

clkgen clk25(
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(PixClk), 
    .LOCKED_OUT(Locked)
    );
	 
VGAcontroller controller(
		.Locked(Locked),
		.PixClk(PixClk),
		.Hsync(Hsync),
		.Vsync(Vsync),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter)
    );
	 
pix_Controller framegen(
		.PixData(PixData),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.Red(Red),
		.Green(Green),
		.Blue(Blue)
    );

circle C1(
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.PixData(PixData),
		.Hcentre(320),
		.Vcentre(240),
		.radius(switch)
    );

assign count_next=count+1'b1;

always @(posedge PixClk or negedge Locked)begin
	if(!Locked)begin
		count<=0;
	end else begin
		count<=count_next;
		led[0]<=count[20];
		led[7:1]<=7'b0;
	end
end
endmodule
