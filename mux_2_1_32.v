`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:21 11/04/2021 
// Design Name: 
// Module Name:    mux_2_1_32 
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
module mux_2_1_32(A0,A1,sel,res);

	output reg [31:0] res;
	 input  sel;
	 input [31:0] A0,A1;
	 always @(*)
	 begin
		if(sel)
		begin
			res = A1;
		end
		else 
		begin
			res = A0;
		end
		
	 end
endmodule
