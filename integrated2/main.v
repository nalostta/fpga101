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

output [7:0] led;
output [2:0] Red,Green;
output [1:0] Blue;
output Hsync,Vsync;

inout  PS2_CLK,PS2_DAT;

wire				Locked,CLK0;

wire	[9:0]		Hposn,Vposn;
wire	[9:0]		Hcounter,Vcounter,Hcen,Vcen;
wire	[7:0]		PixData;

wire	[7:0]		cmd_to_be_sent,received_data;
wire	[3:0]		debug_fsm_state;
wire	[7:0]		MouseDxRaw,MouseDyRaw,MouseStatusRaw;
wire 				rx_complete,rx_en,data_sent,trig_send;

assign led=Hposn;

//----------------------------------
clkgen SYS_CLK (
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );
	 
//----------------------------------

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


wire DataMouseOutEnTrans,ClkMouseOutEnTrans,DataMouseOutTrans;
assign PS2_CLK = ClkMouseOutEnTrans ? 1'b0 : 1'bz;
assign DataMouseIn = PS2_DAT;
assign PS2_DAT = DataMouseOutEnTrans ? DataMouseOutTrans : 1'bz;

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
//----------------------------------------------------

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
