`timescale 1ns / 1ps

// DIVIDES CLK BY 2^(divide_by)
// CLK=5 MHz (usually)
module clk_div
    #(
    parameter divide_by=19
    )
    (
    input clk_in,
    output clk_out
    );
    reg [divide_by-1:0] count=0;
    
    always@(posedge clk_in)
    begin
        count=count+1;
    end
    
    assign clk_out=count[divide_by-1];
endmodule
