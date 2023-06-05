`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060 
// 
// Create Date:    07:11:56 08/27/2021 
// Design Name: 
// Module Name:    LCU 
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
module LCU(P,G,in,C,Pout,Gout);
	
	input [3:0] P;
	input [3:0] G; 
	input in;
	output [3:0] C;
	output Pout,Gout;
	wire w1,w2,w3,w4;
	//First CLA4 unit
	//C0 = G0 + P0in		
	and U5(w1,in,P[0]);
	or U6(C[0],G[0],w1);
	//Second CLA4 unit
	//C1 = G1+C0P1 = G1 + G0P1 + P1.P0.in 
	
	and U7(w2,G[0],P[1]);
	and U11(w5,P[1],P[0],in);
	or U8(C[1],G[1],w2,w5);
	//Third CLA4 unit
	//C2 = G2 + G1P2 + G0P2P1 + P2P1P0in
	and U9(w3,G[1],P[2]);
	and U12(w6,G[0],P[2],P[1]);
	and U13(w7,P[2],P[1],P[0],in);
	or U10(C[2],G[2],w3,w6,w7);;
	//Fourth CLA4 unit
	//C3 = G3 + G2P3 + G1P3P2 + G0P3P2P1 + P3P2P1P0in
	and U14(w8,G[2],P[3]);
	and U15(w9,G[1],P[3],P[2]);
	and U16(w10,G[0],P[3],P[2],P[1]);
	and U17(w11,P[3],P[2],P[1],P[0],in);
	or U18(C[3],G[3],w8,w9,w10,w11);
	//Compute block generate and propagate
	and U19(Pout,P[3],P[2],P[1],P[0]);
	or U20(Gout,G[3],w8,w9,w10);

endmodule
