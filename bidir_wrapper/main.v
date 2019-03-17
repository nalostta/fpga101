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

`define data_in1	data_in1
`define data_in2	data_in2
`define data_out1	data_out1
`define data_out2	data_out2
`define data_io1	data_io1
`define data_io2	data_io2
`define other1	other1
`define other2	other2
`define rst_clkgen	rst_clkgen
`define Locked	Locked
//
module main(
			clk,
			rst_clkgen,
			Locked,
			clk_2mhz,
			other1,
			other2,
			data_out1,
			data_out2,
			data_in1,
			data_in2,
			data_io1,
			data_io2,
			write_en1,
			read_en1,
			write_en2,
			read_en2
    );
	 
input	clk,rst_clkgen,data_in1,data_in2;
output data_out1,data_out2,clk_2mhz,Locked,other1,other2;
inout	data_io1,data_io2;
output write_en1,write_en2,read_en1,read_en2;

//
`else
//
`define data_in1	switch[7]
`define data_in2	switch[0]
`define data_out1	led[7]
`define data_out2	led[0]
`define data_io1	datalink1
`define data_io2	datalink2
`define other1	led[6]
`define other2	led[1]
`define rst_clkgen !push_btn
`define Locked	led[4]

module main(
			clk,
			push_btn,
			led,
			switch,
			datalink1,
			datalink2
    );
	 
inout datalink1,datalink2;
input clk,push_btn;
output[7:0] led;
input[7:0]	switch;

assign led[2]	=	1'b0;
assign led[3]	=	1'b0;
assign led[5]	=	1'b0;
//
`endif


wire clk_8mhz,Locked;
wire[1:0] divider_next;
reg[1:0] divider;
reg clk_2mhz;

clkgen _8MhzClk(
    .CLKIN_IN(clk), 
    .RST_IN(`rst_clkgen), 
    .CLKFX_OUT(clk_8mhz), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(), 
    .LOCKED_OUT(`Locked)
    );

bidir_wrapper3 partner1(
		.clk(clk_2mhz),
		.Locked(`Locked),
		.my_state_in(`data_in1),
		.my_state_out(`data_out1),
		.partner_state_out(`other2),
		.data_link(`data_io1),
		.write_en(write_en1),
		.read_en(read_en1)
    );

bidir_wrapper3 partner2(
		.clk(clk_2mhz),
		.Locked(`Locked),
		.my_state_in(`data_in2),
		.my_state_out(`data_out2),
		.partner_state_out(`other1),
		.data_link(`data_io2),
		.write_en(write_en2),
		.read_en(read_en2)
    );


	 
assign divider_next=Locked?	divider+1'b1:2'b0;

always @(posedge clk_8mhz)begin
	divider<=divider_next;
	if(divider<=2'b01)begin
		clk_2mhz<=1'b0;
	end else begin
		clk_2mhz<=1'b1;
	end
end

//
endmodule

/*
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
*/

/*

#this code doesn't seem to work...?

always @(posedge divider[1] or posedge Locked)begin
	if(Locked)begin
		clk_2mhz=~clk_2mhz;
	end else begin
		clk_2mhz=1'b0;
	end
end
*/