`timescale 1ns / 1ps
/*
5:32 Decoder with input as [4:0] number
*/
module Lab_Assignment_1_With_Decoder(sel, number, ismultiple);
input [2:0]sel;
input [4:0]number;
reg [31:0]out;
reg a,b,c,d,e,f,g,h;
output reg ismultiple;
always @ (*)
begin
    out[31] = (number[4] & number[3] & number[2] & number[1] & number[0]);
    out[30] = (number[4] & number[3] & number[2] & number[1] & ~number[0]);
    out[29] = (number[4] & number[3] & number[2] & ~number[1] & number[0]);
    out[28] = (number[4] & number[3] & number[2] & ~number[1] & ~number[0]);
    out[27] = (number[4] & number[3] & ~number[2] & number[1] & number[0]);
    out[26] = (number[4] & number[3] & ~number[2] & number[1] & ~number[0]);
    out[25] = (number[4] & number[3] & ~number[2] & ~number[1] & number[0]);
    out[24] = (number[4] & number[3] & ~number[2] & ~number[1] & ~number[0]);
    out[23] = (number[4] & ~number[3] & number[2] & number[1] & number[0]);
    out[22] = (number[4] & ~number[3] & number[2] & number[1] & ~number[0]);
    out[21] = (number[4] & ~number[3] & number[2] & ~number[1] & number[0]);
    out[20] = (number[4] & ~number[3] & number[2] & ~number[1] & ~number[0]);
    out[19] = (number[4] & ~number[3] & ~number[2] & number[1] & number[0]);
    out[18] = (number[4] & ~number[3] & ~number[2] & number[1] & ~number[0]);
    out[17] = (number[4] & ~number[3] & ~number[2] & ~number[1] & number[0]);
    out[16] = (number[4] & ~number[3] & ~number[2] & ~number[1] & ~number[0]);
    out[15] = (~number[4] & number[3] & number[2] & number[1] & number[0]);
    out[14] = (~number[4] & number[3] & number[2] & number[1] & ~number[0]);
    out[13] = (~number[4] & number[3] & number[2] & ~number[1] & number[0]);
    out[12] = (~number[4] & number[3] & number[2] & ~number[1] & ~number[0]);
    out[11] = (~number[4] & number[3] & ~number[2] & number[1] & number[0]);
    out[10] = (~number[4] & number[3] & ~number[2] & number[1] & ~number[0]);
    out[9] = (~number[4] & number[3] & ~number[2] & ~number[1] & number[0]);
    out[8] = (~number[4] & number[3] & ~number[2] & ~number[1] & ~number[0]);
    out[7] = (~number[4] & ~number[3] & number[2] & number[1] & number[0]);
    out[6] = (~number[4] & ~number[3] & number[2] & number[1] & ~number[0]);
    out[5] = (~number[4] & ~number[3] & number[2] & ~number[1] & number[0]);
    out[4] = (~number[4] & ~number[3] & number[2] & ~number[1] & ~number[0]);
    out[3] = (~number[4] & ~number[3] & ~number[2] & number[1] & number[0]);
    out[2] = (~number[4] & ~number[3] & ~number[2] & number[1] & ~number[0]);
    out[1] = (~number[4] & ~number[3] & ~number[2] & ~number[1] & number[0]);
    out[0] = (~number[4] & ~number[3] & ~number[2] & ~number[1] & ~number[0]);
    
    ismultiple = 0;
    a =  (sel == 3'b000) & (out[0] | out[2] | out[4] | out[6] | out[8] | out[10] | out[12] | out[14] | out[16] | out[18] | out[20] | out[22] | out[24] | out[26] | out[28] | out[30]);
    b = (sel == 3'b001) & (out[0] | out[3] | out[6] | out[9] | out[12] | out[15] | out[18] | out[21] | out[24] | out[27] | out[30]);
    c = (sel == 3'b010) & ( out[0] | out[4] | out[8] | out[12] | out[16] | out[20] | out[24] | out[28]);
    d =  (sel == 3'b011) & ( out[0] | out[5] | out[10] | out[15] | out[20] | out[25] | out[30]);
    e = (sel == 3'b100) & ( out[0] | out[6] | out[12] | out[18] | out[24] | out[30]);
    f = (sel == 3'b101) & ( out[0] | out[7] | out[14] | out[21] | out[28]);
    g = (sel == 3'b110) & ( out[0] | out[8] | out[16] | out[24]);
    h = (sel == 3'b111) & ( out[0] | out[9] | out[18] | out[27]);
    ismultiple = (a | b | c | d | e | f | g | h);
end
endmodule