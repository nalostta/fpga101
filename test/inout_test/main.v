`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:08 02/22/2019 
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
`define test
`ifdef test
module main(
		data_en1,
		data_en2,
		data_out1,
		data_out2,
		data_in1,
		data_in2,
		data_io1,
		data_io2
    );
	 
input data_out1,data_out2,data_en1,data_en2;
output data_in2,data_in1;
inout data_io2,data_io1;
	 
`else
module main(
		clk,
		switch,
		led
    );
`endif

biport_wrapper partner1(
		.data_en(data_en1),
		.data_out(data_out1),
		.data_in(data_in1),
		.data_io(data_io1)
    );

biport_wrapper partner2(
		.data_en(data_en2),
		.data_out(data_out2),
		.data_in(data_in2),
		.data_io(data_io2)
    );


endmodule
