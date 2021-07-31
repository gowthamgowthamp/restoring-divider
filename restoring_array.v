// module restoring_array (
//     input a, b, bin, fbout,  output out, bout
// );
//     wire d;
//     assign d = a ^ b ^ bin;
//     assign bout = (~a) & (b^bin) | (b & bin);
//     assign out = (fbout) ? d : a;
// endmodule

module restoring_array (
    input a, b, bin,  output out, bout
);
    assign out = a ^ b ^ bin;
    assign bout = (~a) & (b^bin) | (b & bin);
endmodule

module array (
    input [7:0]x,
    input [3:0]y,
    input bin1, 
    input bin2,
    input bin3,
    input bin4,
    output [3:0]q, 
    output [3:0]r
);
    wire int1, int2, int3, int4, int5, int6, int7, int8, int9, int10, int11, int12, int13, int14, int15, int16;
    wire o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16;
    wire m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12;
    
    restoring_array fs1 (.a(x[3]), .b(y[0]), .bin(bin1), .out(o1), .bout(int1));
    restoring_array fs2 (.a(x[4]), .b(y[1]), .bin(int1), .out(o2), .bout(int2));
    restoring_array fs3 (.a(x[5]), .b(y[2]), .bin(int2), .out(o3), .bout(int3));
    restoring_array fs4 (.a(x[6]), .b(y[3]), .bin(int3), .out(o4), .bout(int4));
    assign q[3] = x[7] | ~int4;
    assign m1 = (q[3]) ? o1 : x[3];
    assign m2 = (q[3]) ? o2 : x[4];
    assign m3 = (q[3]) ? o3 : x[5];
    assign m4 = (q[3]) ? o4 : x[6];

    restoring_array fs5 (.a(x[2]), .b(y[0]), .bin(bin2), .out(o5), .bout(int5));
    restoring_array fs6 (.a(m1), .b(y[1]), .bin(int5), .out(o6), .bout(int6));
    restoring_array fs7 (.a(m2), .b(y[2]), .bin(int6), .out(o7), .bout(int7));
    restoring_array fs8 (.a(m3), .b(y[3]), .bin(int7), .out(o8), .bout(int8));
    assign q[2] = m4 | ~int8;
    assign m5 = (q[2]) ? o5 : x[2];
    assign m6 = (q[2]) ? o6 : m1;
    assign m7 = (q[2]) ? o7 : m2;
    assign m8 = (q[2]) ? o8 : m3;

    restoring_array fs9 (.a(x[1]), .b(y[0]), .bin(bin3), .out(o9), .bout(int9));
    restoring_array fs10 (.a(m5), .b(y[1]), .bin(int9), .out(o10), .bout(int10));
    restoring_array fs11 (.a(m6), .b(y[2]), .bin(int10), .out(o11), .bout(int11));
    restoring_array fs12 (.a(m7), .b(y[3]), .bin(int11), .out(o12), .bout(int12));
    assign q[1] = m8 | ~int12;
    assign m9 = (q[1]) ? o9 : x[1];
    assign m10 = (q[1]) ? o10: m5;
    assign m11 = (q[1]) ? o11 : m6;
    assign m12 = (q[1]) ? o12 : m7;

    restoring_array fs13 (.a(x[0]), .b(y[0]), .bin(bin4), .out(o13), .bout(int13));
    restoring_array fs14 (.a(m9), .b(y[1]), .bin(int13), .out(o14), .bout(int14));
    restoring_array fs15 (.a(m10), .b(y[2]), .bin(int14), .out(o15), .bout(int15));
    restoring_array fs16 (.a(m11), .b(y[3]), .bin(int15), .out(o16), .bout(int16));
    assign q[0] = m12 | ~int16;
    assign r[0] = (q[0]) ? o13 : x[0];
    assign r[1] = (q[0]) ? o14 : m9;
    assign r[2] = (q[0]) ? o15 : m10;
    assign r[3] = (q[0]) ? o16 : m11;

endmodule



