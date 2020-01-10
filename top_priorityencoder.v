`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2019 16:23:24
// Design Name: 
// Module Name: top_priorityencoder
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


module top_priorityencoder(
    input [3:0] Inp,
    output [1:0] Out,
    output ValidInput
    );
    
    assign Out[1] = Inp[2] | Inp[3];
    assign Out[0] = ((~Inp[2]) & Inp[1]) | Inp[3];
    assign ValidInput = (Inp[0] | Inp[1] | Inp[2] | Inp[3]);
    
//    or G1(Out[1], Inp[2],Inp[3]);
//    or G2(Out[0], 
    
    
endmodule
