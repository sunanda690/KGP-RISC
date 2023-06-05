`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:50:16 11/05/2021
// Design Name:   RegFile
// Module Name:   E:/KGP_RISC/KGP_risc_processor/tb_RegFile.v
// Project Name:  KGP_risc_processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_RegFile;

	// Inputs
	reg [4:0] WriteReg;
	reg [31:0] WriteData;
	reg RegWrite;
	reg [4:0] ReadReg1;
	reg [4:0] ReadReg2;
	reg Clk;
	reg rst;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;
	wire [31:0] rout;
	// Instantiate the Unit Under Test (UUT)
	RegFile uut (
		.WriteReg(WriteReg), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.ReadReg1(ReadReg1), 
		.ReadReg2(ReadReg2), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2), 
		.Clk(Clk), 
		.rst(rst),
		.rout(rout)
	);

	initial begin
		// Initialize Inputs
		WriteReg = 0;
		WriteData = 0;
		RegWrite = 0;
		ReadReg1 = 0;
		ReadReg2 = 0;
		Clk = 0;
		rst = 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
       rst = 1'b0;
		// Add stimulus here
		#2
		begin
		WriteData <= 32'b100;  //write 4 to r0
		WriteReg <= 5'b0;
		RegWrite <= 1'b1;
		end
		#2
		begin
		WriteData <= 32'b101; //write 5 to r1
		WriteReg <= 5'b1;
		ReadReg1 <= 5'b1;
		end
		#2
		begin
		
		
		RegWrite <= 1'b0;
		ReadReg1 <= 5'b0;
		ReadReg2 <= 5'b1;
		end
		
		
	end
	always #1 Clk = ~Clk;
      
endmodule

