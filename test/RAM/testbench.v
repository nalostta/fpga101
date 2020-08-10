`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:47 01/16/2019 
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
	 
//inputs
reg [1:0] address;
reg readE;
reg writeE;
reg [3:0] datain;

//outputs
wire [7:0] data;
wire [3:0] floating;

main inst(
    .switch({writeE,readE,datain,address}),
    .clk(),
    .led(data),
    .push_btn()
    );
	 
initial begin
	address=2'b0;
	readE=1'b0;
	writeE=1'b0;
	datain=4'b0;
	$display("<start>");
	#20;
	
	address=2'b10;
	#10 datain=4'b1001;
	#10 writeE=1'b1;
	#10 $display("<write>address[%b] data=[%b]",address,datain);
	#10 writeE=1'b0;
	
	//read all
	#10 readE=0'b1;
	#10 address=2'b00;
	#10 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	#10 address=2'b01;
	#10 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	#10 address=2'b10;
	#10 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	#10 address=2'b11;
	#10 $display("<read>address[%b] data=[%b]",address,data[3:0]);
	$finish;
end
endmodule
