`timescale 1ns / 1ps

module Lab_Assignment_2a(A,B,carry_borrow_in,carry_borrow_out,C,mode);
input [7:0]A;
input [7:0]B;
input mode;
input carry_borrow_in;
output [7:0]C;
output carry_borrow_out;
wire [6:0]carry;
    
    xor x(Cin, mode, carry_borrow_in);
    xor x0(B0,B[0],mode);
    FullAdder1Bit inst0 (.A(A[0]),.B(B0),.Cin(Cin),.Cout(carry[0]),.Sum(C[0]));
    xor x1(B1,B[1],mode);
    FullAdder1Bit inst1 (.A(A[1]),.B(B1),.Cin(carry[0]),.Cout(carry[1]),.Sum(C[1]));
    xor x2(B2,B[2],mode);
    FullAdder1Bit inst2 (.A(A[2]),.B(B2),.Cin(carry[1]),.Cout(carry[2]),.Sum(C[2]));
    xor x3(B3,B[3],mode);
    FullAdder1Bit inst3 (.A(A[3]),.B(B3),.Cin(carry[2]),.Cout(carry[3]),.Sum(C[3]));
    xor x4(B4,B[4],mode);
    FullAdder1Bit inst4 (.A(A[4]),.B(B4),.Cin(carry[3]),.Cout(carry[4]),.Sum(C[4]));
    xor x5(B5,B[5],mode);
    FullAdder1Bit inst5 (.A(A[5]),.B(B5),.Cin(carry[4]),.Cout(carry[5]),.Sum(C[5]));
    xor x6(B6,B[6],mode);
    FullAdder1Bit inst6 (.A(A[6]),.B(B6),.Cin(carry[5]),.Cout(carry[6]),.Sum(C[6]));
    xor x7(B7,B[7],mode);
    FullAdder1Bit inst7 (.A(A[7]),.B(B7),.Cin(carry[6]),.Cout(Cout),.Sum(C[7]));
    xor x8(carry_borrow_out,Cout,mode);   

endmodule
