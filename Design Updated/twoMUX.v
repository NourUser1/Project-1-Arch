//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 11:33:04 AM
// Design Name: 
// Module Name: twoMUX
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


module twoMUX # (parameter  N= 32)(
input [N-1:0] i0,
input [N-1:0] i1,
input sel,
output [N-1:0] out
);
    assign out = sel ? i1:i0 ;
endmodule
