`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:12:18 01/22/2019 
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


/*-----------------------testbench module---------------------
module main(
		addr,
		datain,
		dataout,
		clk,
		reset,
		en,
		writeEn
    );
	 
input [3:0] addr;
input en;
input clk;
input reset;
input writeEn;
input [3:0] datain;
output [3:0] dataout;

ram ram_1(
  .clka(clk), // input clka
  .rsta(reset), // input rsta
  .ena(en), // input ena
  .wea(writeEn), // input [0 : 0] wea
  .addra(addr), // input [1 : 0] addra
  .dina(datain), // input [3 : 0] dina
  .douta(dataout) // output [3 : 0] douta
);
*/

/*-------------------------hardware implementation---------------*/
module main(
		clk,
		switch,
		led
		);
		
input [7:0] switch;
input clk;

output [7:0] led;

//reg [7:0] led;

wire [3:0] dout;

ram ram_1(
  .clka(clk), // input clka
  .rsta({switch[7]}), // input rsta
  .ena(1'b1), // input ena
  .wea({switch[6]}), // input [0 : 0] wea
  .addra({switch[1:0]}), // input [1 : 0] addra
  .dina({switch[5:2]}), // input [3 : 0] dina
  .douta(dout) // output [3 : 0] douta
);

assign led[3:0]=dout[3:0];
assign led[7:4]=4'b0;
endmodule
