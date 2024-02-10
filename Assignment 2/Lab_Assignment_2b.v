`timescale 1ns/1ps

module Lab_Assignment_2b(inp, out);
    input [8:0] inp;
    output reg [8:0] out;

  // inp[8] is the MSB
    always @(inp) begin
    out[8] <= inp[8];
    out[7] <= inp[7] ^ inp[8]; 
    out[6] <= inp[6] ^ inp[7];
    out[5] <= inp[5] ^ inp[6];
    out[4] <= inp[4] ^ inp[5];
    out[3] <= inp[3] ^ inp[4];
    out[2] <= inp[2] ^ inp[3];
    out[1] <= inp[1] ^ inp[2];
    out[0] <= inp[0] ^ inp[1];
    end
endmodule
