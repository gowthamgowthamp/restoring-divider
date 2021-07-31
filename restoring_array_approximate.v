// module mux ();
    
// endmodule

module rhsc (
    input app,
    input x,
    input y,
    output d, bout
);
    assign bout = app ? y : (~x&y);
    assign d = app ? (x|y) : (x^y);
endmodule

module rsc (
    input a,
    input b,
    input bin,
    input appfs,
    output difffs, boutfs
);
    assign boutfs = appfs ? ((~(a&b)&bin)|b) : (bin&(~(a^b))|(~a&b));
    assign difffs = appfs ? (a&b^bin) : (a^b^bin);
endmodule

module ovf (
    output overflow,
    input [3:0] x,
    input [3:0] y
);
   wire [3:0] p;
   wire [3:0] g;
   wire ovf;
   assign p[0] = x[0] | y[0];
   assign p[1] = x[1] | y[1];
   assign p[2] = x[2] | y[2];
   assign p[3] = x[3] | y[3];
   assign g[0] = x[0] & y[0];
   assign g[1] = x[1] & y[1];
   assign g[2] = x[2] & y[2];
   assign g[3] = x[3] & y[3];
   assign ovf = (g[3] | (p[3]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]));
   assign overflow = ~ovf;
endmodule

module array (
    input [7:0] x,
    input [3:0] y,
    input [15:0] a,
    output [3:0] q,
    output [3:0] r
);
    wire o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16;
    wire int1, int2, int3, int4, int5, int6, int7, int8, int9, int10, int11, int12, int13, int14, int15, int16;
    wire io1, io2, io3, io4, io5, io6, io7, io8, io9, io10, io11, io12, io13, io14, io15, io16;
    wire iq0, iq1, iq2, iq3;

    rhsc rhsc1 (.x(x[3]), .y(y[0]), .d(io1), .bout(int1), .app(a[0]));
    rsc rsc2 (.a(x[4]), .b(y[1]), .bin(int1), .appfs(a[1]), .difffs(io2), .boutfs(int2));
    rsc rsc3 (.a(x[5]), .b(y[2]), .bin(int2), .appfs(a[2]), .difffs(io3), .boutfs(int3));
    rsc rsc4 (.a(x[6]), .b(y[3]), .bin(int3), .appfs(a[3]), .difffs(io4), .boutfs(int4));
    assign iq3 = x[7] | ~int4;
    assign o1 = iq3 ? io1 : x[3];
    assign o2 = iq3 ? io2 : x[4];
    assign o3 = iq3 ? io3 : x[5];
    assign o4 = iq3 ? io4 : x[6];

    rhsc rhsc5 (.x(x[2]), .y(y[0]), .d(io5), .bout(int5), .app(a[4]));
    rsc rsc6 (.a(o1), .b(y[1]), .bin(int5), .appfs(a[5]), .difffs(io6), .boutfs(int6));
    rsc rsc7 (.a(o2), .b(y[2]), .bin(int6), .appfs(a[6]), .difffs(io7), .boutfs(int7));
    rsc rsc8 (.a(o3), .b(y[3]), .bin(int7), .appfs(a[7]), .difffs(io8), .boutfs(int8));
    assign iq2 = o4 | ~int8;
    assign o5 = iq2 ? io5 : x[3];
    assign o6 = iq2 ? io6 : x[4];
    assign o7 = iq2 ? io7 : x[5];
    assign o8 = iq2 ? io8 : x[6];

    rhsc rhsc9 (.x(x[1]), .y(y[0]), .d(io9), .bout(int9), .app(a[8]));
    rsc rsc10 (.a(o5), .b(y[1]), .bin(int9), .appfs(a[9]), .difffs(io10), .boutfs(int10));
    rsc rsc11 (.a(o6), .b(y[2]), .bin(int10), .appfs(a[10]), .difffs(io11), .boutfs(int11));
    rsc rsc12 (.a(o7), .b(y[3]), .bin(int11), .appfs(a[11]), .difffs(io12), .boutfs(int12));
    assign iq1 = o8 | ~int12;
    assign o9 = iq1 ? io9 : x[3];
    assign o10 = iq1 ? io10 : x[4];
    assign o11 = iq1 ? io11 : x[5];
    assign o12 = iq1 ? io12 : x[6];

    rhsc rhsc13 (.x(x[0]), .y(y[0]), .d(io13), .bout(int13), .app(a[12]));
    rsc rsc14 (.a(o9), .b(y[1]), .bin(int13), .appfs(a[13]), .difffs(io14), .boutfs(int14));
    rsc rsc15 (.a(o10), .b(y[2]), .bin(int14), .appfs(a[14]), .difffs(io15), .boutfs(int15));
    rsc rsc16 (.a(o11), .b(y[3]), .bin(int15), .appfs(a[15]), .difffs(io16), .boutfs(int16));
    assign iq0 = o12 | ~int16;
    assign r[1] = iq0 ? io13 : x[3];
    assign r[1] = iq0 ? io14 : x[4];
    assign r[2] = iq0 ? io15 : x[5];
    assign r[3] = iq0 ? io16 : x[6];

    wire ovf;

    ovf ovf1 (.x(x[7:4]), .y(y), .overflow(ovf));

    assign q[0] = iq0 & ovf;
    assign q[1] = iq1 & ovf;
    assign q[2] = iq2 & ovf;
    assign q[3] = iq3 & ovf;
endmodule

