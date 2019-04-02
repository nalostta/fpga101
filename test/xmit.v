`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:42 03/26/2019 
// Design Name: 
// Module Name:    xmit 
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
module xmit(
		clk_50khz,
		Locked,
		datalink,
		trig_in,
		my_state_out
    );
	 
input clk_50khz,Locked,trig_in;

output my_state_out;

inout datalink;

reg state,data_en;
reg[1:0] count;

assign datalink = data_en? 1'b0:1'bz;
	 
always @(posedge clk_50khz)begin
	if(Locked)begin
		if(trig_in!=state)begin
			data_en<=1'b1;
			state<=trig_in;
		end else if(count==2'b01)begin
			data_en<=1'b0;
		end
	end else begin
		data_en<=1'b0;
		state<=1'b0;
	end
end

always @(posedge clk_50khz or posedge data_en)begin
	if(data_en)begin
		count<=count+1'b1;
	end else begin
		count<=2'b0;
	end
end
endmodule
