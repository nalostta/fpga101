`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:45 03/21/2019 
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
		switch,
		clk,
		led,
		datalink1,
		datalink2
    );
	 
input[7:0] switch;
input clk;
output[7:0] led;
inout datalink1,datalink2;

reg[3:0] divider;
wire[3:0] divider_next;

wire Locked,clk_8mhz;
reg clk_50khz;

//assign led[4] = Locked;
assign led[6:4]=3'b0;
assign led[3:1]=4'b0;
assign divider_next=Locked?	divider+1'b1:2'b0;
//assign led[7] = 1'b0;

clkgen instance_name (
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKFX_OUT(clk_8mhz), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(), 
    .LOCKED_OUT(Locked)
    );
	 
rxc submodule(
		.clk_50khz(clk_50khz),
		.Locked(Locked),
		.led(led[0]),
		.datalink(datalink2)
);	

xmit inst1(
		.clk_50khz(clk_50khz),
		.Locked(Locked),
		.datalink(datalink1),
		.trig_in(switch[0]),
		.my_state_out(led[7])
 );	 

//-----------------------clock divider--------------------
always @(posedge clk_8mhz)begin
	divider<=divider_next;
	if(divider==4'b1000)begin
		clk_50khz<=1'b0;
	end else if(divider==4'b0)begin
		clk_50khz<=1'b1;
	end
end
//-----------------------clock divider--------------------
endmodule
