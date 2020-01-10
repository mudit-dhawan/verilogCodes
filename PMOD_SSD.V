`timescale 1ns / 1ps
module PMOD_SSD(
    input clk,
    input [3:0] ones,
    input [3:0] tens,
    output [6:0] ssd_cathode,
    output [1:0] ssd_anode
    );
    reg [6:0] cathode_temp = 7'b1111111;
    // reg [3:0] anode_temp = 4'b1110;
    reg anode_changer = 0; 
always @(posedge clk)
begin 
    anode_changer = anode_changer + 1; 
end 

always @(*) 
begin 
    case(anode_changer) 
    
    1'b0: 
    begin 
        case(ones)
            4'd0 : cathode_temp = 7'b0000001; //to display 0 
            4'd1 : cathode_temp = 7'b1001111; //to display 1 
            4'd2 : cathode_temp = 7'b0010010; //to display 2 
            4'd3 : cathode_temp = 7'b0000110; //to display 3 
            4'd4 : cathode_temp = 7'b1001100; //to display 4 
            4'd5 : cathode_temp = 7'b0100100; //to display 5 
            4'd6 : cathode_temp = 7'b0100000; //to display 6 
            4'd7 : cathode_temp = 7'b0001111; //to display 7 
            4'd8 : cathode_temp = 7'b0000000; //to display 8 
            4'd9 : cathode_temp = 7'b0000100; //to display 9 
            4'hA : cathode_temp = 7'b0001000; 
            4'hB : cathode_temp = 7'b1100000; 
            4'hC : cathode_temp = 7'b0110001; 
            4'hD : cathode_temp = 7'b1000010; 
            4'hE : cathode_temp = 7'b0110000; 
            4'hF : cathode_temp = 7'b0111000; 
            default : cathode_temp = 7'b1111111; 
        endcase
    end 
    1'b1: 
    begin 
        case(tens)
        4'd0 : cathode_temp = 7'b0000001; //to display 0 
        4'd1 : cathode_temp = 7'b1001111; //to display 1 
        4'd2 : cathode_temp = 7'b0010010; //to display 2 
        4'd3 : cathode_temp = 7'b0000110; //to display 3 
        4'd4 : cathode_temp = 7'b1001100; //to display 4 
        4'd5 : cathode_temp = 7'b0100100; //to display 5 
        4'd6 : cathode_temp = 7'b0100000; //to display 6 
        4'd7 : cathode_temp = 7'b0001111; //to display 7 
        4'd8 : cathode_temp = 7'b0000000; //to display 8 
        4'd9 : cathode_temp = 7'b0000100; //to display 9 
        4'hA : cathode_temp = 7'b0001000; 
        4'hB : cathode_temp = 7'b1100000; 
        4'hC : cathode_temp = 7'b0110001; 
        4'hD : cathode_temp = 7'b1000010; 
        4'hE : cathode_temp = 7'b0110000; 
        4'hF : cathode_temp = 7'b0111000; 
        default : cathode_temp = 7'b1111111; 
        endcase 
    end

    endcase
 end 
 assign   ssd_anode= anode_changer;
 assign   ssd_cathode = ~cathode_temp;
// assign ssd_cathode=~(7'b0000100);    
        

 

endmodule