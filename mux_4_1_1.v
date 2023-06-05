`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:03:34 11/04/2021 
// Design Name: 
// Module Name:    mux_4_1_1 
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
module mux_4_1_1(A0,A1,A2,A3,sel,res
    );

	output reg  res;
	 input [1:0] sel;
	 input  A0,A1,A2,A3;
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
		else if(sel==2'b10)
		begin
			res = A2;
		end
		else 
		begin
			res = A3;
		end
	 end
endmodule

