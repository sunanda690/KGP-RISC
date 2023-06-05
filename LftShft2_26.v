`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:10 11/05/2021 
// Design Name: 
// Module Name:    LftShft2_26 
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
module LftShft2_26(In,Out
    );
	input [25:0] In;
	output [27:0] Out;
	assign Out = {In[25:0],{1'b0,1'b0}};
	
endmodule
