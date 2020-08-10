`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:08 01/26/2019 
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
		Hsync,
		Vsync,
		Red,
		Green,
		Blue,
		led,
		Sense
    );

//inputs:
input clk;
//outputs:
output Hsync;
output Vsync;
output[2:0] Red;
output[2:0] Green;
output [1:0] Blue;
output [7:0] led;
output Sense;
//wire
wire PixClk;
wire locked;
wire Hsync;
wire Vsync;
//regs:
reg reset;
reg[30:0] count;
reg[7:0] RGBinp;
//---------------------------------
wire[9:0] hcounter;
wire[9:0] vcounter;
//---------------------------------

clkgen inst(
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(PixClk), 
    .LOCKED_OUT(locked)
    );

VGAcontroller controller1(
		.locked(locked),
		.pixel_clk(PixClk),
		.hsync(Hsync),
		.vsync(Vsync),
		.hcounter(hcounter),
		.vcounter(vcounter)
    );

generateRGB RedScreen(
		.RedPix(Red),
		.GreenPix(Green),
		.BluePix(Blue),
		.Hcount(hcounter),
		.Vcount(hcounter),
		.RGBinp(RGBinp)
    );
	 
assign led[0]=locked;
assign led[7:1]=7'b0;
assign Sense=PixClk;

always @(posedge PixClk)begin
	count=count+1'b1;
	RGBinp[7:0]<=count[22:15];
end
/*
always @(posedge PixClk or posedge locked)
	begin
		if(locked)
		begin
			hcounter=hcounter+1'b1;
			case(hcounter)
				10'b0:				Hsync=1'b1; //d<0>
				10'b1010010000:	Hsync=1'b0; //d<656>
				10'b1011110000:	Hsync=1'b1; //d<752>
				10'b1100100000:begin		  		//d<800>
					hcounter=10'b0;
					vcounter=vcounter+1'b1;
				end
			endcase
			case(vcounter)
				10'b0:				Vsync=1'b1; 		//d<0>
				10'b0111101010:	Vsync=1'b0; 		//d<490>	
				10'b0111101100:	Vsync=1'b1;			//d<492>
				10'b1000001101:	vcounter=10'b0;	//d<525>
			endcase
		end else begin
			hcounter=10'b0;
			vcounter=10'b0;
		end
	end*/
endmodule
