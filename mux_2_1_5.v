`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:29 11/05/2021 
// Design Name: 
// Module Name:    mux_2_1_5 
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
module mux_2_1_5(A0,A1,sel,res);
	input sel;
	output reg [4:0] res;
	input [4:0] A0,A1;
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
