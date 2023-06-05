`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:37 11/05/2021 
// Design Name: 
// Module Name:    LftShft2 
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
module LftShft2(In,Out
    );
	input [31:0] In;
	output [31:0] Out;
	assign Out = {In[29:0],{1'b0,1'b0}};

endmodule
