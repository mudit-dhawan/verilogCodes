`timescale 1ns / 1ps
module sevenSegment(
    input clk,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    output [7:0] ssd_cathode,
    output [3:0] ssd_anode
    );
    reg [6:0] cathode_temp = 7'b1111111;
    reg [3:0] anode_temp = 4'b1110;
    reg [1:0] count = 0; 
always @(posedge clk)
begin 
    count = count+ 1; 
end 

always @(*) 
begin 
    case(count) 
    2'b00: 
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
        anode_temp = 4'b1110 ;
    end 
    2'b01: 
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
        anode_temp = 4'b1101 ;
    end
    2'b10: 
    begin 
        case(hundreds)
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
        anode_temp = 4'b1011 ;
    end
    2'b11: 
    begin 
        case(thousands)
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
        anode_temp = 4'b0111 ;
    end
    endcase
 end 
 assign   ssd_anode= anode_temp;
 assign   ssd_cathode = {cathode_temp,1'b1};
    
        

 

endmodule