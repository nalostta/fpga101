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
		push_btn
    );
//inputs
input clk;
input push_btn;
//outputs:
output[7:0] led;
output Hsync,Vsync;
output[2:0] Red,Green;
output[1:0] Blue;
//regs:
reg[20:0] count;
reg[7:0] led;
//wires
wire	PixClk,Locked,CharBit,CharRst;
wire[20:0]	count_next;
wire[9:0]	Hcounter,Vcounter,Hcen,Vcen;
wire[7:0]	PixData;
wire[11:0]	CharData;
	 
// Instantiate the module
clkgen instance_name (
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
	 
text_gen message(
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.PixData(PixData),
		.CharData(CharData),
		.Bin(CharBit),
		.CharRst(CharRst)
    );
	 
CharBank Char(
		 .clka(PixClk), // input clka
	    .rsta(CharRst), // input rsta
	    .addra(CharData), // input [9 : 0] addra
	    .douta(CharBit) // output [0 : 0] douta
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
