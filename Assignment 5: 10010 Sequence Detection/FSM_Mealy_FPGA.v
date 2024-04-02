// Mealy Implimentation of 10010 overlaping sequence detection using FSM
`timescale 1ns/1ps
module FSM_Mealy(clk, reset, w, z, clk_tick, W, state);
input clk, reset, w;
output reg z;
reg [2:0] y, Y;
reg [28:0] slow_clk;
output reg clk_tick;
output reg W;
output reg [2:0] state;
parameter [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100;
initial begin
clk_tick <= 0;
end
always@(w or y) begin
// Assigning Next State
case(y)
A: if(w) begin Y = B; z = 0; end
else begin Y = A; z = 0; end
B:if(w) begin Y = B; z = 0; end
else begin Y = C; z = 0; end
C:if(w) begin Y = B; z = 0; end
else begin Y = D; z = 0; end
D:if(w) begin Y = E; z = 0; end
else begin Y = A; z = 0; end
E:if(w) begin Y = B; z = 0; end
else begin Y = C; z = 1; end
default: begin Y = 3'bxxx; z = 1'bx; end
endcase
end
always@(negedge reset, posedge clk) begin
// State Transition
if (slow_clk == 400_000_000) begin
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
endmodule