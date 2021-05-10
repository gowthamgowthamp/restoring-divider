`timescale 1ns/1ns
`include "restoring_array.v"
module restoring_array_tb;
    wire [3:0]q;
    wire [3:0]r;
    reg [7:0] x;
    reg [3:0] y;
    reg bin1, bin2, bin3, bin4;
    array div1 (.x(x), .y(y), .bin1(bin1), .bin2(bin2), .bin3(bin3), .bin4(bin4), .q(q), .r(r));
    initial begin
        bin1 = 0; bin2 = 0; bin3 = 0; bin4 = 0;
        #10;
        x = 9;
        y = 2;
        #10;
        x = 10;
        y = 2;
        #10;
        x = 12;
        y = 3;
        #10
        x = 20;
        y = 3;
        $dumpfile("restoring_array_tb.vcd");
        $dumpvars(0, restoring_array_tb);
    end
endmodule