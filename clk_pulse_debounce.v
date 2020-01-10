`timescale 1ns / 1ps
//MUDIT

module clk_pulse(
    input clk_200H,
    input inp_0,
    input inp_1,
    output clk_pulse
    );
    wire inp_comp;
    reg FF1_next, FF2_next, FF3_next;
    reg FF1_reg, FF2_reg, FF3_reg;
    
    assign inp_comp = inp_0 | inp_1;
    
    always@(posedge clk_200H)
    begin 
        FF1_reg <=FF1_next;
        FF2_reg <= FF2_next;
        FF3_reg <= FF3_next;
    end
    
   always@(*)
       FF1_next = inp_comp;
    
   always@(*)
       FF2_next = FF1_reg ;
        
   always@(*)
       FF3_next = FF2_reg ;
        
   always@(*)
       FF3_next = FF2_reg ;
        
    
    assign clk_pulse = FF1_reg & FF2_reg & (~FF3_reg);
    
endmodule
