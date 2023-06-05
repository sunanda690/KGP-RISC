`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Group 2
// 
// Create Date:    16:32:40 11/04/2021 
// Design Name: 
// Module Name:    KGP_RISC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:  Main Top Module for the KGP RISC processor
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//defines
`define rs currInstr[25:21]
`define rt currInstr[20:16]
`define imm currInstr[15:0]
`define jimm currInstr[25:0]  //for unconditional direct jump immediate instruction
`define shmt currInstr[15:11]
`define r31 5'b11111
`define func currInstr[10:5]
`define opcode currInstr[31:26]

module KGP_RISC(_rst,_clk,rout,currInstr,currPC,fast_clk
    );
	 input _clk,_rst,fast_clk;
	 wire [31:0] prevVal,nxtVal;
	 output [31:0] currPC;
	 
	 assign currPC = nxtVal;
	 reg clkA,clkB,clkC;
	 reg [1:0] counter = 0;
	 /**
	 *  Clocking Mechanism  : 
	     PC :            001001001001...
		  Instrmem :      100100100...
		  RegFile :       0100100100...
		  This is donw to preserve the correct flow of data as updates occur at posedge clock
	 */
	 always @(posedge _clk)
	 begin
		if(counter>=2'b10)	counter = 2'b0;
		else counter = counter + 2'b1;
		
		if(counter==2'b0)
		begin
			clkA = 1'b1;
			clkB = 1'b0;
			clkC = 1'b0;
		end
		else if (counter==2'b1)
		begin
			clkA = 1'b0;
			clkB = 1'b1;
			clkC = 1'b0;
		end
		else 
		begin
			clkA = 1'b0;
			clkB = 1'b0;
			clkC = 1'b1;
		end
	 end
	 
	 
	 //-----------------Program counter------------------
	 //wire PCclk;
	 //not(PCclk,_clk);
	 DFF_32 PC(.D(prevVal),.Q(nxtVal),.rst(_rst),.clk(clkC));//rst initialises inital address with 0
	 output [31:0] rout;
	 output [31:0] currInstr;
	 wire MemtoReg,writeRs,A_0,B_0,write31,MemWrite,jump,chkCarry,branch,RegWrite;
	 wire [1:0] ALU_src;
	 wire CarVal;
	 wire [6:0] ALU_control;
	 
	 //-------------------datapath----------------------
	 datapath _Datapath(.currInstrAdr(nxtVal),.nextInstrAdr_(prevVal),.currInstr(currInstr),.MemtoReg(MemtoReg),
				.ALU_src(ALU_src),.A_0(A_0),.B_0(B_0),.write31(write31),
				.MemWrite(MemWrite),.jump(jump),.chkCarry(chkCarry),.branch(branch),
				.RegWrite(RegWrite),.CarVal(CarVal),.writeRs(writeRs),.clkA(clkA),.clkB(clkB),.fast_clk(fast_clk),.rst(_rst),.ALU_control(ALU_control),
				.rout(rout));
				
	//-----------------------controller---------------------------------------
	wire [2:0] ALU_op;
	controller CPU_control(
	.opcode(`opcode),
	
	.alu_op(ALU_op),
	.alusrc(ALU_src),
	.memWrite(MemWrite), .memToReg(MemtoReg), .branch(branch), .jump(jump), .regWrite(RegWrite), .write_rs(writeRs), 
	.A_0(A_0), .B_0(B_0), .write31(write31), .chkcarry(chkCarry),.carryval(CarVal)
    );
	 //---------------------------ALU control----------------------------------------
	 ALU_Control ALU_controller(
		.alu_op(ALU_op),
		.func(`func),
		.alu_control(ALU_control) 
    );

endmodule
