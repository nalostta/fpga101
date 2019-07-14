`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:37:47 07/14/2019 
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
	Vsync
    );
	 
input  clk,pushbtn;
//input	 [7:0] switch;
output [7:0] led;//,SSD;
output [2:0] Red,Green;//,DigCh;
output [1:0] Blue;
output Hsync,Vsync;
inout  PS2_CLK,PS2_DAT;

reg  data_sent_trig,rx_complete_in;
reg [2:0] ring_buf;
reg [11:0]	clk_divider;

wire	[20:0]	count_next;
wire	[9:0]		Hposn,Vposn;
wire	[9:0]		Hcounter,Vcounter,Hcen,Vcen,Xwire,Ywire,Zwire;
wire	[7:0]		PixData,zbyte,xbyte,ybyte;
wire	[7:0]		cmd_to_be_sent,received_data;
wire	[3:0]		debug_fsm_state;
wire	[7:0]		MouseDxRaw,MouseDyRaw,MouseStatusRaw;
wire 				Locked,CLK0,rx_complete,rx_en,data_sent,trig_send;

assign led=Hposn;
assign slow_clk=clk_divider[11];
assign DigCh=ring_buf;


reg [7:0] MouseClkFilter;
reg ClkMouseIn;
	
always@(posedge CLK0) begin
	if(!Locked)
		ClkMouseIn <= 1'b0;
	else 
		begin
			//A simple shift register
			MouseClkFilter[7:1] <= MouseClkFilter[6:0];
			MouseClkFilter[0] <= PS2_CLK;
			
			//falling edge
			if(ClkMouseIn & (MouseClkFilter == 8'h00))			
				ClkMouseIn <= 1'b0;
			
			//rising edge
			else if(~ClkMouseIn & (MouseClkFilter == 8'hFF))
				ClkMouseIn <= 1'b1;
		end
end

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
//----------------------------------


clkgen SYS_CLK (
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );
//----------------------------------

wire DataMouseOutEnTrans,ClkMouseOutEnTrans,DataMouseOutTrans;

assign PS2_CLK = ClkMouseOutEnTrans ? 1'b0 : 1'bz;

//Clk Input
assign DataMouseIn = PS2_DAT;
	
//Clk Output - can be driven by host or device
assign PS2_DAT = DataMouseOutEnTrans ? DataMouseOutTrans : 1'bz;

	
stage2 MouseTransmitter(
	.clk(CLK0),
	.locked(Locked),
	.trig_send(trig_send),
	.data_to_send(cmd_to_be_sent),
	.data_sent(data_sent),
	.ps2clk(ClkMouseIn),
	.ps2data(DataMouseIn),
	.line_idle(),
	.debug(),
	.curr_ps2data_en(DataMouseOutEnTrans),
	.curr_ps2clk_en(ClkMouseOutEn),
	.curr_dout(DataMouseOutTrans)
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
	.ps2clk(ClkMouseIn),
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
	.Locked(Locked),
	.trig_en(packet_complete),
	.XByte(MouseDxRaw),
	.YByte(MouseDyRaw),
	.StatusByte(MouseStatusRaw),
	.Xposn(Hposn),
	.Yposn(Vposn)
    );
	
wire [9:0] Hcentre,Vcentre;
	
circle object(
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.PixData(PixData),
		.Hcentre(Hcentre),
		.Vcentre(Vcentre),
		.HWall(Hposn)
    );
	 
Ball_engine motion_control(
		.PixClk(CLK0),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.enable(pushbtn),
		.Hcen(Hcentre),
		.Vcen(Vcentre),
		.HWall(Hposn)
    );
	 
endmodule
