`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:11:07 11/09/2021
// Design Name:   KGP_RISC
// Module Name:   E:/KGP_RISC/KGP_RISC_CPU/tb_KGP_RISC.v
// Project Name:  KGP_RISC_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGP_RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_KGP_RISC;

	// Inputs
	reg rst;
	reg clk;
	reg fast_clk;
	// Outputs
	wire [31:0] rout;
	wire [31:0] currInstr;
	wire [31:0] currPC;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		._rst(rst), 
		._clk(clk), 
		.fast_clk(fast_clk),
		.rout(rout), 
		.currInstr(currInstr), 
		.currPC(currPC)
	);

	initial begin
		// Initialize Inputs
		rst = 1'b1;
		clk = 1'b1;
		fast_clk = 1'b1;
	
		// Wait 100 ns for global reset to finish
		#104;
        
		// Add stimulus here
		
		 rst = 1'b0;
			
		
		

	end
	always #2 clk = ~clk;
	always #1 fast_clk = ~fast_clk;

	always @(*)
	begin
		if(currInstr==32'b11111111111111111111111111111111)
			begin
			$monitor("Result:  %d\n",rout);
			#1 $finish;
			end
		
	end
	
	
endmodule

