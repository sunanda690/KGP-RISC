`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Group 2
// 
// Create Date:    11:31:43 11/04/2021 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(WriteReg,WriteData,RegWrite,ReadReg1,ReadReg2,ReadData1,ReadData2,rst,Clk,rout);
	input [4:0] WriteReg;
	input Clk;
	input [31:0] WriteData;	
	input rst;
	input RegWrite;
	output [31:0] rout;//output register equal to r30
	input [4:0] ReadReg1,ReadReg2;
	output  [31:0] ReadData1,ReadData2;
	wire [31:0] writeOneHot;
	//The initial binary to one hot decoder
	RegDecoder U1(.RegWrite(RegWrite),.WriteReg(WriteReg),.WriteFlag(writeOneHot));
	
	wire [1023:0] D;//inputs
	wire [1023:0] Q;//outputs 
	//mux and dff for each register of the 32 registers
	
	mux_2_1_32 U2(.A0(Q[31:0]),.A1(WriteData),.sel(writeOneHot[0]),.res(D[31:0]));
	mux_2_1_32 U3(.A0(Q[63:32]),.A1(WriteData),.sel(writeOneHot[1]),.res(D[63:32]));
	mux_2_1_32 U4(.A0(Q[95:64]),.A1(WriteData),.sel(writeOneHot[2]),.res(D[95:64]));
	mux_2_1_32 U5(.A0(Q[127:96]),.A1(WriteData),.sel(writeOneHot[3]),.res(D[127:96]));
	mux_2_1_32 U6(.A0(Q[159:128]),.A1(WriteData),.sel(writeOneHot[4]),.res(D[159:128]));
	mux_2_1_32 U7(.A0(Q[191:160]),.A1(WriteData),.sel(writeOneHot[5]),.res(D[191:160]));
	mux_2_1_32 U8(.A0(Q[223:192]),.A1(WriteData),.sel(writeOneHot[6]),.res(D[223:192]));
	mux_2_1_32 U9(.A0(Q[255:224]),.A1(WriteData),.sel(writeOneHot[7]),.res(D[255:224]));
	mux_2_1_32 U10(.A0(Q[287:256]),.A1(WriteData),.sel(writeOneHot[8]),.res(D[287:256]));
	mux_2_1_32 U11(.A0(Q[319:288]),.A1(WriteData),.sel(writeOneHot[9]),.res(D[319:288]));
	mux_2_1_32 U12(.A0(Q[351:320]),.A1(WriteData),.sel(writeOneHot[10]),.res(D[351:320]));
	mux_2_1_32 U13(.A0(Q[383:352]),.A1(WriteData),.sel(writeOneHot[11]),.res(D[383:352]));
	mux_2_1_32 U14(.A0(Q[415:384]),.A1(WriteData),.sel(writeOneHot[12]),.res(D[415:384]));
	mux_2_1_32 U15(.A0(Q[447:416]),.A1(WriteData),.sel(writeOneHot[13]),.res(D[447:416]));
	mux_2_1_32 U16(.A0(Q[479:448]),.A1(WriteData),.sel(writeOneHot[14]),.res(D[479:448]));
	mux_2_1_32 U17(.A0(Q[511:480]),.A1(WriteData),.sel(writeOneHot[15]),.res(D[511:480]));
	mux_2_1_32 U18(.A0(Q[543:512]),.A1(WriteData),.sel(writeOneHot[16]),.res(D[543:512]));
	mux_2_1_32 U19(.A0(Q[575:544]),.A1(WriteData),.sel(writeOneHot[17]),.res(D[575:544]));
	mux_2_1_32 U20(.A0(Q[607:576]),.A1(WriteData),.sel(writeOneHot[18]),.res(D[607:576]));
	mux_2_1_32 U21(.A0(Q[639:608]),.A1(WriteData),.sel(writeOneHot[19]),.res(D[639:608]));
	mux_2_1_32 U22(.A0(Q[671:640]),.A1(WriteData),.sel(writeOneHot[20]),.res(D[671:640]));
	mux_2_1_32 U23(.A0(Q[703:672]),.A1(WriteData),.sel(writeOneHot[21]),.res(D[703:672]));
	mux_2_1_32 U24(.A0(Q[735:704]),.A1(WriteData),.sel(writeOneHot[22]),.res(D[735:704]));
	mux_2_1_32 U25(.A0(Q[767:736]),.A1(WriteData),.sel(writeOneHot[23]),.res(D[767:736]));
	mux_2_1_32 U26(.A0(Q[799:768]),.A1(WriteData),.sel(writeOneHot[24]),.res(D[799:768]));
	mux_2_1_32 U27(.A0(Q[831:800]),.A1(WriteData),.sel(writeOneHot[25]),.res(D[831:800]));
	mux_2_1_32 U28(.A0(Q[863:832]),.A1(WriteData),.sel(writeOneHot[26]),.res(D[863:832]));
	mux_2_1_32 U29(.A0(Q[895:864]),.A1(WriteData),.sel(writeOneHot[27]),.res(D[895:864]));
	mux_2_1_32 U30(.A0(Q[927:896]),.A1(WriteData),.sel(writeOneHot[28]),.res(D[927:896]));
	mux_2_1_32 U31(.A0(Q[959:928]),.A1(WriteData),.sel(writeOneHot[29]),.res(D[959:928]));
	mux_2_1_32 U32(.A0(Q[991:960]),.A1(WriteData),.sel(writeOneHot[30]),.res(D[991:960]));
	mux_2_1_32 U33(.A0(Q[1023:992]),.A1(WriteData),.sel(writeOneHot[31]),.res(D[1023:992]));
	
	DFF_32 U34(.D(D[31:0]),.Q(Q[31:0]),.rst(rst),.clk(Clk));
	DFF_32 U35(.D(D[63:32]),.Q(Q[63:32]),.rst(rst),.clk(Clk));
	DFF_32 U36(.D(D[95:64]),.Q(Q[95:64]),.rst(rst),.clk(Clk));
	DFF_32 U37(.D(D[127:96]),.Q(Q[127:96]),.rst(rst),.clk(Clk));
	DFF_32 U38(.D(D[159:128]),.Q(Q[159:128]),.rst(rst),.clk(Clk));
	DFF_32 U39(.D(D[191:160]),.Q(Q[191:160]),.rst(rst),.clk(Clk));
	DFF_32 U40(.D(D[223:192]),.Q(Q[223:192]),.rst(rst),.clk(Clk));
	DFF_32 U41(.D(D[255:224]),.Q(Q[255:224]),.rst(rst),.clk(Clk));
	DFF_32 U42(.D(D[287:256]),.Q(Q[287:256]),.rst(rst),.clk(Clk));
	DFF_32 U43(.D(D[319:288]),.Q(Q[319:288]),.rst(rst),.clk(Clk));
	DFF_32 U44(.D(D[351:320]),.Q(Q[351:320]),.rst(rst),.clk(Clk));
	DFF_32 U45(.D(D[383:352]),.Q(Q[383:352]),.rst(rst),.clk(Clk));
	DFF_32 U46(.D(D[415:384]),.Q(Q[415:384]),.rst(rst),.clk(Clk));
	DFF_32 U47(.D(D[447:416]),.Q(Q[447:416]),.rst(rst),.clk(Clk));
	DFF_32 U48(.D(D[479:448]),.Q(Q[479:448]),.rst(rst),.clk(Clk));
	DFF_32 U49(.D(D[511:480]),.Q(Q[511:480]),.rst(rst),.clk(Clk));
	DFF_32 U50(.D(D[543:512]),.Q(Q[543:512]),.rst(rst),.clk(Clk));
	DFF_32 U51(.D(D[575:544]),.Q(Q[575:544]),.rst(rst),.clk(Clk));
	DFF_32 U52(.D(D[607:576]),.Q(Q[607:576]),.rst(rst),.clk(Clk));
	DFF_32 U53(.D(D[639:608]),.Q(Q[639:608]),.rst(rst),.clk(Clk));
	DFF_32 U54(.D(D[671:640]),.Q(Q[671:640]),.rst(rst),.clk(Clk));
	DFF_32 U55(.D(D[703:672]),.Q(Q[703:672]),.rst(rst),.clk(Clk));
	DFF_32 U56(.D(D[735:704]),.Q(Q[735:704]),.rst(rst),.clk(Clk));
	DFF_32 U57(.D(D[767:736]),.Q(Q[767:736]),.rst(rst),.clk(Clk));
	DFF_32 U58(.D(D[799:768]),.Q(Q[799:768]),.rst(rst),.clk(Clk));
	DFF_32 U59(.D(D[831:800]),.Q(Q[831:800]),.rst(rst),.clk(Clk));
	DFF_32 U60(.D(D[863:832]),.Q(Q[863:832]),.rst(rst),.clk(Clk));
	DFF_32 U61(.D(D[895:864]),.Q(Q[895:864]),.rst(rst),.clk(Clk));
	DFF_32 U62(.D(D[927:896]),.Q(Q[927:896]),.rst(rst),.clk(Clk));
	DFF_32 U63(.D(D[959:928]),.Q(Q[959:928]),.rst(rst),.clk(Clk));
	DFF_32 U64(.D(D[991:960]),.Q(Q[991:960]),.rst(rst),.clk(Clk));
	DFF_32 U65(.D(D[1023:992]),.Q(Q[1023:992]),.rst(rst),.clk(Clk));
	
	
	assign rout = Q[991:960];//output register
	//wire [31:0] ReadData1_,ReadData2_;
	mux_32_1_32 U66(.Datain(Q),.Out(ReadData1),.Sel(ReadReg1));
	mux_32_1_32 U67(.Datain(Q),.Out(ReadData2),.Sel(ReadReg2));
	
	
	
endmodule
