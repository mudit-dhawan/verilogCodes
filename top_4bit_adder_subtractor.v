`timescale 1ns / 1ps
// Authors: Abhimanyu(2017126), Mudit (2018059) 
module top_4bit_adder_subtractor(
    input [3:0] A,
    input [3:0] B,
    input subtract,
    output [4:0] Sum
    );
    // B XOR with subtract is Bx
    wire Bx[3:0];
    wire w1, w2, w3, w4;
    assign Bx[0]=B[0]^subtract;
    assign Bx[1]=B[1]^subtract;
    assign Bx[2]=B[2]^subtract;
    assign Bx[3]=B[3]^subtract;
    
    full_adder
        inst_1(.Ain(A[0]),.Bin(Bx[0]),.Cin(subtract),.Cout(w1),.Sout(Sum[0])),
        inst_2(.Ain(A[1]),.Bin(Bx[1]),.Cin(w1),.Cout(w2),.Sout(Sum[1])),
        inst_3(.Ain(A[2]),.Bin(Bx[2]),.Cin(w2),.Cout(w3),.Sout(Sum[2])),
        inst_4(.Ain(A[3]),.Bin(Bx[3]),.Cin(w3),.Cout(w4),.Sout(Sum[3]));

      assign Sum[4]=w4;    
endmodule
