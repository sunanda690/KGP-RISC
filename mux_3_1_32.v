`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:48:30 11/04/2021 
// Design Name: 
// Module Name:    mux_3_1_32 
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
module mux_3_1_32(A0,A1,A2,sel,res
    );
	 output reg [31:0] res;
	 input [1:0] sel;
	 input [31:0] A0,A1,A2;
	 always @(*)
	 begin
		if(sel==2'b00)
		begin
			res = A0;
		end
		else if(sel==2'b01)
		begin
			res = A1;
		end
		else
		begin
			res = A2;
		end
	 end


endmodule
