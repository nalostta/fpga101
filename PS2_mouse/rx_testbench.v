`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:09 06/22/2019 
// Design Name: 
// Module Name:    rx_testbench 
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
module rx_testbench(
    );
	 
reg clk,Locked,rx_en;
reg cout,dout,clk_en,data_en;
wire PS2_CLK,PS2_DAT;
wire rx_complete;
wire [7:0] received_data;
wire [2:0] curr_state,next_state;
wire negedge_clk;
wire [1:0] errorcodes;
wire [3:0]	bitcount;

pullup(PS2_CLK);
pullup(PS2_DAT);

assign PS2_CLK	=	clk_en?	cout:1'bz;
assign PS2_DAT	=	data_en?	dout:1'bz;

RX_V2 R1_v2(
	.clk(clk),
	.Locked(Locked),
	.rx_en(rx_en),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.rx_complete(rx_complete),
	.received_data(received_data),
	.ByteErrorCode(errorcodes),
	.debug_curr_state(curr_state),
	.debug_next_state(next_state),
	.debug_negedge(negedge_clk),
	.debug_bitcount(bitcount)
   );
/*
MouseReceiver R_TEST(
	.RESET(1'b0),
	.CLK(clk),
	.CLK_MOUSE_IN(PS2_CLK),
	.DATA_MOUSE_IN(PS2_DAT),
	.READ_ENABLE(rx_en),
	.BYTE_READ(received_data),
	.BYTE_ERROR_CODE(),
	.BYTE_READY(rx_complete),
	.debug(curr_state),
	.negedge_clk(negedge_clk)
);*/
	
always #20 clk=~clk;

initial begin
	clk=1;
	rx_en=0;
	Locked=0;
	clk_en=0;
	data_en=0;
	dout=0;
	cout=0;
	#80 Locked=1'b1;
	#80 rx_en=1'b1;
	
	#100 
	clk_en=1'b1;
	cout=1'b1;
	data_en=1'b1;
	dout=1'b0;
	#80
	cout=1'b0;
	#8000 cout=1'b1;
	
	#8000 dout=1'b1;
	#80
	cout=1'b0;
	
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#8000 cout=1'b0;
	#8000 cout=1'b1;
	#90000 $finish;
end
endmodule
