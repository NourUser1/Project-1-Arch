`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 01:05:40 PM
// Design Name: 
// Module Name: registerFile
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

module registerFile #(parameter N=32) (
input clk,
input rst,
input [4:0] ReadReg1,
input [4:0] ReadReg2,
input [4:0] WriteReg,
input write,
input [N-1:0] data,
output [N-1:0] reg1,
output [N-1:0] reg2
);

    reg [N-1:0] regFile [31:0];
    assign reg1 = regFile [ReadReg1];
    assign reg2 = regFile [ReadReg2];

    integer i;
    always @ (posedge clk or posedge rst) begin

        if (rst==1'b1) begin
            for (i=0;i<32; i=i+1)
                regFile[i]={N{0}};
        end
        else if (write==1'b1 && WriteReg != 4'd0) begin
            regFile[WriteReg]=data;
        end else begin
            regFile[WriteReg]=regFile[WriteReg];
        end

    end 
    
endmodule
