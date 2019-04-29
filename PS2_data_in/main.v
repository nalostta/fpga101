`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:15 04/04/2019 
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
module main(
		clk,
		switch,
		led,
		pushbtn,
		RedLed,
		datalink,
		DigCh,
		SSDArray
    );
	 
input clk;
input pushbtn;
input[7:0] switch;

output[7:0] led,SSDArray;
output[2:0]	DigCh;
output RedLed;

inout[3:0] datalink;

wire CLK16,Locked;
wire datalink;
wire clocklink;
wire[7:0] SegData;
reg[9:0] clkdivider;

CLK16Mhz clkgen(
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKFX_OUT(CLK16), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(), 
    .LOCKED_OUT(Locked)
    );
		 
bfm_ps2_data_out sender(
		.clk(CLK16),
		.reset(!pushbtn),
		.ps2_data(datalink[1]),
		.ps2_clock(datalink[0]),
		.data_to_be_sent(switch)
    );
	 
fsm_ps2_in receive2(
		.clk(CLK16),
		.Locked(Locked),
		.ps2_clk(datalink[2]),
		.ps2_data(datalink[3]),
		.received_data(SegData),
		.received_data_en(),
		.debug(),
		.RedLed(RedLed)
    );
	 
seg7display SegDisp(
    .clk(clkdivider[9]),
	 .en(Locked),
	 .ssdarray(SSDArray),
    .Bin(SegData),
	 .DigCh(DigCh)
    );

//assign RedLed=1'b1;
assign led = 0;
//assign SegData=8'hff;

always @(posedge CLK16)begin
	if(Locked)begin
		clkdivider<=clkdivider+1'b1;
	end else begin
		clkdivider<=1'b0;
	end
end
endmodule
