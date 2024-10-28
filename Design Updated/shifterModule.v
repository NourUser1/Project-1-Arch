`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 05:26:28 PM
// Design Name: 
// Module Name: shifterModule
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

module shifterModule (
input [31:0] a,
input [4:0] shamt,
input [1:0] type,
output reg [31:0] r
);
    
    always @(*) begin
        case (type)
            2'b00: r = a >> shamt; //shift right logical
            2'b01: r = a << shamt; //shift left logical
            2'b10: r = ($signed(a) >>> shamt); //shift right arithmetic
            default: r = a; 
        endcase
    end
    
endmodule

