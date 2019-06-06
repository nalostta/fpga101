`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:27:52 05/31/2019 
// Design Name: 
// Module Name:    debounce_test 
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
module debounce_test(
    );
	 
reg clk,Locked,trig_in;
wire trig_out;

debouncer DUT(
	.clk(clk),
	.Locked(Locked),
	.trig_in(trig_in),
	.trig_out(trig_out)
    );

always #20 clk=!clk;	
	
initial begin
clk<=1'b1;
trig_in<=1'b0;
Locked<=1'b0;
#400 Locked<=1'b1;
#20 trig_in<=1;
#500 trig_in<=0;
#980 trig_in<=1'b1;

#25000 $stop;
end
endmodule
