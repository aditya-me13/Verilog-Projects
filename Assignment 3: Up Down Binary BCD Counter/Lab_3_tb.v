`timescale 1ns/1ps

module Lab_3_tb ();
reg en_ctr, cnt_type, cnt_mode, mstr_reset;
reg clk;
reg [1:0] sel_sr;
wire [3:0]out_sr;
wire [3:0]out_ctr;

/*
Select
00 = Right Shift
01 = Left Shift
10 = No Shift
11 = Load
*/

Lab_4 dut (en_ctr, cnt_type, cnt_mode, mstr_reset, clk, sel_sr, out_sr, out_ctr);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
//    $monitor($time, " en_ctr = %b, cnt_type = %b, cnt_mode = %b, mstr_reset = %b, sel_str = %b, out = %b", en_ctr,cnt_type,cnt_mode,mstr_reset,sel_sr,out);
    en_ctr = 1; cnt_type = 1; cnt_mode = 1; mstr_reset = 1;
    #10;
    mstr_reset = 0;
    #205;

    cnt_type = 0; cnt_mode = 1; mstr_reset = 1;
    #10;
    mstr_reset = 0;
    #100;
   
    cnt_type = 0; cnt_mode = 0; mstr_reset = 1;
    #10;
    mstr_reset = 0;
    #100;
   
    cnt_type = 1; cnt_mode = 0; mstr_reset = 1;
    #10;
    mstr_reset = 0;
    #80;

    en_ctr =0;
   
    sel_sr = 2'b11;
    #10; #10; #10;

    sel_sr = 2'b00;
    #10; #10; #10;

    sel_sr = 2'b01;
    #10; #10; #10;

    sel_sr = 2'b10;
    #10; #10; #10;

    $finish();
end
endmodule