`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2023 02:40:50 PM
// Design Name: 
// Module Name: memory
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

module memory(
input clk, 
input MemRead, 
input MemWrite,
input [2:0] funct3, 
input [31:0] addr, 
input [31:0] data_in, 
output reg [31:0] data_out
);

    reg [7:0] mem [0:255];
    
    always @ (*) begin
        if(MemRead) begin
        case (funct3)
            3'b000:  //load byte
            data_out = $signed({mem[addr]});    
    
            3'b001: // load half word
            data_out = $signed({mem[addr], mem[addr+1]});  
    
            3'b010: // load word
            data_out = $signed({mem[addr],mem[addr+1],mem[addr+2],mem[addr+3]}); 
    
            3'b100: // load byte unsigned
            data_out = mem[addr];              
    
            3'b101: //load half word unsigned
            data_out = {mem[addr], mem[addr+1]};
    
            default: data_out = 32'hZZZZZZZZ;
        endcase
        end else begin
        data_out = 32'hZZZZZZZZ;
        end
    end
    
    always @ (posedge clk) begin
        if(MemWrite) begin
            case (funct3)
                3'b000: //store byte
                mem[addr] = data_in[7:0];
    
                3'b001: //store half word
                {mem[addr], mem[addr+1]} = data_in[15:0];    
    
                3'b010: //store word
                {mem[addr],mem[addr+1],mem[addr+2],mem[addr+3]}= data_in;     
    
                default: mem[addr] = mem[addr];
            endcase
        end else begin
            mem[addr] = mem[addr];
        end
    end
    initial begin
   $readmemh("C://Users//mohamedwaleedelshemy//Desktop/btest.mem", mem);
    end 

endmodule