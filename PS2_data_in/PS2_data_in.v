`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:13:28 04/05/2019 
// Design Name: 
// Module Name:    ps2_data_in 
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

/*

clk[input]						:	main clock signal
reset[input]					:	main reset signal
start_receiving_data[input]:	control signal which starts the receive engine
ps2_clk_posedge[input]		:	positive edge of ps2_clk (received data is captured at positive edge of the ps2_clk)
ps2_data[input]				:	ps2_data line
received_data[output]		:	received data
received_data_en[output]	:	received data enable

*/
//BIT_TIMEOUT 2ms

module ps2_data_in(
		clk,
		ps2clk,
		ps2data,
		data,
		en
    );
	 
input clk,en;
inout ps2data,ps2clk;
output[7:0] data;

/*
all the states : 
IDLE
START
DATA
PARITY
END

detect start bit

code dependability :
//T---T : tested (in isolation).
//Q---Q : quarantined (needs to be observed closely or tested in isolation)
//A---A : untested code written assuming it will work.
*/


assign _ps2data	=	ps2data;
assign _ps2clk		=	ps2clk;
reg[9:0] ClkDivider;
reg[7:0] buffer,data;
integer i,j;

//A-----------------------------------------A
//		simplest clock based shift register
always @(negedge _ps2clk)begin
	if(en)begin
		for(i=0;i<=6;i=i+1) buffer[i]<=buffer[i+1];
		buffer[7]<=_ps2data;
	end else begin
		buffer[7:0]<=8'b0;
	end
end
//A-----------------------------------------A

always @(posedge clk)begin
	if(en)	for(j=0;j<=7;j=j+1) data[j]<=buffer[j];
	else data<=8'b0;
end
endmodule
