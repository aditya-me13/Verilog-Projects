`timescale 1ns/1ps

module Lab_Assignment_2c(A, B, carry_borrow_in, mode, Gray_value);

input [7:0]A;
input [7:0]B;
input mode;
input carry_borrow_in;
output [8:0]Gray_value;
wire carry_borrow_out;
wire [7:0]C;

Lab_Assignment_2a add_sub (.A(A), .B(B), .carry_borrow_in(carry_borrow_in),.carry_borrow_out(carry_borrow_out), .C(C), .mode(mode));
Lab_Assignment_2b gray_convert(.inp({carry_borrow_out,C}), .out(Gray_value));

endmodule