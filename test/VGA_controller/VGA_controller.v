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
		locked,
		pixel_clk,
		hsync,
		vsync,
		hcounter,
		vcounter
    );

input locked;
input pixel_clk;
output hsync;
output vsync;
output[9:0] hcounter;
output[9:0] vcounter;

reg hsync;
reg vsync;
reg[9:0] hcounter;
reg[9:0] vcounter;


always @(posedge pixel_clk or negedge locked)begin
	hcounter<=hcounter+1'b1;
	if(!locked)begin
		//Put your reset code
		hcounter<=10'b0;
		vcounter<=10'b0;
		hsync<=1'b0;
		vsync<=1'b0;
	end else begin
		//put your functional code
		if(hcounter<656)begin
			hsync<=1'b1;
		end else begin
			if(hcounter<752)begin
				hsync<=1'b0;
			end else begin
				if(hcounter<799)begin
					hsync<=1'b1;
				end else begin
					hcounter<=10'b0;
					vcounter<=vcounter+1'b1;
				end
			end
		end
		//
		if(vcounter<490)begin
			vsync<=1'b1;
		end else begin
			if(vcounter<492)begin
				vsync<=1'b0;
			end else begin
				if(vcounter<525)begin
					vsync<=1'b1;
				end else begin
					vcounter<=10'b0;
				end
			end
		end
	end
end
endmodule


/*
always @(posedge pixel_clk or posedge locked)
	begin
		if(locked)
		begin
			hcounter=hcounter+1'b1;
			case(hcounter)
				10'b0:				hsync<=1'b1; //d<0>
				10'b1010010000:	hsync<=1'b0; //d<656>
				10'b1011110000:	hsync<=1'b1; //d<752>
				10'b1100100000:begin		  		 //d<800>
					hcounter=10'b0;
					vcounter=vcounter+1'b1;
				end
			endcase
			case(vcounter)
				10'b0:				vsync<=1'b1; 		//d<0>
				10'b0111101010:	vsync<=1'b0; 		//d<490>	
				10'b0111101100:	vsync<=1'b1;		//d<492>
				10'b1000001101:	vcounter=10'b0;	//d<525>
			endcase
		end else begin
			hcounter=10'b0;
			vcounter=10'b0;
		end
	end*/