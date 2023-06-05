`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Group 2
// 
// Create Date:    09:16:44 11/03/2021 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(
	input[2:0] alu_op,
	input[5:0] func,
	output reg[6:0] alu_control //3 bit op, 1bit inv_A, 1bit cin, 2bit for branch tyoe
    );
	always @(alu_op, func)
		begin
		 if(alu_op == 3'b000)
			begin
			 case(func)
					6'b00000: //add
						begin
							alu_control = 7'b0100011;
						end
					6'b00001: //comp
						begin
							alu_control = 7'b0101111;
						end
					6'b00010: //and
						begin
							alu_control = 7'b0000011;
						end
					6'b00011: //xor
						begin
							alu_control = 7'b0010011;
						end
					6'b00100: //shll, shllv
						begin
							alu_control = 7'b0110011;
						end
					6'b00101: //shrl, shrlv
						begin
							alu_control = 7'b1000011;
						end
					6'b00110: //shra, shrav
						begin
							alu_control = 7'b1010011;
						end
					default:
						begin
							alu_control = 7'b0;
						end
					endcase
				end
			else if(alu_op == 3'b001) //lw, sw
				begin
					alu_control = 7'b0100011;
				end
			else if(alu_op == 3'b010) //bltz
				begin
					alu_control = 7'b0100010;
				end
			else if(alu_op == 3'b011) //bz
				begin
					alu_control = 7'b0100000;
				end
			else if(alu_op == 3'b100) //bnz
				begin
					alu_control = 7'b0100001;
				end
			else if(alu_op==3'b101)//addi				
			begin
				alu_control = 7'b0100011;
			end
			else if(alu_op==3'b110)//compi
			begin
				alu_control = 7'b0101111;
			end
			else
				begin
					alu_control = 7'b0;
				end

		end
endmodule
