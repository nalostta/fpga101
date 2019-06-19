`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:53 04/04/2019 
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
	PS2_DAT	
    );
	 
input clk,pushbtn;
output [7:0] led;
inout PS2_CLK,PS2_DAT;

wire Locked,CLK0;
wire [3:0] debug;
wire [7:0] received_data;

reg [2:0] curr_state,next_state;
reg rx_en,next_rx_en;
reg [7:0] display_byte,rx_byte1,rx_byte2,rx_byte3,ByteX,ByteY,ByteZ;
reg trig_send,next_trig_send;

assign led = ByteY;

localparam 	IDLE		=	3'h0,
				TX_EN		=	3'h1,
				RX_BYTE1	=	3'h2,
				RX_BYTE2	=	3'h3,
				RX_BYTE3	=	3'h4;

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
	.data_to_send(8'hF4),
	.data_sent(data_sent),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.line_idle(),
	.debug()
    );

RX_stage1 R1(
	.clk(CLK0),
	.en(rx_en),
	.ps2clk(PS2_CLK),
	.ps2data(PS2_DAT),
	.rx_complete(rx_complete),
	.received_data(received_data),
	.debug(debug)
   );

/*assign CLK_MOUSE_IN = PS2_CLK;
assign DATA_MOUSE_IN = PS2_DAT;
	
MouseReceiver TEST(
	.RESET(1'b0),
	.CLK(CLK0),
	.CLK_MOUSE_IN(CLK_MOUSE_IN),
	.DATA_MOUSE_IN(PS2_DAT),
	.READ_ENABLE(rx_en),
	.BYTE_READ(received_data),
	.BYTE_ERROR_CODE(),
	.BYTE_READY(rx_complete)
);*/
	
always @(posedge CLK0)
if(Locked)begin
	curr_state<=next_state;
	trig_send<=next_trig_send;
	rx_en<=next_rx_en;
	ByteX<=rx_byte2;
	ByteY<=rx_byte3;
	ByteZ<=rx_byte1;
end else begin
	trig_send<=0;
	rx_en<=0;
	curr_state<=0;
	ByteX<=0;
	ByteY<=0;
	ByteZ<=0;
end
	
always @(*)
begin
	next_trig_send=0;
	next_rx_en=1'b0;
	next_state=curr_state;
	rx_byte1=ByteZ;
	rx_byte2=ByteX;
	rx_byte3=ByteY;
	
	case(curr_state)
		IDLE:
		begin
			if(!pushbtn)next_state=TX_EN;
		end
		
		TX_EN:
		begin
			next_trig_send=1'b1;
			if(data_sent)next_state=RX_BYTE1;
		end
		
		RX_BYTE1:
		begin
			next_rx_en=1'b1;
			if(rx_complete)begin
				rx_byte1=received_data;
				next_state=RX_BYTE2;
				end
		end
		
		RX_BYTE2:
		begin
			next_rx_en=1'b1;
			if(rx_complete)begin
				rx_byte2=received_data;
				next_state=RX_BYTE3;
				end
		end
		
		RX_BYTE3:
		begin
			next_rx_en=1'b1;
			if(rx_complete)begin
				rx_byte3=received_data;
				next_state=RX_BYTE1;
				end
		end
	endcase
end
endmodule
