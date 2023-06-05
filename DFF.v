`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:19:24 11/07/2021 
// Design Name: 
// Module Name:    DFF 
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
module DFF(D,Q,clk,rst
    );
	input D,clk,rst;
	output reg Q;	 
	//assign Q = D;
	
	always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			Q<=1'b0;
		end 
		else 
		begin 
			Q<=D;
		end
	end

endmodule
