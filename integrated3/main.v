`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:22:55 07/14/2019 
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
	Hsync,
	Vsync,
	Red,
	Green,
	Blue,
	switch,
	PS2_CLK,
	PS2_DAT,
	led,
	SSD,
	DigCh,
	pushbtn,
	Buzzer
    );

input 	clk,pushbtn;
input 	[7:0]	switch;

output 	Hsync,Vsync,Buzzer;
output	[7:0]	led,SSD;
output	[2:0]	Red,Green,DigCh;
output	[1:0]	Blue;

inout		PS2_DAT,PS2_CLK;

wire		[11:0]CharAddr;
wire		[9:0]	Hcounter,Vcounter;
wire		[7:0]	PixData,TextData;

wire	[3:0]	HitScore,MissScore;
wire			PaddleHit;

wire	[9:0]	PaddleCentreX,BallCentreX,BallCentreY;
wire	[7:0]	cmd_to_send,received_byte;
wire	[3:0]	debug_PS2Mouse;
wire	[7:0]	XByteRaw,YByteRaw,StatusByteRaw;
wire			rx_complete,rx_en,cmd_sent,trig_send,packet_complete;
wire	[1:0]	error_codes;

//

assign led	=	HitScore;

bintoseg debug_display(
    .ssdarray(SSD),
    .bin(debug_PS2Mouse)
    );
	 
assign DigCh[2:1]	=	1'b0;
assign DigCh[0]	=	1'b1;

//
	 
clkgen SysClock(
    .CLKIN_IN(clk), 
    .RST_IN(1'b0), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0), 
    .LOCKED_OUT(Locked)
    );

VGAcontroller VGAControlModule(
		.Locked(Locked),
		.PixClk(CLK0),
		.Hsync(Hsync),
		.Vsync(Vsync),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter)
    );
	 
text_gen	GameTitleBar(
		.clk(CLK0),
		.Locked(Locked),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.PixData(TextData),
		.CharAddr(CharAddr),
		.Bin(CharBit),
		.HitScore(HitScore),
		.MissScore(MissScore)
    );
	 
CharBank CharacterBank(
  .clka(CLK0), // input clka
  .addra(CharAddr), // input [11 : 0] addra
  .douta(CharBit) // output [0 : 0] douta
);

//-------------------------------------------------
ScoreTracker ScoreTrackerModule(
	.clk(CLK0),
	.Locked(Locked),
	.reset_score(!PushBtn),
	.BallCentreX(BallCentreX),
	.BallCentreY(BallCentreY),
	.PaddleCentreX(PaddleCentreX),
	.PaddleHit(PaddleHit),
	.HitScore(HitScore),
	.MissScore(MissScore),
	.TrigSound()
    );

Ball_engine BallMotionControl(
	.PixClk(CLK0),
	.Hcounter(Hcounter),
	.Vcounter(Vcounter),
	.enable(pushbtn),
	.Hcen(BallCentreX),
	.Vcen(BallCentreY),
	.PaddleHit(PaddleHit),
	.trig_sound(NormalHitSound)
    );
	 
SoundGen	BoomBox(
	.clk(CLK0),
	.Locked(Locked),
	.PaddleHit(PaddleHit),
	.NormalHit(NormalHitSound),
	.Buzzer(Buzzer)
    );
//------------------------------------------------

//----------------------------------------------------------------------------------------
ImageGen	FrameConstructor(
	.Hcounter(Hcounter),
	.Vcounter(Vcounter),
	.PixData(PixData),
	.PaddleCentreX(PaddleCentreX),
	.BallCentreX(BallCentreX),
	.BallCentreY(BallCentreY),
	.TextConstructor(TextData)
    );
//----------------------------------------------------------------------------------------

	 
pix_Controller PixController(
		.PixData(PixData),
		.Hcounter(Hcounter),
		.Vcounter(Vcounter),
		.Red(Red),
		.Green(Green),
		.Blue(Blue)
    );
	 
//----------------PS2 Mouse Interface-------------------

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

wire		TxDataOut,TxClkEn,TxDataEn;
	
assign	PS2_CLK		=	TxClkEn?		1'b0:1'bz;
assign	PS2_DAT		=	TxDataEn?	TxDataOut:1'bz;
assign	DataMouseIn	=	PS2_DAT;

PS2MouseController	PS2_interface_controller(
	.clk(CLK0),
	.reset(!pushbtn),
	.trig_send(trig_send),
	.cmd_to_send(cmd_to_send),
	.cmd_sent(cmd_sent),
	.rx_en(rx_en),
	.byte_ready(rx_complete),
	.received_byte(received_byte),
	.error_codes(error_codes),
	.debug_curr_state(debug_PS2Mouse),
	.debug_rx_buf(),
	.XByte(XByteRaw),
	.YByte(YByteRaw),
	.ZByte(StatusByteRaw),
	.packet_complete(packet_complete)
	);
	
PS2MouseTransmitter PS2_interface_tx(
	.clk(CLK0),
	.locked(Locked),
	.trig_send(trig_send),
	.data_to_send(cmd_to_send),
	.data_sent(cmd_sent),
	.ps2clk(ClkMouseIn),
	.ps2data(DataMouseIn),
	.line_idle(),
	.debug(),
	.curr_ps2data_en(TxDataEn),
	.curr_ps2clk_en(TxClkEn),
	.curr_dout(TxDataOut)
    );
	 
PS2MouseReceiver	PS2_interface_rx(
	.clk(CLK0),
	.Locked(Locked),
	.rx_en(rx_en),
	.ps2clk(ClkMouseIn),
	.ps2data(PS2_DAT),
	.rx_complete(rx_complete),
	.received_data(received_byte),
	.ByteErrorCode(error_codes)
   );
	
mouse_posn	PaddlePosition(
	.clk(CLK0),
	.Locked(Locked),
	.trig_en(packet_complete),
	.XByte(XByteRaw),
	.YByte(YByteRaw),
	.StatusByte(StatusByteRaw),
	.Xposn(PaddleCentreX),
	.Yposn()
	);

//----------------PS2 Mouse Interface-------------------
endmodule
