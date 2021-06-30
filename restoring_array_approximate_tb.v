`include "restoring_array_approximate.v"
`timescale 1ns/1ns
module restoring_array_approximate_tb;
    wire [3:0]q;
    wire [3:0]r;
    reg [7:0]x;
    reg [3:0]y;
    reg [15:0]a; // 1000110011101111 ==> approximate mode
    wire d, bout, boutfs, difffs;
    //reg app, x, y, a, b, bin, appfs;
    // reg [3:0] xov;
    // reg [3:0] yov;
    // wire overflow;
    //rhsc u1(.x(x), .y(y), .app(app), .d(d), .bout(bout));
    //rsc u2(.a(a), .b(b), .appfs(appfs), .bin(bin), .difffs(difffs), .boutfs(boutfs));
    array u3(.x(x), .y(y), .q(q), .r(r), .a(a));
    //ovf u3(.x(xov), .y(yov), .overflow(overflow));
    initial begin
        $dumpfile("restoring_array_approximate_tb.vcd");
        $dumpvars(0, restoring_array_approximate_tb);
        a = 0;

        x = 8; y = 4;
        #20;
        x = 7; y = 3;
        #20;
        x = 5; y = 5;
        #20;
        x = 16; y = 4;
        #20
        x = 20; y = 5;
        #20;
        x = 15; y = 3;
        #20;
        x = 12; y = 5;
        #20;
        x = 40; y = 13;
        #20;
        x = 17; y = 5;
        #20;

        a = 36079;
        x = 8; y = 4;
        #20;
        x = 7; y = 3;
        #20;
        x = 5; y = 5;
        #20;
        x = 16; y = 4;
        #20
        x = 20; y = 5;
        #20;
        x = 15; y = 3;
        #20;
        x = 12; y = 5;
        #20;
        x = 40; y = 13;
        #20;
        x = 17; y = 5;
        #20;

        // app = 1; appfs = 1;
        // x = 1; y = 0; a = 1; b = 0; bin = 0;// xov = 4; yov = 5;
        // #20;
        // x = 0; y = 1; a = 1; b = 0; bin = 1;// xov = 5; yov = 4;
        // #20;
        // x = 1; y = 1; a = 0; b = 1; bin = 0;// xov = 9; yov = 7;
        // #20;
        // x = 0; y = 0; a = 0; b = 1; bin = 1;// xov = 7; yov = 9;
        // #20;
        // app = 0; appfs = 0;
        // x = 1; y = 0; a = 1; b = 1; bin = 0;// xov = 3; yov = 5;
        // #20;
        // x = 0; y = 1; a = 1; b = 1; bin = 1;// xov = 5; yov = 3;
        // #20;
        // x = 1; y = 1; a = 0; b = 0; bin = 0;// xov = 8; yov = 6;
        // #20;
        // x = 0; y = 0; a = 0; b = 0; bin = 1;// xov = 6; yov = 8;
        // #20;
    end
endmodule