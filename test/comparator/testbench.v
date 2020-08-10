`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:50 01/12/2019 
// Design Name: 
// Module Name:    testbench 
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
	 
wire [7:0] led;
wire RedLed,GreenLed,BlueLed;
reg [7:0] switch;

main main_tb(
    .switch(switch),
    .led(led),
    .clk(),
    .push_btn(),
	 .RedLed(RedLed),
	 .GreenLed(GreenLed),
	 .BlueLed(BlueLed)
    );

initial begin
	switch[7:0]<=8'b0;
	#26000;
	$finish;
end

always begin
	#100;
	switch=switch+1'b1;
end

always @(switch) begin
	#5; 
	$display("switch=%b\tR=%b G=%b B=%b",switch,RedLed,GreenLed,BlueLed);
end
endmodule
