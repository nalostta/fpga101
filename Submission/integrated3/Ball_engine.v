`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:17 02/07/2019 
// Design Name: 
// Module Name:    Ball_engine 
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
module Ball_engine(
		PixClk,
		Hcounter,
		Vcounter,
		enable,
		Hcen,
		Vcen,
		PaddleHit,
		trig_sound
    );
	 
/*pseudo:
set init direction i.e tan(x)
based on tan(x),speed and boundary conditions new centre co-ordinates are calculated
if boundary condition is violated, tan(x) updated and new posn calculated again
each clk pulse updates the position of the circle into the posn regs
boundary conditions:
		Hmax,
		Hmin,
		Vmax,
		Vmin,
		
		
algorithm:
1.	check boundary condition	//combi
2. if(violating): adjust tan(x)	//combi
3.	calculate new posn(centre)	//combi
4.	update	//posedge clock
*/

input PixClk,enable;
input[9:0] Hcounter,Vcounter;
input	PaddleHit;

output[9:0] Hcen,Vcen;
output	trig_sound;

reg[9:0] Hcen=200;
reg[9:0] Vcen=150;
reg Hst=1'b0;
reg Vst=1'b0;
reg [19:0] count;
reg signed[9:0] Vsp,Hsp;
reg follower_Vst,follower_Hst,trig_sound;
//wires:
//wire[9:0] Hmax,Hmin,Vmax,Vmin;
wire signed [9:0] Hcen_next,Vcen_next;
wire [19:0] count_next;
//combinatorial:
parameter Hmax	=	544;
parameter Hmin	=	96;
parameter Vmax	=	464;
parameter Vmin	=	176;

assign Hcen_next =	(Hst==1'b1)?	Hcen+Hsp:Hcen-Hsp;
assign Vcen_next =	(Vst==1'b1)?	Vcen+Vsp:Vcen-Vsp;

assign count_next=count+1'b1;

always @(posedge PixClk)
if(follower_Vst!=Vst || follower_Hst!=Hst)begin
	if(!PaddleHit)trig_sound<=1;
	else trig_sound<=0;
	follower_Vst=Vst;
	follower_Hst=Hst;
end else begin
	trig_sound<=0;
end

always @(posedge PixClk or negedge enable)begin
		if(!enable)begin
			Hcen<=320;
			Vcen<=240;
			Hsp<=4;
			Vsp<=4;
		end else begin
			count<=count_next;
			if(count==1)begin
				if(Hcen<=Hmin)begin
					Hst<=1'b1;
				end else 
				if(Hcen>=Hmax)begin
					Hst<=1'b0;
				end else begin
					Hst<=Hst;
				end
				
				if(Vcen<=Vmin)begin
					Vst<=1'b1;
				end else 
				if(Vcen>=Vmax||PaddleHit)begin
					Vst<=1'b0;
				end else begin
					Vst<=Vst;
				end
				
				Hcen<=Hcen_next;
				Vcen<=Vcen_next;
			end
		end
end
endmodule
