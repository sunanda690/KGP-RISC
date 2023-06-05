`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:47 11/04/2021 
// Design Name: 
// Module Name:    mux_32_1_32 
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
module mux_32_1_32(Datain,Out,Sel);
	input [1023:0] Datain;
	output reg [31:0] Out;
	input [4:0] Sel;
	always @(*)
	begin
		case(Sel)
			5'b00000: Out = Datain[31:0];
			5'b00001: Out = Datain[63:32];
			5'b00010: Out = Datain[95:64];
			5'b00011: Out = Datain[127:96];
			5'b00100: Out = Datain[159:128];
			5'b00101: Out = Datain[191:160];
			5'b00110: Out = Datain[223:192];
			5'b00111: Out = Datain[255:224];
			5'b01000: Out = Datain[287:256];
			5'b01001: Out = Datain[319:288];
			5'b01010: Out = Datain[351:320];
			5'b01011: Out = Datain[383:352];
			5'b01100: Out = Datain[415:384];
			5'b01101: Out = Datain[447:416];
			5'b01110: Out = Datain[479:448];
			5'b01111: Out = Datain[511:480];
			5'b10000: Out = Datain[543:512];
			5'b10001: Out = Datain[575:544];
			5'b10010: Out = Datain[607:576];
			5'b10011: Out = Datain[639:608];
			5'b10100: Out = Datain[671:640];
			5'b10101: Out = Datain[703:672];
			5'b10110: Out = Datain[735:704];
			5'b10111: Out = Datain[767:736];
			5'b11000: Out = Datain[799:768];
			5'b11001: Out = Datain[831:800];
			5'b11010: Out = Datain[863:832];
			5'b11011: Out = Datain[895:864];
			5'b11100: Out = Datain[927:896];
			5'b11101: Out = Datain[959:928];
			5'b11110: Out = Datain[991:960];
			5'b11111: Out = Datain[1023:992];
			default :Out = 32'b0;
			
			
		endcase
		
	end
endmodule
