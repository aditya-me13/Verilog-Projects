`timescale 1ns / 1ps
/*

Sel: (Encoding)
2 <- 000
3 <- 001
4 <- 010
5 <- 011
6 <- 100
7 <- 101
8 <- 110
9 <- 111

Number:
Convert decimal representation of any number from 0 to 31 (both inclusive) to 5-bit binary (a5,a4,a3,a2,a1,a0)
a5 is the MSB

ismultiple = 1, if Number (from 0 to 31 both inclusive) is multiple of the number represented by input Sel
ismultiple = 0, elsewhere

*/
module Lab_Assignment_1_Without_Decoder(sel,number,ismultiple);
input [2:0]sel;
input [4:0]number;
output reg ismultiple;
    always @ (*)
    begin
        if (sel == 3'b000 & number[0]==0) 
        begin ismultiple = 1; end
        
        else if (sel == 3'b001 & ((number == 5'b00000) | (number == 5'b00011) | (number == 5'b00110) | (number == 5'b01001) | (number == 5'b01100) | (number == 5'b01111) | (number == 5'b10010)
         | (number == 5'b10101) | (number == 5'b11000) | (number == 5'b11011) | (number == 5'b11110)))
        begin ismultiple = 1; end
        
        else if (sel == 3'b010 & (number[1:0] == 2'b00)) 
        begin ismultiple = 1; end
        
        else if (sel == 3'b011 & ((number == 5'b00000) | (number == 5'b00101) | (number == 5'b01010) | (number == 5'b01111) | (number == 5'b10100) | (number == 5'b11001) | (number == 5'b11110))) 
        begin ismultiple = 1; end
        
        else if (sel == 3'b100 & ((number == 5'b00000) | (number == 5'b00110) | (number == 5'b01100) | (number == 5'b10010) | (number == 5'b11000) | (number == 5'b11110)))
        begin ismultiple = 1; end
        
        else if (sel == 3'b101 & ((number == 5'b00000) | (number == 5'b00111) | (number == 5'b01110) | (number == 5'b10101) | (number == 5'b11100)))
        begin ismultiple = 1; end
        
        else if (sel == 3'b110 & (number[2:0] == 3'b000))
        begin ismultiple = 1; end
        
        else if (sel == 3'b111 & ((number == 5'b00000) | (number == 5'b01001) | (number == 5'b10010) | (number == 5'b11011)))
        begin ismultiple = 1; end
                
        else 
        begin ismultiple = 0; end
    end
endmodule
