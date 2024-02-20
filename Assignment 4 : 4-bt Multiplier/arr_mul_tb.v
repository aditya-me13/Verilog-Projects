`timescale 1ns / 1ps

module arr_mul_tb();
parameter n = 8;
reg [n-1:0]A;
reg [n-1:0]B;
wire [2*n-1:0]OUT;

arr_mul uut(A, B, OUT);

initial
begin
    A = 255; B = 255;
    #10;
    A = 0; B = 255;
    #10;
    A = 100; B = 51;
    #10;
    A = 157; B = 215;
    #10;
    A = 55; B = 68;
    #10;
    $finish();
end
endmodule
