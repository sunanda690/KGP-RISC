`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:18 11/09/2021 
// Design Name: 
// Module Name:    DFF_32_async_load 
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
module DFF_32_async_load(D,Q,rst,clk,loadEnable);	
	input [31:0] D;
	output reg [31:0] Q;
	input rst,clk;
	input loadEnable;
	always @(posedge clk or posedge rst or posedge loadEnable)
	begin
	
		if(rst)
			begin
				Q = 32'b0;			
			end
		else if(loadEnable)
			begin
				Q = D;
			end
		else
			begin
				Q = D; 
			end		
	end
	

endmodule
