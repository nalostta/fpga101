`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:17 01/04/2019 
// Design Name: 
// Module Name:    main_m 
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
    input [7:0] switch,
    output [7:0] led,
	 input push_btn,
	 input clk
    );
	 
wire Carry0,Carry1,Carry2;

fulladder bit0(
	.A(switch[0]),
	.B(switch[4]),
	.Cin(1'b0),
	.Sum(led[0]),
	.Cout(Carry0)
	);
	
fulladder bit1(
	.A(switch[1]),
	.B(switch[5]),
	.Cin(Carry0),
	.Sum(led[1]),
	.Cout(Carry1)
	);
	
fulladder bit2(
	.A(switch[2]),
	.B(switch[6]),
	.Cin(Carry1),
	.Sum(led[2]),
	.Cout(Carry2)
	);
	
fulladder bit3(
	.A(switch[3]),
	.B(switch[7]),
	.Cin(Carry2),
	.Sum(led[3]),
	.Cout(led[5])
	);
	
assign led[7:6] = 2'b0;
assign led[4] = 1'b0;
	
	
endmodule
