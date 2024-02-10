`timescale 1ns / 1ps

module TFF(T,Q,reset,preset,clk);
input T,reset,preset,clk;
output reg Q;

always @ (posedge clk, posedge reset, posedge preset)
begin
    if (reset)
        Q <= 0;
    else if (preset)
        Q <= 1;
    else if (T)
        Q <= ~Q;
    else
        Q <= Q;
    end
endmodule
