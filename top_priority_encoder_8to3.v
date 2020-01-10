`timescale 1ns / 1ps
// Authors: Mudit(2018159) & Abhimanyu(2017126)
module top_8to3_priority_encoder(
    input [7:0] inp,
    output reg [2:0] out
    );
    //To use select line in always block for if-else statements
    reg sel;
    //Getting outputs from external module
    wire [1:0] op1, op2;
    //getting instances p1, p2
    priority_encoder_4to2
                    p1(.inp(inp[3:0]),.out(op1[1:0])),
                    p2(.inp(inp[7:4]),.out(op2[1:0]));                    
    always @ *
        begin
            // select line will be high when
            // first 4 MSB are high
            sel=inp[4]|inp[5]|inp[6]|inp[7];
            // MSB of output is same as select line
            out[2]=sel;
            
            // using select line to direct outputs
            if (sel) 
                begin
                    out[1:0]=op2[1:0];
                end
            else
                begin 
                    out[1:0]=op1[1:0];
                end          
        end
endmodule
