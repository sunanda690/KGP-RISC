`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Group 2
// 
// Create Date:    14:30:36 11/03/2021 
// Design Name: 
// Module Name:    ALU_32bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:   Module for the ALU
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_32bit(
		A,B,Cin,Op,B_inv,BranchType,Cout,Result,willBranch
    );
	 input [31:0] A, B;
	 input B_inv;
	 input [2:0]Op;
	 input [1:0]BranchType;
	 input Cin;
	 output Cout;
	 output [31:0]Result;
	 output willBranch;
	 wire [31:0] S;
	 wire Cout1;
	 wire [31:0] B_xor;
	 xor U3 [31:0] (B_xor,B,B_inv);
	 wire  Pout1, Gout1;
	 wire  Pout2, Gout2;
	 //-------------------Adder-------------------------------------------------
	 CLA16_CLU U1(.A(A[15:0]),.B(B_xor[15:0]),.in(Cin),.S(S[15:0]),.Cout(Cout1),.Pout(Pout1),.Gout(Gout1));
	 CLA16_CLU U2(.A(A[31:16]),.B(B_xor[31:16]),.in(Cout1),.S(S[31:16]),.Cout(Cout),.Pout(Pout2),.Gout(Gout2));
	 
	 //---------------------------Bitwise Xor  and and--------------------------------
	 wire [31:0] S_xor,S_and;
	 wire [31:0] Res1;
	 xor U4 [31:0](S_xor,A,B);
	 and U5 [31:0](S_and,A,B);
	 mux_3_1_32 U6(.A0(S_and),.A1(S_xor),.A2(S),.sel(Op[1:0]),.res(Res1));
	 
	 //------------------------Model the shifts-------------------------------------
	 wire [1:0] select1;
	 ALU_decoder U7(.In(Op),.Out(select1));
	 wire [31:0] S_sll,S_slr,S_sra;
	 
	 assign S_sll = A<<B; //shift left logical
	 assign S_slr = A>>B; //shift right logical
	 assign S_sra = A>>>B; //shift right arithmetic
	 mux_4_1_32 U8(.A0(Res1),.A1(S_sll),.A2(S_slr),.A3(S_sra),.sel(select1),.res(Result));
	 wire w1,w2,w3,w4,w5,w6;
	 or U9(w1,S[0],S[1],S[2],S[3],S[4],S[5],S[6],S[7],S[8]);
	 or U10(w2,S[9],S[10],S[11],S[12],S[13],S[14],S[15],S[16],S[17]);
	 or U11(w3,S[18],S[19],S[20],S[21],S[22],S[23],S[24],S[25],S[26]);
	 or U12(w4,S[27],S[28],S[29],S[30],S[31]);
	 or U13(w5,w1,w2,w3,w4);
	 not U14(w6,w5);
	 mux_4_1_1 U15(.A0(w6),.A1(w5),.A2(S[31]),.A3(1'b0),.sel(BranchType),.res(willBranch));
	 

endmodule


