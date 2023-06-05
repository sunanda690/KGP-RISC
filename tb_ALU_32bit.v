`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:49:18 11/05/2021
// Design Name:   ALU_32bit
// Module Name:   E:/KGP_RISC/KGP_risc_processor/tb_ALU_32bit.v
// Project Name:  KGP_risc_processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ALU_32bit;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg Cin;
	reg [2:0] Op;
	reg B_inv;
	reg [1:0] BranchType;

	// Outputs
	wire Cout;
	wire [31:0] Result;
	wire willBranch;

	// Instantiate the Unit Under Test (UUT)
	ALU_32bit uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Op(Op), 
		.B_inv(B_inv), 
		.BranchType(BranchType), 
		.Cout(Cout), 
		.Result(Result), 
		.willBranch(willBranch)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;
		Op = 0;
		B_inv = 0;
		BranchType = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//ADD
		#2
		A = 32'b100;
		B = 32'b101;
		Cin = 1'b0;
		B_inv = 1'b0;
		BranchType = 2'b11;
		Op = 3'b010;
		#2
		A = 32'b10001;
		B = 32'b101;
		Cin = 1'b0;
		B_inv = 1'b0;
		BranchType = 2'b11;
		Op = 3'b010;
		//COMP
		#2
		A = 32'b0;
		B = 32'b101;
		Cin = 1'b1;
		B_inv = 1'b1;
		BranchType = 2'b11;
		Op = 3'b010;
		//BItwise and
		#2
		
		A = 32'b100;
		B = 32'b101;
		Cin = 1'b0;
		B_inv = 1'b0;
		BranchType = 2'b11;
		Op = 3'b000;
		//Shift left logical
		#2
		
		A = 32'b101;
		B = 32'b101;
		Cin = 1'b0;
		B_inv = 1'b0;
		BranchType = 2'b11;
		Op = 3'b011;
		//Shift left logical
		#2
		
		A = 32'b100;
		B = 32'b101;
		Cin = 1'b0;
		B_inv = 1'b0;
		BranchType = 2'b11;
		Op = 3'b011;
		
		//brnch on less than 0
		#2
		
		A = -5;
		B = 0;
		Cin = 1'b0;
		B_inv = 1'b0;
		BranchType = 2'b10;
		Op = 3'b010;
		
	end
      
endmodule

