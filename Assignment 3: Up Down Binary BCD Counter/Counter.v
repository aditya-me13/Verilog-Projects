timescale 1ns / 1ps
/*
en = 1 => Counter Enabl;ed, Shift Register Disabled
cnt_type = 0 => Binary Counter
         = 1 => BCD Counter  
cnt_mode = 0 => Up Counter
         = 1 => Dowm Counter
*/
module Counter(en, cnt_type, cnt_mode, mstr_reset, out, clk);
input en, cnt_type, cnt_mode, mstr_reset, clk;
output [3:0]out;
wire [3:0]Q;
   
    // For Clock and Enable Signal
    and (clk_en, clk, en);
   
    // For Reset0
    // Reset0 = (mstr_reset) | (cnt_type & ((~cnt_mode & out[3] & ~out[2] & out[1] & ~out[0]) | (cnt_mode & out[3] & out[2] & out[1] & out[0])))
    and (a0, cnt_type, ~cnt_mode, out[3], ~out[2], out[1], ~out[0]);
    and (b0, cnt_type, cnt_mode, out[3], out[2], out[1], out[0]);
    or (reset0, a0, b0, mstr_reset);
   
    // For Reset1
    // Reset1 = (mstr_reset & ~cnt_type) | (mstr_reset & cnt_type & ~cnt_mode) | (cnt_type & ~cnt_mode & out[3] & ~out[2] & out[1] & ~out[0])
    and (a1, mstr_reset, ~cnt_type);
    and (b1, mstr_reset, cnt_type, ~cnt_mode);
    and (c1, cnt_type, ~cnt_mode, out[3], ~out[2], out[1], ~out[0]);
    or (reset1, a1, b1, c1);
     
   // For Preset0
    // Preset0 = (mstr_reset & cnt_type & cnt_mode) | (cnt_type & cnt_mode & out[3] & out[2] & out[1] & out[0])
    and (a2, mstr_reset, cnt_type, cnt_mode);
    and (b2, cnt_type, cnt_mode, out[3], out[2], out[1], out[0]);
    or (preset0, a2, b2);
       
    TFF tff0(.T(1), .Q(Q[0]), .reset(reset0), .preset(0), .clk(clk_en));
     
    TFF tff1(.T(Q[0]), .Q(Q[1]), .reset(reset1), .preset(preset0), .clk(clk_en));
   
    and (T2, Q[0], Q[1]);
    TFF tff2(.T(T2), .Q(Q[2]), .reset(reset1), .preset(preset0), .clk(clk_en));  
   
    and (T3, T2, Q[2]);
    TFF tff3(.T(T3), .Q(Q[3]), .reset(reset0), .preset(0), .clk(clk_en));
   
    xor (out[0], Q[0], cnt_mode);
    xor (out[1], Q[1], cnt_mode);
    xor (out[2], Q[2], cnt_mode);
    xor (out[3], Q[3], cnt_mode);
   
endmodule