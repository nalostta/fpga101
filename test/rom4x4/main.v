`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:25:52 01/18/2019 
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
		clk,
		push_btn,
    );


input [7:0] switch;
input clk;
input push_btn;
output [7:0] led;

wire [3:0] dout;

rom your_instance_name (
  .clka(clk), // input clka
  .rsta(switch[6]), // input rsta
  .ena(switch[7]), // input ena
  .addra(switch[1:0]), // input [1 : 0] addra
  .douta(dout) // output [3 : 0] douta
);

assign led[3:0]=dout[3:0];
assign led[7:4]=4'b0;

endmodule
