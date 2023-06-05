`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:29 11/05/2021 
// Design Name: 
// Module Name:    unsignedExtend 
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
module unsignedExtend(In,Out
    );
	input [4:0] In;
	output [31:0] Out;
	assign Out = {27'b0,In};

endmodule

