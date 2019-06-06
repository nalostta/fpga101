`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:54:07 05/31/2019 
// Design Name: 
// Module Name:    f_edge_detect_test 
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
module f_edge_detect_test(
    );

reg clk,Locked,instream;
wire f_edge;

falling_edge_detector DUT(
	.clk(clk),
	.Locked(Locked),
	.instream(instream),
	.f_edge(f_edge)
    );
	 
always #20 clk=!clk;
	 
initial begin
	clk<=1'b1;
	instream=1'b0;
	Locked=1'b0;
	#40 Locked=1'b1;
	#40 instream=1'b0;
	#40 instream=1'b1;
	#40 instream=1'b0;
	#40 instream=1'b1;
	#40 instream=1'b1;
	#4000 instream=1'b0;
	#4000 instream=1'b1;
	#4000 instream=1'b0;
	#4000 $stop;
end
endmodule
