`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:17:19 02/06/2019 
// Design Name: 
// Module Name:    Horizontal_stripes 
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
module Horizontal_stripes(
    );

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:49 02/04/2019 
// Design Name: 
// Module Name:    pix_Controller 
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

//RGB stripe values
`define	RED 8'b11100000
`define	GREEN 8'b00011100
`define	BLUE 8'b00000011
`define	CYAN 8'b00011111
`define	PINK 8'b11100011
`define	WHITE 8'b11111111
`define	BLACK 8'b0
`define	YELLOW 8'b11111100
//

module VerticalStripes(
		Hcounter,
		Vcounter,
		PixData
		
    );

//inputs:
input[9:0] Hcounter,Vcounter;
//outputs:
output[7:0] PixData;
//frame logic
assign	PixData=(Hcounter<80)? `BLUE:(Hcounter<160?	`GREEN:(Hcounter<240? `CYAN:(Hcounter<320? `RED:(Hcounter<400? `PINK:(Hcounter<480? `YELLOW:(Hcounter<560? `WHITE:`BLACK))))));
endmodule



