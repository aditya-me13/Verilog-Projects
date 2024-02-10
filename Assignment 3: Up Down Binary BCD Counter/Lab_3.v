`timescale 1ns/1ps

module Lab_3(en_ctr, cnt_type, cnt_mode, mstr_reset, clk, sel_sr, out_sr, out_ctr);

input en_ctr, cnt_type, cnt_mode, mstr_reset, clk;
input [1:0]sel_sr;
output [3:0]out_sr;
output [3:0]out_ctr;

Counter uut1(.en(en_ctr), .cnt_type(cnt_type), .cnt_mode(cnt_mode), .mstr_reset(mstr_reset), .out(out_ctr), .clk(clk));
Shift_register uut2(.in(out_ctr), .en(~en_ctr), .clk(clk), .sel(sel_sr), .Q(out_sr));

endmodule