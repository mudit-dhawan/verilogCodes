`timescale 1ns / 1ps


module clock_div_2n
    #(
    parameter divide_by=5
    )
    (
    input clk_in,
    output clk_out
    );
	reg Out;
    integer count=0;
    
    always@(posedge clk_in)
    begin
		if( count < (divide_by>>1) )
			Out= 0;
		else
			Out =1;
		
		count=count+1;
		
		if(count == divide_by)
			count = 0 ;
			
        
    end
    
    assign clk_out= Out;
endmodule
