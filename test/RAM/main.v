`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:08 01/05/2019 
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
    push_btn
    );

//address = switch[1:0]
//data = switch[5:2]

input [7:0] switch;
input clk,push_btn;
output [7:0] led;
reg [7:0] led;
reg [3:0] memory [3:0];

always @(switch)begin
	led[7:4]=4'b0;
	if(switch[7:6]==2'b00)begin
		led[3:0]=4'b1111;
	end
	else if(switch[7:6]==2'b01)begin
		led[3:0]=memory[switch[1:0]];
		//led[7:4]=4'b0;
	end
	else if(switch[7:6]==2'b10)begin
		memory[switch[1:0]]=switch[5:2];
		led[3:0]=switch[5:2];
		//led[7:4]=4'b0;
	end
	else begin
		led[7:0]=8'b10101010;
	end
end
endmodule
