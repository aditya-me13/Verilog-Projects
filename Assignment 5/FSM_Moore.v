// Moore Implimentation of 10010 overlaping sequence detection using FSM
`timescale 1ns/1ps

module FSM_Moore(clk, reset, w, z);
input clk, reset, w;
output z;
reg [2:0] y, Y;

parameter [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101; 

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
    if(~reset) y <= A;
    else y <= Y;
end

// Output
assign z = (y == F);

endmodule
