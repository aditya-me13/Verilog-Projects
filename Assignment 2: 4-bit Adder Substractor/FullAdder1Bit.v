`timescale 1ns / 1ps

module FullAdder1Bit(A,B,Cin,Cout,Sum);
input A,B,Cin;
output Cout,Sum;

    and and1(f,A,B);
    and and2(g,B,Cin);
    and and3(h,Cin,A);
    or or1(Cout,f,g,h);
    
    and and4(i,A,~B,~Cin);
    and and5(j,~A,~B,Cin);
    and and6(k,~A,B,~Cin);
    and and7(m,A,B,Cin);
    
    or or2(Sum,i,j,k,m);
endmodule
