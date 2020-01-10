`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2019 15:12:25
// Design Name: 
// Module Name: 4to2_priority_encoder
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


module priority_encoder_4to2(
    input [3:0] inp,
    output [1:0] out
    );
    assign out[1]= inp[2] | inp[3];
    assign out[0]= (~inp[2])&inp[1] | inp[3];
    
endmodule
