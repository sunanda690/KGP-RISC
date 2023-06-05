`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Group 2
// 
// Create Date:    12:18:24 11/03/2021 
// Design Name: 
// Module Name:    controller 
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






module controller(
	input[5:0] opcode,
	//input[5:0] func,
	output reg[2:0] alu_op,
	output reg[1:0] alusrc,
	output reg memWrite, memToReg, branch, jump, regWrite, write_rs, A_0, B_0, write31, chkcarry,carryval
    );
	 
	 always @(opcode)
	 begin
		//init
		
			case(opcode)
				//add, and,xor, shllv,shrlv, shrav
				6'b000000:
					begin
						alusrc = 2'b00;
						alu_op = 3'b000;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b1;
						write_rs = 1'b0;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//comp
				6'b000001:
					begin
						alusrc = 2'b00;
						alu_op = 3'b000;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b1;
						write_rs = 1'b0;
						A_0 = 1'b1;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//addi
				6'b000010:
					begin
						alusrc = 2'b01;
						alu_op = 3'b101;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b1;
						write_rs = 1'b0;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//compi
				6'b000011:
					begin
						alusrc = 2'b01;
						alu_op = 3'b110;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b1;
						write_rs = 1'b0;
						A_0 = 1'b1;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//shll,shrl,shra
				6'b000100:
					begin
						alusrc = 2'b10;
						alu_op = 3'b000;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b1;
						write_rs = 1'b0;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//b
				6'b000101:
					begin
						alusrc = 2'bxx;
						alu_op = 3'bxxx;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b1;
						regWrite = 1'b0;
						write_rs = 1'bx;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'b0;						
						carryval = 1'bx;
					end
				//bl
				6'b000110:
					begin
						alusrc = 2'bxx;
						alu_op = 3'bxxx;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b1;
						regWrite = 1'b1;
						write_rs = 1'bx;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b1;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//bcy
				6'b000111:
					begin
						alusrc = 2'bxx;
						alu_op = 3'bxxx;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b1;
						regWrite = 1'b0;
						write_rs = 1'bx;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'b1;
						carryval = 1'b1;
					end
				//bncy
				6'b001000:
					begin
						alusrc = 2'bxx;
						alu_op = 3'bxxx;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b1;
						regWrite = 1'b0;
						write_rs = 1'bx;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'b1;
						carryval = 1'b0;
					end
				//lw
				6'b001001:
					begin
						alusrc = 2'b01;
						alu_op = 3'b001;
						memWrite = 1'b0;
						memToReg = 1'b1;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b1;
						write_rs = 1'b1;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//sw
				6'b001010:
					begin
						alusrc = 2'b01;
						alu_op = 3'b001;
						memWrite = 1'b1;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b0;
						write_rs = 1'bx;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//br
				6'b001011:
					begin
						alusrc = 2'bxx;
						alu_op = 3'bxxx;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b1;
						jump = 1'b1;
						regWrite = 1'b0;
						write_rs = 1'bx;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//bltz
				6'b001100:
					begin
						alusrc = 2'bxx;//dont care
						alu_op = 3'b010;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b1;
						jump = 1'b0;
						regWrite = 1'b0;
						write_rs = 1'bx;//dont care
						A_0 = 1'b0;
						B_0 = 1'b1;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//bz
				6'b001101:
					begin
						alusrc = 2'bxx;//dont care
						alu_op = 3'b011;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b1;
						jump = 1'b0;
						regWrite = 1'b0;
						write_rs = 1'bx;//dont care
						A_0 = 1'b0;
						B_0 = 1'b1;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				//bnz
				6'b001110:
					begin
						alusrc = 2'bxx;//dont care
						alu_op = 3'b100;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b1;
						jump = 1'b0;
						regWrite = 1'b0;
						write_rs = 1'bx;//dont care
						A_0 = 1'b0;
						B_0 = 1'b1;
						write31 = 1'b0;
						chkcarry = 1'bx;
						carryval = 1'bx;
					end
				default:
					begin
						alusrc = 2'b00;
						alu_op = 3'b000;
						memWrite = 1'b0;
						memToReg = 1'b0;
						branch = 1'b0;
						jump = 1'b0;
						regWrite = 1'b0;
						write_rs = 1'b0;
						A_0 = 1'b0;
						B_0 = 1'b0;
						write31 = 1'b0;
						chkcarry = 1'b0;
						carryval = 1'b0;
					end
				
			endcase
	 end

endmodule
