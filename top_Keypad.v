`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2019 10:52:47
// Design Name: 
// Module Name: top_Keypad
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


module top_Keypad(
    input clk,
    inout [7:0] JA,
    output [3:0] int_anode,
    output [7:0] int_cathode
    );
    
    wire [3:0] DecodeOut;
    
    Decoder c0(.clk(clk),.Row(JA[7:4]),.Col(JA[3:0]),.DecodeOut(DecodeOut));
    
    seven_seg_display ssd(.sum(DecodeOut), .anode(int_anode), .cathode(int_cathode));
endmodule
