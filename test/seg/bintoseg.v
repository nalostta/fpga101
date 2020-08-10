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
    output [7:0] ssdarray,
    input [0:3] bin,
	 input active
    );

always @(posedge active) begin
 ssdarray[7]<=1'b1;
 ssdarray[6]<=(~bin[0]&&~bin[1]&&~bin[2])||(~bin[0]&&bin[1]&&bin[2]&&bin[3])||(bin[0]&&bin[1]&&~bin[2]&&~bin[3]);
 ssdarray[5]<=(bin[0]&&bin[1]&&~bin[2]&&bin[3])||(~bin[0]&&~bin[1]&&bin[3])||(~bin[0]&&~bin[1]&&bin[2])||(~bin[0]&&bin[2]&&bin[3]);
 ssdarray[4]<=(~bin[0]&&bin[3])||(~bin[1]&&~bin[2]&&bin[3])||(~bin[0]&&bin[1]&&~bin[2]);
 ssdarray[3]<=(~bin[0]&&bin[1]&&~bin[2]&&~bin[3])||(~bin[0]&&~bin[1]&&~bin[2]&&bin[3])||(bin[0]&&~bin[1]&&bin[2]&&~bin[3])||(bin[1]&&bin[2]&&bin[3]);
 ssdarray[2]<=(~bin[0]&&~bin[1]&&bin[2]&&~bin[3])||(bin[0]&&bin[1]&&bin[2])||(bin[0]&&bin[1]&&~bin[3]);
 ssdarray[1]<=(~bin[0]&&bin[1]&&~bin[2]&&bin[3])||(bin[0]&&bin[2]&&bin[3])||(bin[1]&&bin[2]&&~bin[3])||(bin[0]&&bin[1]&&~bin[3]);
 ssdarray[0]<=((~bin[0]&&~bin[2])&&(bin[1]^bin[3]))||(bin[0]&&bin[3]&&(bin[1]^bin[2]));
end
endmodule
