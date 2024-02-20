`timescale 1ns / 1ps

module arr_mul(A,B,OUT);

parameter n = 4;
input [n-1:0]A;
input [n-1:0]B;
output reg [2*n-1:0]OUT;
reg [n-2:0]P;
reg [n:0]PP1;
reg [n-1:0]PP2;
integer k;

    always @ (*)
    begin
        
        if (B[0] == 1 && B[1] == 1)
        begin
            PP1 = {1'b0,A};
            PP2 = A;
        end
        else if (B[0] == 1 && B[1] == 0)
        begin
            PP1 = {1'b0,A};
            PP2 = 0;
        end
        else if (B[0] == 0 && B[1] == 1)
        begin
            PP1 = 0;
            PP2 = A;
        end
        else
        begin
            PP1 = 0;
            PP2 = 0;
        end
        
        // First Partial Product
        P[0] = PP1[0];
        PP1[n:0] = PP1[n:1] + PP2[n-1:0];
        P[1] = PP1[0];
        
        for(k = 2; k < n; k = k + 1)
        begin
            if (B[k] == 1)
            begin
                PP2 = A;
                PP1[n:0] = PP1[n:1] + PP2[n-1:0];
                P[k] = PP1[0];    
            end
            else
            begin
                PP1 = PP1 >> 1;
                P[k] = PP1[0];
            end    
        end
        OUT = {PP1,P};
    end
endmodule
