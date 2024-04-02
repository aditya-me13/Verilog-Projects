// Moore Implimentation of 10010 overlaping sequence detection using FSM
`timescale 1ns/1ps
module FSM_Moore(clk, reset, w, z, clk_tick, W, state);
input clk, reset, w;
output z;
reg [2:0] y, Y;
reg [27:0] slow_clk;
output reg clk_tick;
output reg W;
output reg [2:0] state;
parameter [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
initial begin
clk_tick <= 0;
end
always@(w or y) begin
// Assigning Next State
case(y)
A: if(w) Y = B;
else Y = A;
B:if(w) Y = B;
else Y = C;
C:if(w) Y = B;
else Y = D;
D:if(w) Y = E;
else Y = A;
E:if(w) Y = B;
else Y = F;
F:if(w) Y = A;
else Y = D;
default: Y = 3'bxxx;
endcase
end
always@(negedge reset, posedge clk) begin
// State Transition
if (slow_clk == 200_000_000) begin
if(~reset) y <= A;
else y <= Y;
slow_clk <= 0;
clk_tick <= ~clk_tick;
W = w;
state = y;
end
else begin
slow_clk <= slow_clk + 1;
end
end
// Output
assign z = (y == F);
endmodule