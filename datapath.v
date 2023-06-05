`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Group 2
// 
// Create Date:    16:32:22 11/04/2021 
// Design Name: 
// Module Name:    datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Module for the dataflow
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
`define pc currInstrAdr




module datapath(currInstrAdr,nextInstrAdr_,currInstr,MemtoReg,ALU_src,A_0,B_0,write31,
				MemWrite,jump,chkCarry,branch,RegWrite,CarVal,writeRs,clkA,clkB,rst,ALU_control,fast_clk,
				rout);
	//-----------------Control Inputs------------------------------
	input MemtoReg,writeRs,A_0,B_0,write31,MemWrite,jump,chkCarry,branch,RegWrite;
	input [1:0] ALU_src;
	output [31:0] rout;//output register
	
	input CarVal;
	input [6:0] ALU_control;
	input clkA,clkB,rst,fast_clk;
	input [31:0] currInstrAdr;
	wire [31:0] nextInstrAdr;//address instruction just after curr
	output [31:0] nextInstrAdr_;//final output will go to the program counter
	output [31:0] currInstr;
	//       OUTGOING PATHS FROM PC
	//Connecting Current PC to BROM Intr Mem 
	InstrMem Instr_Mem (
		.clka(clkA), 
		.ena(1'b1), 
		.addra(currInstrAdr), 
		.douta(currInstr)
	);
	
	//-------------------------get next pc------------------------
	assign nextInstrAdr = currInstrAdr + 32'b100;
	//add Add41(.A(currInstrAdr),.B(32'b100),.Sm(nextInstrAdr));
	//left shift by 2
	wire [27:0] w1;
	wire [31:0] nextJump;
	LftShft2_26 shft2l(.In(`jimm),.Out(w1));
	assign nextJump = {nextInstrAdr[31:28],w1};//merge and determine the next direct jump  address
	wire [4:0] w2;   //Register to be written will be passed to a second mux
	mux_2_1_5 _regDest(.A0(`rs),.A1(`rt),.sel(writeRs),.res(w2));
	wire [4:0] _wrtReg;
	mux_2_1_5 _aluDest2(.A1(`r31),.A0(w2),.sel(write31),.res(_wrtReg));
	
	//----------------------------Register File--------------
	wire [31:0] _writeData; 
	wire [31:0] readRs,readRt;
	RegFile _regFile(.WriteReg(_wrtReg),.WriteData(_writeData),
						.RegWrite(RegWrite),.ReadReg1(`rs),.ReadReg2(`rt),
						.ReadData1(readRs),.ReadData2(readRt),.Clk(clkB),.rst(rst),.rout(rout));
						
	//---------------------------Extend imm and shmt---------------------
	wire [31:0] extdImm;
	signExtend _sgnEndt(.In(`imm),.Out(extdImm));
	wire [31:0] extdShmt;	
	unsignedExtend _usgnEndt(.In(`shmt),.Out(extdShmt));
	
	//mux for ALU_source
	wire [31:0] b_src;//first stage of inputs for ALU
	mux_3_1_32 __alu_src(.A0(readRt),.A1(extdImm),.A2(extdShmt),.sel(ALU_src),.res(b_src));
	wire [31:0] ALU_arg1,ALU_arg2;
	//final inputs to the ALU
	mux_2_1_32 __alu_src2(.A0(readRs),.A1(32'b0),.sel(A_0),.res(ALU_arg1));
	mux_2_1_32 __alu_src3(.A0(b_src),.A1(32'b0),.sel(B_0),.res(ALU_arg2));
	
	//------------------------------------ALU-------------------------------------------
	wire [31:0] ALU_res;  //ALU outputs
	wire CarryOut,willBranch;
	ALU_32bit cpu_ALU(	
		.A(ALU_arg1),.B(ALU_arg2),.Cin(ALU_control[2]),.Op(ALU_control[6:4]),.B_inv(ALU_control[3]),.BranchType(ALU_control[1:0]),.Cout(CarryOut),.Result(ALU_res),.willBranch(willBranch)
    );
	//carry
	reg CarryFlag;
	always @(posedge clkB)
	begin
		CarryFlag <= CarryOut;
	end
	wire notCar;
	assign notCar = ~ CarryFlag; 
	
	//---------------------------------DATA Memory-----------------------------------------
	wire [31:0] MemOut;
	DataMemory CPU_DataMem (
		.clka(fast_clk), 
		.wea({{3'b0},MemWrite}), 
		.addra(ALU_res), 
		.dina(readRt), 
		.douta(MemOut)
	);
	//FLow back to register write	
	wire [31:0] temp_writeData;
	mux_2_1_32 __writeReg(.A0(ALU_res),.A1(MemOut),.sel(MemtoReg),.res(temp_writeData));
	mux_2_1_32 __writeReg2(.A0(temp_writeData),.A1(nextInstrAdr),.sel(write31),.res(_writeData));
	
	//----------------------------Branch Management--------------------------
	wire [31:0] IncBrnc;//Increment to PC+4 for branch
	LftShft2 _shft_brnc(.In(extdImm),.Out(IncBrnc));
	wire [31:0] nxtBrncAdr;
	assign nxtBrncAdr = IncBrnc + nextInstrAdr;
	//add getNextBrncAddr(.A(IncBrnc),.B(nextInstrAdr),.Sm(nxtBrncAdr));
	//branch condition decisions
	wire b1;
	and _brnc1(b1,branch,willBranch);
	wire [31:0] nxtAdr1;
	mux_2_1_32 _brnc2(.A0(nextInstrAdr),.A1(nxtBrncAdr),.sel(b1),.res(nxtAdr1));
	
	
	
	//------------Jump Management of different types with check carry etc--------------
	
	wire _chkCar;//layer 1 checking if carry needs to be checked with 1 or 0
	mux_2_1_1 _t2(.A0(notCar),.A1(CarryFlag),.sel(CarVal),.res(_chkCar));
	wire jmpCond1;//chk Car anded with jump control signal
	and _t3(jmpCond1,jump,_chkCar);
	//second layer checking if carry needs to be checked or not
	wire jmpCond2;
	mux_2_1_1 _t7(.A0(jump),.A1(jmpCond1),.sel(chkCarry),.res(jmpCond2));
	wire jmpCond3;
	and _t4(jmpCond3,jump,branch);//Indicates goto rs if both 1
	//2 more layes for next addres with newly computed controls checking all types of jumps and branches
	wire [31:0] nxtAdr2;
	mux_2_1_32 _t5(.A0(nxtAdr1),.A1(nextJump),.sel(jmpCond2),.res(nxtAdr2));
	mux_2_1_32 _t6(.A0(nxtAdr2),.A1(readRs),.sel(jmpCond3),.res(nextInstrAdr_));
	

endmodule
