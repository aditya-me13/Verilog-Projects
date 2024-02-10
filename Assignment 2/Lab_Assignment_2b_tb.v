`timescale 1ns/1ps

module Lab_Assignment_2b_tb();
reg [8:0]inp;
wire [8:0]out;

Lab_Assignment_2b uut(inp, out);

initial begin
//    $monitor($time, " inp = %d, out = %d", inp, out);
    inp = 9'd32; #10;
    inp = 9'd1; #10;
    inp = 9'd511; #10;
    $finish();

end
endmodule