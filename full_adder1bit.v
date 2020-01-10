`timescale 1ns / 1ps
// Author: Abhimanyu Jha

module full_adder(
    input Ain,
    input Bin,
    input Cin,
    output Sout,
    output Cout
    );
    assign Sout=Ain^Bin^Cin; 
    assign Cout=(Ain&Bin) | (Cin&(Ain^Bin));
   
endmodule
