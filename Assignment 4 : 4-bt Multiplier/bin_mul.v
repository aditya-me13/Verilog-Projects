`timescale 1ns / 1ps

module bin_mul(A,B,OUT);

parameter n=4;
input [n-1:0] A;
input [n-1:0] B;
output reg [2*n-1:0] OUT;
integer i;

always @(*)
begin
    OUT = 0;
    for(i=0;i<n;i=i+1)
    begin
        if(B[i]==1) begin
            OUT = OUT + (A<<i);
        end
    end
end
endmodule