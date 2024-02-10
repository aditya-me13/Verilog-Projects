`timescale 1ns / 1ps
/*

sel: (Encoding)
2 <- 000
3 <- 001
4 <- 010
5 <- 011
6 <- 100
7 <- 101
8 <- 110
9 <- 111

number:
Convert decimal representation of any number from 0 to 31 (both inclusive) to 5-bit binary (a5,a4,a3,a2,a1,a0)
a5 is the MSB

ismultiple = 1, if Number (from 0 to 31 both inclusive) is multiple of the number represented by input Sel
ismultiple = 0, elsewhere

*/
module Lab_Assignment_1_Without_Decoder_tb();
reg [2:0]sel;
reg [4:0]number;
wire ismultiple;
//reg [5:0]iter; //Uncomment this when using type I
Lab_Assignment_1_Without_Decoder uut(sel,number,ismultiple);

initial
begin
/*
Two types of test benches:
I) Find all the multiples of a number
II) Find whether a random number is a multiple of another number corresponding to the select.
*/


// I) Uncommment this for 1st type
//for(iter=6'b00000;iter<=6'b011111;iter=iter+6'b000001)
//begin
//sel = 3'b111; number = iter[4:0];
//#10;
//end


// II) Uncomment this for 2nd type
    // Example 1
    sel = 3'b001; // Encoding: 3
    number = 5'b10101; // Decimal equivalent: 21
    #10;
    // Example 2
    sel = 3'b011; // Encoding: 7
    number = 5'b11011; // Decimal equivalent: 27
    #10;
    // Example 3
    sel = 3'b100; // Enciding: 6
    number = 5'b00100; // Decimal equivalent: 4
    #10;
    // Example 4
    sel = 3'b110; // Enciding: 8
    number = 5'b11101; // Decimal equivalent: 29
    #10;
    // Example 5
    sel = 3'b010; // Enciding: 4
    number = 5'b01010; // Decimal equivalent: 10
    #10;
    // Example 6
    sel = 3'b101; // Enciding: 7
    number = 5'b10000; // Decimal equivalent: 16
    #10;
    // Example 7
    sel = 3'b011; // Enciding: 5
    number = 5'b00111; // Decimal equivalent: 7
    #10;
    // Example 8
    sel = 3'b111; // Enciding: 9
    number = 5'b11000; // Decimal equivalent: 24
    #10;
    // Example 9
    sel = 3'b001; // Enciding: 3
    number = 5'b01101; // Decimal equivalent: 13
    #10;
    // Example 10
    sel = 3'b010; // Enciding: 2
    number = 5'b10110; // Decimal equivalent: 22
    #10;
    $finish();
end

endmodule
