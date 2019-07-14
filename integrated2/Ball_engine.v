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
		HWall
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


//inputs:
input PixClk,enable;
input[9:0] Hcounter,Vcounter;
input [9:0] HWall;
//outputs:
output[9:0] Hcen,Vcen;
//regs:
reg[9:0] Hcen=200;
reg[9:0] Vcen=150;
reg Hst=1'b0;
reg Vst=1'b0;
reg [17:0] count;
reg signed[9:0] Vsp,Hsp;
//wires:
wire[9:0] Hmax,Hmin,Vmax,Vmin;
wire signed [9:0] Hcen_next,Vcen_next;
wire [19:0] count_next;
//combinatorial:
assign Hmax	=	608;
assign Hmin	=	32;
assign Vmax	=	448;
assign Vmin	=	32;


assign Hcen_next =	(Hst==1'b1)?	Hcen+Hsp:Hcen-Hsp;
assign Vcen_next =	(Vst==1'b1)?	Vcen+Vsp:Vcen-Vsp;


assign count_next=count+1'b1;
//seq
/*
	Hsp <= ((Hcen<=Hmin)||(Hcen>=Hmax))?	-Hsp:Hsp;
	Vsp <= ((Vcen<=Vmin)||(Vcen>=Vmax))?	-Vsp:Vsp;
*/

always @(posedge PixClk or negedge enable)begin
		if(!enable)begin
			Hcen<=320;
			Vcen<=240;
			Hsp<=4;
			Vsp<=4;
		end else begin
			count<=count_next;
			if(count==1)begin
				if(Hcen<=(HWall+16))begin
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
				if(Vcen>=Vmax)begin
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
