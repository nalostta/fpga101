`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:10 02/12/2019 
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

`define _test

`ifdef _test
module main(
		clk,
		push_btn,
		led,
		switch,
		datalink1,
		datalink2,
		clk_8mhz,
		clk_2mhz,
		rst_2mhz
    );
	 
output clk_8mhz,clk_2mhz;
input rst_2mhz;
`else	
module main(
		clk,
		push_btn,
		led,
		switch,
		datalink1,
		datalink2
    );
`endif
//
input push_btn,clk;
input[7:0] switch;
//
inout datalink1,datalink2;
//
output[7:0]	led;
//
reg by4;
reg clk_2mhz;
//
wire by4_next;
wire clk_8mhz,Locked,reset;

// Instantiate the module
clk_gen _8Mhz (
    .CLKIN_IN(clk), 
    .RST_IN(reset), 
    .CLKFX_OUT(clk_8mhz), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT(), 
    .LOCKED_OUT(Locked)
    );


bidir_test Partner1(
		.my_state_in(switch[0]),
		.my_state_out(led[0]),
		.partner_state_out(led[2]),
		.data_link(datalink1),
		.clk(clk_2mhz),
		.reset(Locked)
    );
	 
bidir_test Partner2(
		.my_state_in(switch[7]),
		.my_state_out(led[7]),
		.partner_state_out(led[5]),
		.data_link(datalink2),
		.clk(clk_2mhz),
		.reset(Locked)
    );
	 
assign by4_next=by4+1'b1;
assign led[1]=0;
//
assign led[3]=Locked;
assign led[4]=clk_2mhz;
//
assign led[6]=0;
assign reset=~push_btn;
	 
always @(posedge clk_8mhz or posedge rst_2mhz)begin
	if(rst_2mhz)begin
		by4<=by4_next;
		if(by4==2'b1)begin
			clk_2mhz<=~clk_2mhz;
		end
	end else begin
		by4<=2'b0;
		clk_2mhz<=1'b0;
	end
end
endmodule
