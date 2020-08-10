`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:54 01/18/2019 
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
		clkin,
		reset,
		clk_0,
		clk_div2,
		clk_mult2,
		locked,
		led
    );
	 
input clkin,reset;
output clk_0,clk_div2,clk_mult2,locked;
output [7:0] led;
reg [27:0] counter1;
reg [27:0] counter2;
reg [27:0] counter3;
reg [7:0] led;

// Instantiate the module
dcm_clk dcm_clk_inst(
    .CLKIN_IN(clkin), 
    .RST_IN(reset), 
    .CLKDV_OUT(clk_div2), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(clk_0), 
    .CLK2X_OUT(clk_mult2), 
    .LOCKED_OUT(locked)
    );
always @(posedge clk_div2 or posedge locked)begin
		if(locked)begin
			counter1=counter1+1'b1;
			led[0]<=counter1[27];
		end else begin
			led[0]<=1'b0;
		end
end

always @(posedge clk_0 or posedge locked)begin
		if(locked)begin
			counter2=counter2+1'b1;
			led[1]<=counter2[27];
		end else begin
			led[1]<=1'b0;
		end
		led[7:3]<=7'b0;
end

always @(posedge clk_mult2 or posedge locked)begin
		if(locked)begin
			counter3=counter3+1'b1;
			led[2]<=counter3[27];
		end else begin
			led[2]<=1'b0;
		end
end
endmodule
