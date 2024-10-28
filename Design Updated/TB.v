`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 03:11:45 PM
// Design Name: 
// Module Name: TB
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


module TB(

    );
    reg clk; reg ssdClock; reg rst; reg [1:0]ledSel; reg [3:0] ssdSel; wire [15:0] LED; wire [3:0] anode; wire [6:0] LEDout;
    pipelined test(.clk(clk), .ssd_clock(ssdClock), .reset(rst), .ledSel(ledSel), .ssdSel(ssdSel), .LED(LED), .Anode(anode), .LED_out(LEDout));
    localparam period = 20;
    initial 
    begin
    clk = 1;
    forever 
    #(period/2) clk =~clk;
    end
    initial begin
    rst = 1;
    ledSel = 2'b00;
    ssdSel = 4'b0000;
    #period
    
    rst = 0;
    ledSel = 2'b01;
    ssdSel = 4'b1100;
    
    #period

    rst = 0;
    ledSel = 2'b10;
    ssdSel = 4'b0011;
    end
endmodule




