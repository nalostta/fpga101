`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:07:05 06/23/2019 
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
	clk,
	led,
	pushbtn,
	PS2_CLK,
	PS2_DAT,
	Red,
	Green,
	Blue,
	Hsync,
	Vsync,
	SSD,
	DigCh,
	switch
    );
	 
input  clk,pushbtn;
input	 [7:0] switch;
output [7:0] led,SSD;
output [2:0] Red,Green,DigCh;
output [1:0] Blue;
output Hsync,Vsync;
inout  PS2_CLK,PS2_DAT;

reg  data_sent_trig,rx_complete_in;
reg [2:0] ring_buf;
reg [11:0]	clk_divider;

wire	[20:0]	count_next;
wire	[9:0]		Hposn;
wire	[9:0]		Hcounter,Vcounter,Hcen,Vcen,Xwire,Ywire,Zwire;
wire	[7:0]		PixData,zbyte,xbyte,ybyte;
wire	[7:0]		cmd_to_be_sent,received_data;
wire	[3:0]		debug_fsm_state;
wire	[7:0]		MouseDxRaw,MouseDyRaw,MouseStatusRaw;
wire 				Locked,CLK0,rx_complete,rx_en,data_sent,trig_send;

assign led=Hposn;
assign slow_clk=clk_divider[11];
assign DigCh=ring_buf;

//------------------------------------------------------
parameter [7:0] MouseLimitX = 320;
parameter [7:0] MouseLimitY = 240;

wire signed [9:0] MouseDx;
wire signed [9:0] MouseDy;
wire signed [9:0] MouseNewX;
wire signed [9:0] MouseNewY;
wire signed [9:0] MouseDz;
wire signed [9:0] MouseNewZ;

reg [7:0] 	MouseX,MouseY,MouseStatus;
//------------------------------------------------------

//assign bin_input	=	debug_fsm_state;//debug_fsm_state;//(!ring_buf[0])?	zbyte[7:4]:(!ring_buf[1])?	zbyte[3:0]:ybyte;

/*reg [7:0] MouseClkFilter;
	
always@(posedge CLK) begin
	if(!RESET)
		ClkMouseIn <= 1'b0;
	else 
		begin
			//A simple shift register
			MouseClkFilter[7:1] <= MouseClkFilter[6:0];
			MouseClkFilter[0] <= CLK_MOUSE;
			
			//falling edge
			if(ClkMouseIn & (MouseClkFilter == 8'h00))			
				ClkMouseIn <= 1'b0;
			
			//rising edge
			else if(~ClkMouseIn & (MouseClkFilter == 8'hFF))
				ClkMouseIn <= 1'b1;
		end
end*/

//----------filter-----------
reg	[7:0]	ClkFilter;
reg	filtered_clk;

always @(posedge CLK0)
if(Locked)
begin
	ClkFilter[7:1]<=ClkFilter[6:0];
	ClkFilter[0]<=PS2_CLK;
	
	if(ClkFilter==8'hff)filtered_clk<=1'b1;
	else if(ClkFilter==8'h00)filtered_clk<=1'b0;
	else filtered_clk<=filtered_clk;
end else begin
	ClkFilter<=0;
	filtered_clk<=0;
end
//----------filter-----------

always @(posedge CLK0)clk_divider<=clk_divider+1'b1;

always @(posedge slow_clk)
if(!Locked)ring_buf<=3'b110;
else begin
	ring_buf[2:1]<=ring_buf[1:0];
	ring_buf[0]<=ring_buf[2];
end

clkgen SYS_CLK (
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );
	
stage2 S2(
	.clk(CLK0),
	.locked(Locked),
	.trig_send(trig_send),
	.data_to_send(cmd_to_be_sent),
	.data_sent(data_sent),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.line_idle(),
	.debug()
    );
	 
MOUSE_FSM_CMD control_module(
	.clk(CLK0),
	.reset(!pushbtn),
	.trig_send(trig_send),
	.cmd_to_send(cmd_to_be_sent),
	.cmd_sent(data_sent),
	.rx_en(rx_en),
	.byte_ready(rx_complete),
	.received_byte(received_data),
	.error_codes(error_codes),
	.debug_curr_state(debug_fsm_state),
	.debug_rx_buf(),
	.XByte(MouseDxRaw),
	.YByte(MouseDyRaw),
	.ZByte(MouseStatusRaw),
	.packet_complete(packet_complete)
	);
	 
PS2_RxModule V2(
	.clk(CLK0),
	.Locked(Locked),
	.rx_en(rx_en),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.rx_complete(rx_complete),
	.received_data(received_data),
	.ByteErrorCode(error_codes)
   );
	
pix_Controller	image_handler(
		.PixData(PixData),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.Red(Red),
		.Green(Green),
		.Blue(Blue)
    );
	 
VGAcontroller VGA_1(
		.Locked(Locked),
		.PixClk(CLK0),
		.Hsync(Hsync),
		.Vsync(Vsync),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter)
    );
	
mouse_posn mouse_coordinates(
	.clk(CLK0),
	.en(packet_complete),
	.reset(!Locked),
	.XByte(MouseDxRaw),
	.YByte(MouseDyRaw),
	.StatusByte(MouseStatusRaw),
	.Xposn(Hposn),
	.Yposn(Vposn)
    );
	
rectangle object1(
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.Hcen(Hposn),
		.Vcen(Vposn),
		.PixData(PixData)
    );
	 
bintoseg bin_to_hex(
    .ssdarray(SSD),
    .bin(debug_fsm_state)
    );
	
endmodule

