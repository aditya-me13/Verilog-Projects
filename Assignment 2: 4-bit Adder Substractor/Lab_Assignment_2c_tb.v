`timescale 1ns / 1ps

/*
A = First Number
B = Second Number
Mode = 1 (for Subtraction)
        0 (for Addition)
*/
module Lab_Assignment_2c_tb();
reg [7:0]A;
reg [7:0]B;
reg carry_borrow_in;
reg mode;
wire [8:0]Gray_value;

Lab_Assignment_2c uut(A,B,carry_borrow_in,mode,Gray_value);

    
    initial
    begin
    A = 8'd32; B = 8'd10; carry_borrow_in = 1; mode = 0;
    #10;
    A = 8'd56; B = 8'd60; carry_borrow_in = 1; mode = 1;
    #10;    
    A = 8'd255; B = 8'd255; carry_borrow_in = 0; mode = 0;
    #10;
    A = 8'd2; B = 8'd255; carry_borrow_in = 0; mode = 1;
    #10;
    $finish();
    end
endmodule
