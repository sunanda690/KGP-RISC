`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:12 11/05/2021 
// Design Name: 
// Module Name:    mux_2_1_1 
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
module mux_2_1_1(A0,A1,res,sel);
	input sel,A0,A1;
	output reg res;
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
