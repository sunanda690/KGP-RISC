`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    18:15:49 08/25/2021 
// Design Name: 
// Module Name:    CLA4 
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
module CLA4(A,B,in,S,C,G,P);
	input [3:0] A;
	input [3:0] B;
	input in;
	output [3:0] S;
	output C;	
	output G;
	output P;
	wire w1,w2,w3,w4,w5,w6,w9,w10,w11,w12;
	wire C0,C1,C2,P0,P1,P2,P3,G0,G1,G2,G3;
	//first CLA unit
	//C0 = G0 + P0.in
	CLA U1(A[0],B[0],in,S[0],G0,P0);	
	and U5(w1,in,P0);
	or U6(C0,G0,w1);
	
	//Second CLA unit
	//C1 = G1+C0P1 = G1 + G0P1 + P1.P0.in 
	CLA U2(A[1],B[1],C0,S[1],G1,P1);	
	and U7(w2,G0,P1);
	and U11(w5,P1,P0,in);
	or U8(C1,G1,w2,w5);
	
	//Third cla unit
	//C2 = G2 + G1P2 + G0P2P1 + P2P1P0in
	CLA U3(A[2],B[2],C1,S[2],G2,P2);	
	and U9(w3,G1,P2);
	and U12(w6,G0,P2,P1);
	and U13(w7,P2,P1,P0,in);
	or U10(C2,G2,w3,w6,w7);
	
	//Fourth Cla unit
	//C3 = G3 + G2P3 + G1P3P2 + G0P3P2P1 + P3P2P1P0in
	CLA U4(A[3],B[3],C2,S[3],G3,P3);	
	and U14(w8,G2,P3);
	and U15(w9,G1,P3,P2);
	and U16(w10,G0,P3,P2,P1);
	and U17(w11,P3,P2,P1,P0,in);
	or U18(C,G3,w8,w9,w10,w11);
	//Compute block generate and propagate
	and U19(P,P3,P2,P1,P0);
	or U20(G,G3,w8,w9,w10);
	
	
endmodule
