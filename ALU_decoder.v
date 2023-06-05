`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:15:39 11/04/2021 
// Design Name: 
// Module Name:    ALU_decoder 
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
module ALU_decoder(In,Out);
	input [2:0] In;
	output reg [1:0]  Out;
	always @(*)
	begin
		if(In==3'b011)
		begin
			Out = 2'b01;
		end
		else if(In==3'b100)
		begin
			Out = 2'b10;
		end
		else if(In==3'b101)
		begin
			Out = 2'b11;
		end
		else
		begin
			Out = 2'b00;
		end
	end

endmodule
