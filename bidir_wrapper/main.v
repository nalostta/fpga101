`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:03:13 02/22/2019 
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
`define _testbench

`ifdef _testbench
//
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
	 
input	data_out1,data_out2,data_en1,data_en2;
output	data_in1,data_in2;
inout	data_io1,data_io2;
//
`else
//

//
`endif
 
inout_module	dev1(
		.data_en(data_en1),
		.data_out(data_out1),
		.data_in(data_in1),
		.data_io(data_io1)
    );
	 
inout_module	dev2(
		.data_en(data_en2),
		.data_out(data_out2),
		.data_in(data_in2),
		.data_io(data_io2)
	);

endmodule
