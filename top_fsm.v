`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2019 11:00:51
// Design Name: 
// Module Name: top_fsm
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


module top_fsm(
    input clk,
    input clear,
    input inp_1,
    input inp_0,
    output led,
    output [7:0] int_cathode,
    output [3:0] int_anode
    );
    
    wire clk_6M;
    clk_wiz_6M  clk_gen_6M (.clk_out1(clk_6M), .clk_in1(clk));
    
    wire clk_200H;
    clk_div #(15) clk3(.clk_in(clk_6M), .clk_out(clk_200H));
    
    wire clk_1K;
    clk_div #(12) u2(.clk_in(clk_6M), .clk_out(clk_1K));
    
    wire clk_pulse;
    clk_pulse clk4(.clk_200H(clk_200H), .inp_0(inp_0), .inp_1(inp_1), .clk_pulse(clk_pulse));
    
    wire [2:0] number ;
    fsm_11011_mealy u1(.clk(clk_pulse), .clear(clear), .din(inp_1), .dout(led) , .present_state(number));
    
     sevenSegment u3(.clk(clk_1K), .ones({0,number}), .tens(4'b0000), .hundreds(4'b0000), .thousands(4'b0000), .ssd_cathode(int_cathode), .ssd_anode(int_anode));
     
     
    
    
    
endmodule
