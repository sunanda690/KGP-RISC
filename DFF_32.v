`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:54:42 11/04/2021 
// Design Name: 
// Module Name:    DFF_32 
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
module DFF_32(D,Q,rst,clk);	
	input [31:0] D;
	output reg [31:0] Q;
	input rst,clk;
	always @(posedge clk or posedge rst)
	begin
	
	
		if(rst)
		begin
			Q <= 32'b0;
			
		end
		else
		begin
			Q <= D; 
		end
		
	end

endmodule
