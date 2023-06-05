`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Anurat Bhattacharya : 19CS10071
// Sunanda Mandal : 19CS10060
// 
// Create Date:    18:14:22 08/25/2021 
// Design Name: 
// Module Name:    CLA 
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
module CLA(
    input a,
    input b,
    input in,
    output S,
    output G,
    output P
    );
	 
	xor G1(P,a,b);//Propagate
	and G2(G,a,b);//Generate
	xor G0(S,P,in);//Sum Bit
	

endmodule
