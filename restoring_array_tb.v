`include "restoring_array.v"
`timescale 1ns/1ns
module restoring_array_tb;
    wire [3:0]q;
    wire [3:0]r;
    reg [7:0]x;
    reg [3:0]y;
    reg bin1;
    reg bin2;
    reg bin3;
    reg bin4;
    array div (.x(x), .y(y), .bin1(bin1), .bin2(bin2), .bin3(bin3), .bin4(bin4), .q(q), .r(r));
    initial begin
        $dumpfile("restoring_array_tb.vcd");
        $dumpvars(0, restoring_array_tb);
        bin1 = 0; bin2 = 0; bin3 = 0; bin4 = 0;
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
    end
endmodule
