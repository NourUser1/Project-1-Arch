`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 12:52:05 PM
// Design Name: 
// Module Name: fourMUX
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

module fourMUX # (parameter  N= 32)(
input [N-1:0] i0,
input [N-1:0] i1,
input [N-1:0] i2,
input [N-1:0] i3,
input [1:0] sel,
output [N-1:0] out
);
    
    assign out = sel[1] ? (sel[0] ? i3:i2) : (sel[0] ? i1:i0);
    
endmodule
