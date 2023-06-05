`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    06:21:02 08/27/2021 
// Design Name: 
// Module Name:    CLA16_CLU 
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
module CLA16_CLU(A,B,in,S,Cout,Pout,Gout);
//With separate look ahead unit
	input [15:0] A,B;
	input in;
	output[15:0] S;
	output Pout,Gout,Cout;
	wire [3 :0] P;
	wire	[3:0] G;
	wire [3:0] C;
	wire w1,w2,w3,w4;
	//First CLA4 unit
	//C0 = G0 + P0in
	CLA4 U1(A[3:0],B[3:0],in,S[3:0],C5,G[0],P[0]);	

	//Second CLA4 unit
	CLA4 U2(A[7:4],B[7:4],C[0],S[7:4],C6,G[1],P[1]);	

	//Third CLA4 unit
	CLA4 U3(A[11:8],B[11:8],C[1],S[11:8],C7,G[2],P[2]);	

	//Fourth CLA4 unit
	CLA4 U4(A[15:12],B[15:12],C[2],S[15:12],C8,G[3],P[3]);	
	
	//LCU unit
	LCU U5(P,G,in,C,Pout,Gout);
	assign Cout = C[3];

	

endmodule