`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:53:06 11/09/2021
// Design Name:   DataMemory
// Module Name:   E:/KGP_RISC/KGP_RISC_CPU/tb_DataMem.v
// Project Name:  KGP_RISC_CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_DataMem;

	// Inputs
	reg clka;
	reg [3:0] wea;
	reg [31:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#2
		wea = 4'b1;
		dina = 32'b1101;
		#2
		addra = 32'b100;
		dina = 32'b1000;
		#2
		wea = 4'b0;
		addra = 32'b0;
		
	end
	always #1 clka = ~clka;
      
endmodule

