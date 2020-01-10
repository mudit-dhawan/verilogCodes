`timescale 1ns / 1ps
//MUDIT

module fsm_11011_mealy(
    input clk,
    input clear,
    input din,
    output reg dout,
    output reg [2:0] present_state
    );
    
    //variable to store the next state, depending on the number the size is decided 
    reg [2:0] next_state;
    
    // paramaters are used to name the different states so that numerical representation less
    parameter s0= 3'b000, s1= 3'b001, s2= 3'b010, s3= 3'b011, s4=3'b100;
    
    //sequential always block for reg updation 
    
    always@(posedge clk or posedge clear)
    begin 
        if( clear ==1)
            present_state <= s0;
        else 
            present_state <= next_state ;
    end
    
    // combinational always block  next variable updation 
    always@(present_state)
    begin
        case(present_state)
            s0: if(din ==1 )
                    next_state <=s1;
                else 
                    next_state <= s0;
            
            s1: if(din ==1 )
                    next_state <=s2;
                else 
                    next_state <= s0;
            
            s2: if(din ==0 )
                    next_state <=s3;
                else 
                    next_state <= s2;
            
            s3: if(din ==1 )
                    next_state <=s4;
                else 
                    next_state <= s0;  
            
            s4: if(din ==1 )
                    next_state <=s2;
                else 
                    next_state <= s0;
            
            default: next_state <= s0;
       endcase
    end  
    
    always@(posedge clk)
    begin 
        if(present_state == s4 && din ==1)
            dout <= 1;
        else 
            dout <=0;
   end 
                 
endmodule
