`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 12:12:40 PM
// Design Name: 
// Module Name: forwardingUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module forwardingUnit (
input [4:0] ID_EXE_rs1,
input [4:0] ID_EXE_rs2,
input MEM_WB_regWrite,
input [4:0] MEM_WB_regRd,
output reg forwardA,
output reg forwardB
    );
    always @(*)
    begin

        if( (MEM_WB_regWrite) && (MEM_WB_regRd != 5'd0) && (MEM_WB_regRd == ID_EXE_rs1))
        begin  
		forwardA = 1'b1; 
	end
        else 
        	forwardA =1'b0; 
    
        if( (MEM_WB_regWrite) && (MEM_WB_regRd != 5'd0) && (MEM_WB_regRd == ID_EXE_rs2))
        begin 
		forwardB = 1'b1; 
	end
        else
       		forwardB = 1'b0;
        end   
endmodule
