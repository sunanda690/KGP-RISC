`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:38:25 11/05/2021
// Design Name:   InstrMem
// Module Name:   E:/KGP_RISC/KGP_risc_processor/tb_instr_mem.v
// Project Name:  KGP_risc_processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstrMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_instr_mem;

	// Inputs
	reg clka;
	reg ena;
	reg [31:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	InstrMem uut (
		.clka(clka), 
		.ena(ena), 
		.addra(addra), 
		.douta(douta)
	);
	always #2 clka = ~clka;
	initial begin
		// Initialize Inputs
		clka <= 0;
		ena <= 1'b0;
		addra <= 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		
        ena <= 1'b1;
		addra <= 32'b0;
		#4 addra<=32'b0100;
		#4 addra<=32'b1000;
		// Add stimulus here

	end
      
endmodule

