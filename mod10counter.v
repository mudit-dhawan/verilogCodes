`timescale 1ns / 1ps

module counter(
    input clk,
    input reset,
    output [3:0] count
    );
reg [3:0] count_reg=0;
reg [3:0] count_next=0;

always@(posedge clk)
begin
    
    if(reset || count_reg==4'd9)   
        count_reg<=0;
    else
        count_reg<=count_next;
end
always@(*)
begin
    count_next=count_reg +4'd1;
end

assign count = count_reg;
endmodule



