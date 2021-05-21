// module cell (input a, b, bin, fbout, output out, bout);
//     wire d;
//     assign bout = a ^ b ^ bin;//(~a & ~b & bin) | (~a & b & ~bin) | (~a & b & bin) | (a & b & bin);
//     assign d = ~a & (b^bin) | b & bin;//(~a & ~b & bin) | (~a & b & ~bin) | (a & ~b & ~bin) | (a & b & bin);
// always @* begin
//    case (fbout)
//        1'b0: out = a;
//        1'b1: out = d;
//    endcase 
// end
// endmodule

module array (input [7:0] x, input [3:0] y, input bin1, input bin2, input bin3, input bin4, output reg[3:0]q, output reg[3:0]r);

    // 1st array
    wire out1, out2, out3, out4, int1, int2, int3, int4, mux1, mux2, mux3, mux4;
    assign int1 = x[3] ^ y[0] ^ bin1;
    assign int2 = x[4] ^ y[1] ^ int1;
    assign int3 = x[5] ^ y[2] ^ int2;
    assign int4 = x[6] ^ y[3] ^ int3;
    
    assign out1 = ~x[3] & (y[0]^bin1) | y[0] & bin1;
    assign out2 = ~x[4] & (y[1]^int1) | y[1] & int1;
    assign out3 = ~x[5] & (y[2]^int2) | y[2] & int2;
    assign out4 = ~x[6] & (y[3]^int3) | y[3] & int3;
    
    // we need to use reg inside always
    reg out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, out_9, out_10, out_11, out_12, out_13, out_14, out_15, out_16;

    always @* begin
        q[3] <= x[7] | ~int4;
        case (q[3])
            1'b1: begin
                out_1 = out1;
                out_2 = out2;
                out_3 = out3;
                out_4 = out4;
            end
            1'b0: begin
                out_1 = x[3];
                out_2 = x[4];
                out_3 = x[5];
                out_4 = x[6];
            end
        endcase
    end // end always
    assign mux1 = out_1;
    assign mux2 = out_2;
    assign mux3 = out_3;
    assign mux4 = out_4;

    // 2nd array
    wire out5, out6, out7, out8, int5, int6, int7, int8, mux5, mux6, mux7, mux8;
    assign int5 = x[2] ^ y[0] ^ bin2; 
    assign int6 = mux1 ^ y[1] ^ int5;
    assign int7 = mux2 ^ y[2] ^ int6;
    assign int8 = mux3 ^ y[3] ^ int7;
    
    assign out5 = ~x[2] & (y[0]^bin2) | y[0] & bin2; 
    assign out6 = ~mux1 & (y[1]^int5) | y[1] & int5;
    assign out7 = ~mux2 & (y[2]^int6) | y[2] & int6;
    assign out8 = ~mux3 & (y[3]^int7) | y[3] & int7;
    always @* begin
        q[2] <= mux4 | ~int8;
        case (q[2])
            1'b1: begin
                out_5 = out5;
                out_6 = out6;
                out_7 = out7;
                out_8 = out8;
            end
            1'b0: begin
                out_5 = x[2];
                out_6 = mux1;
                out_7 = mux2;
                out_8 = mux3;
            end
        endcase
    end // end always
    assign mux5 = out_5;
    assign mux6 = out_6;
    assign mux7 = out_7;
    assign mux8 = out_8;

    // 3rd array
    wire out9, out10, out11, out12, int9, int10, int11, int12, mux9, mux10, mux11, mux12;
    assign int9 = x[1] ^ y[0] ^ bin3; 
    assign int10 = mux5 ^ y[1] ^ int9;
    assign int11 = mux6 ^ y[2] ^ int10;
    assign int12 = mux7 ^ y[3] ^ int11;
    
    assign out9 = ~x[1] & (y[0]^bin3) | y[0] & bin3; 
    assign out10 = ~mux5 & (y[1]^int9) | y[1] & int9;
    assign out11 = ~mux6 & (y[2]^int10) | y[2] & int10;
    assign out12 = ~mux7 & (y[3]^int11) | y[3] & int11;
    always @* begin
        q[1] <= mux8 | ~int12;
        case (q[1])
            1'b1: begin
                out_9 = out9;
                out_10 = out10;
                out_11 = out11;
                out_12 = out12;
            end
            1'b0: begin
                out_9 = x[1];
                out_10 = mux5;
                out_11 = mux6;
                out_12 = mux7;
            end
        endcase
    end // end always
    assign mux9 = out_9;
    assign mux10 = out_10;
    assign mux11 = out_11;
    assign mux12 = out_12;

    // 4th array
    wire out13, out14, out15, out16, int13, int14, int15, int16;
    assign int13 = x[0] ^ y[0] ^ bin4; 
    assign int14 = mux9 ^ y[1] ^ int13;
    assign int15 = mux10 ^ y[2] ^ int14;
    assign int16 = mux11 ^ y[3] ^ int15;
    
    assign out13 = ~x[0] & (y[0]^bin4) | y[0] & bin4; 
    assign out14 = ~mux9 & (y[1]^int13) | y[1] & int13;
    assign out15 = ~mux10 & (y[2]^int14) | y[2] & int14;
    assign out16 = ~mux11 & (y[3]^int15) | y[3] & int15;
    always @* begin
        q[0] = mux12 | ~int16;
        case (q[0])
            1'b1: begin
                r[0] = out13;
                r[1] = out14;
                r[2] = out15;
                r[3] = out16;
            end
            1'b0: begin
                r[0] = x[0];
                r[1] = mux9;
                r[2] = mux10;
                r[3] = mux11;
            end
        endcase
    end // end always 
endmodule
