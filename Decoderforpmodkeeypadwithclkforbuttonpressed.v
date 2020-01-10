`timescale 1ns / 1ps

module Decoder(

    input clk,
    input [3:0] Row,
    output reg [3:0] Col,
    output reg[3:0] DecodeOut,
    output reg ButtonPressed
    );
    
    reg[19:0] sclk=0;
    reg flag=0;
    always@(posedge clk) begin
            // 1ms  CHECK COL1 00011000011010100000
            if(sclk==20'b00011000011010100000)begin
                    Col<=4'b0111;
                    sclk<=sclk+1'b1;
            end
            
            else if(sclk==20'b00011000011010101000)begin
                if(Row==4'b0111) begin
                    flag=1;
                    DecodeOut <= 4'b0001; //1

                end
                
                if(Row==4'b1011) begin
                    flag=1;
                    DecodeOut <= 4'b0100; //4
                end
                
                if(Row==4'b1101) begin
                    flag=1;
                    DecodeOut <= 4'b0111; //7
                end
                
                if(Row==4'b1110) begin
                    flag=1;
                    DecodeOut <= 4'b0000; //0
                end
                sclk<=sclk+1'b1;              
            end //1ms OVER
            
            // 2ms CHECK COL2 
            else if(sclk==20'b00110000110101000000)begin
                    Col<=4'b1011;
                    sclk<=sclk+1'b1;
            end
            
            else if(sclk==20'b00110000110101001000)begin
                if(Row==4'b0111) begin
                    flag=1;
                    DecodeOut <= 4'b0010; //2
                end
                
                if(Row==4'b1011) begin
                    flag=1;
                    DecodeOut <= 4'b0101; //5
                end
                
                if(Row==4'b1101) begin
                    flag=1;
                    DecodeOut <= 4'b1000; //8
                end
                
                if(Row==4'b1110) begin
                    flag=1;
                    DecodeOut <= 4'b1111; //F
                end
                sclk<=sclk+1'b1; 
            end //2ms OVER
            
            // 3ms CHECK COL3
            else if(sclk==20'b01001001001111100000)begin
                    Col<=4'b1101;
                    sclk<=sclk+1'b1;
            end
            
            else if(sclk==20'b01001001001111101000)begin
                if(Row==4'b0111) begin
                    flag=1;
                    DecodeOut <= 4'b0011;//3
                end
                
                if(Row==4'b1011) begin
                    flag=1;
                    DecodeOut <= 4'b0110;//6
                end
                
                if(Row==4'b1101) begin
                   flag=1;
                    DecodeOut <= 4'b1001;//9
                end
                
                if(Row==4'b1110) begin
                    flag=1;
                    DecodeOut <= 4'b1110;//E
                end
                sclk<=sclk+1'b1;
            end// 3ms OVER
            
            // 4ms CHECK COL4
            else if(sclk==20'b01100001101010000000)begin
                    Col<=4'b1110;
                    sclk<=sclk+1'b1;
            end
            
            else if(sclk==20'b01100001101010001000)begin
                if(Row==4'b0111) begin
                    flag=1;
                    DecodeOut <= 4'b1010;//A (10)
                end
                
                if(Row==4'b1011) begin
                    flag=1;
                    DecodeOut <= 4'b1011;//B (11)
                end
                
                if(Row==4'b1101) begin
                    flag=1;
                    DecodeOut <= 4'b1100;//C (12)
                end
                
                if(Row==4'b1110) begin
                    flag=1;
                    DecodeOut <= 4'b1101;//D (13)
                end
                if(Row == 4'b1111 && flag==0) begin
                    ButtonPressed =0;

                end

                if( flag==1) begin
                    ButtonPressed=1;
                    flag=0;
                end
                sclk<=20'b0; 
            end


            else begin
                sclk<=sclk+1'b1;
            end         
    end
endmodule