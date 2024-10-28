//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 10:08:46 AM
// Design Name: 
// Module Name: branchModule
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

`timescale 1ns / 1ps
`include "defines.v"


module branchModule(
    input zf, 
    input vf, 
    input sf, 
    input cf, 
    input [2:0] funct3, 
    input branch, 
    output reg branchResult 
);
    
    always @(*) begin
        if (branch) begin
            case(funct3)
                `BR_BEQ: branchResult=zf;
                `BR_BNE: branchResult=~zf;
                `BR_BLT: branchResult=(sf!=vf);
                `BR_BGE: branchResult=(sf==vf);         
                `BR_BLTU: branchResult=~cf;         
                `BR_BGEU: branchResult= cf;    
                default: branchResult = 1'b0;
            endcase
        end
        else branchResult = 1'b0;
    
    end

endmodule
