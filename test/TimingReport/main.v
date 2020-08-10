`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:22 01/25/2019 
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
		led,
		push_btn,
		clk
    );
	 
input[7:0] switch;
input push_btn;
input clk;
output[7:0] led;

reg[7:0] led;
reg[7:0] temp;

always @(posedge clk)begin
	temp[0]<=switch[0]&&switch[1];
	temp[1]<=switch[2]||switch[3];
	temp[2]<=~switch[4];
	led[0]<=temp[0]&&temp[1]||temp[3];
	led[2:1]<=temp[1]+temp[2]+temp[2];
	led[7:3]<=5'b0;
end
endmodule
