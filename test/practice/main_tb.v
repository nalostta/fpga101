`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:59 02/01/2019 
// Design Name: 
// Module Name:    main_tb 
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
module testbench(
    );
	 
reg clk_in;
wire[9:0] dataout;

 main inst(
		.clk(clk_in),
		.dataout(dataout)
    );
	 
always #20 clk_in=~clk_in;

initial begin
	clk_in=1'b0;
	#400 $finish;
end
endmodule
