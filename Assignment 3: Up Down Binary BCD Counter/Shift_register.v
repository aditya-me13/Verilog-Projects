`timescale 1ns/1ps

module Shift_register(in, en, clk, sel, Q);
input [3:0]in;
input en, clk;
input [1:0]sel;
output reg [3:0]Q;

/*
Select
00 = Right Shift
01 = Left Shift
10 = No Shift
11 = Load
*/

always @ (posedge clk, posedge en) begin
    // Enabeled
    if (en) begin
    // Right Shift
        if(!sel[0] & !sel[1]) begin
            Q[0] <= Q[1];
            Q[1] <= Q[2];
            Q[2] <= Q[3];
            Q[3] <= 0;
        end
   
        // Left Shift
        else if(sel[0] & !sel[1]) begin
            Q[0] <= 0;
            Q[1] <= Q[0];
            Q[2] <= Q[1];
            Q[3] <= Q[2];
        end
   
        // Load
        else if(sel[0] & sel[1]) begin
            Q[0] <= in[0];
            Q[1] <= in[1];
            Q[2] <= in[2];
            Q[3] <= in[3];
        end
       
        // No Shift
        else begin
            Q[0] <= Q[0];
            Q[1] <= Q[1];
            Q[2] <= Q[2];
            Q[3] <= Q[3];
        end
    end
end
endmodule
