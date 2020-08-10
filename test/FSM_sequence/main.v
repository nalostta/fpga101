`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:38 01/09/2019 
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

/*
	Sequence : 101101
*/

module main(
	clk,
	switch,
	push_btn,
	led,
	rst
    );
	 
input [7:0] switch;
input clk;
input push_btn;
input rst;

wire Aout,Bout,Cout;

output [7:0] led;

reg [7:0] led;
reg Ain,Bin,Cin;
//reg [26:0] count;

DFF instA(
		.clk_in(clk),
		.Din(Ain),
		.Qout(Aout),
		.rst(rst)
		);

DFF instB(
		.clk_in(clk),
		.Din(Bin),
		.Qout(Bout),
		.rst(rst)
		);

DFF instC(
		.clk_in(clk),
		.Din(Cin),
		.Qout(Cout),
		.rst(rst)
		);

always @(posedge clk or negedge rst)begin
	//count=count+1'b1;
	//led[7]<=count[25];
	if(!rst)begin
		led[4:1]<=6'b0;
		//
			{led[7],Ain}<=(Aout&&~Bout&&~Cout&&~switch[0])||(Aout&&Bout&&switch[0])||(Bout&&Cout&&switch[0])||(Aout&&Cout&&switch[0]);
			{led[6],Bin}<=(~Aout&&Bout&&~Cout&&switch[0])||(~Aout&&Cout&&~switch[0])||(Aout&&Cout&&switch[0])||(Aout&&Bout&&switch[0]);
			{led[5],Cin}<=(Aout&&~Bout&&~Cout)||(~Aout&&~Cout&&switch[0])||(~Aout&&~Bout&&switch[0]);
			led[0]<=(Aout&&~Bout&&Cout&&switch[0]);
		//
	end
end
endmodule
