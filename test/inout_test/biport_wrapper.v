`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:34 02/22/2019 
// Design Name: 
// Module Name:    biport_wrapper 
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
module biport_wrapper(
		data_en,
		data_out,
		data_in,
		data_io
    );
input data_out,data_en;
output data_in;
inout data_io;
assign data_in = data_io;
assign data_io = data_en? data_out:1'bz;
endmodule
