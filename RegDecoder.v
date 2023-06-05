`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:25 11/04/2021 
// Design Name: 
// Module Name:    RegDecoder 
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
module RegDecoder(RegWrite,WriteReg,WriteFlag);
	input RegWrite;
	input [4:0] WriteReg;
	output [31:0] WriteFlag;
	wire [31:0] w1;
	assign w1 = 1<<WriteReg;
	assign WriteFlag = RegWrite?w1:32'b0;
	


endmodule
