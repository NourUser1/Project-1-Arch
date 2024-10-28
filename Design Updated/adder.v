//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 11:08:46 AM
// Design Name: 
// Module Name: adder
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


module adder #(parameter N = 32)(
a, b, sum
);
    
    input [N-1:0] a, b;
    output [N:0] sum; // {cout, sum} = adder(a, b, sum)
    wire [N-1:0] C;

    genvar i;
    
    //first bit
    FA bit0(b[0], a[0],1'b0 ,sum[0], C[1]);
    
    generate

    //remaining bits
        for(i = 1; i < N-1 ; i = i + 1)begin : add
            FA restBits (b[i], a[i], C[i],sum[i], C[i+1]);
        end 

    endgenerate
    
    //last bit
    FA bitNminus1 (b[N-1], a[N-1], C[N-1], sum[N-1], sum[N]);
    
endmodule
