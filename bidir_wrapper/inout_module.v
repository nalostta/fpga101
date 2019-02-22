`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:03:49 02/22/2019 
// Design Name: 
// Module Name:    inout_module 
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
module inout_module(
		data_en,
		data_out,
		data_in,
		data_io
    );

input data_en,data_out;	//data_out : data to be sent to the inout line.
output data_in;			//data read from the bi-directional line
inout data_io;

//inout logic
assign data_in	=	data_io;
assign data_io	=	data_en?	data_out:1'bz;

endmodule
