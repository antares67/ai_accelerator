module picklerick(clk, NRST, AIN, BIN, sel, convolutionwoo, DO_VALID, DI_VALID, OVFL, NaN, INF);
input clk, NRST, DI_VALID;
input[2:0] sel;
input [31:0] AIN, BIN;
output [31:0] convolutionwoo;
output DO_VALID, OVFL, NaN, INF;
wire [31:0] din;
wire [31:0] morty0, morty1, morty2, morty3, morty4, morty5, morty6, morty7;
wire [31:0] C01, C23, C45, C67, C0123, C4567, C01234567; // numbers

CoreFPU_C0_CoreFPU_C0_0_CoreFPU 
    # (.conv_type(5))
thugshaker (
    // Inputs
    .CLK(clk),
    .NRST(NRST),
    .DI_VALID(DI_VALID),
    .AIN(AIN),
    .BIN(BIN),

    // Outputs
    .POUT(din),
    .DO_VALID(DO_VALID),
    .OVFL(OVFL),
    .NaN(NaN),
    .INF(INF));
mux rizz(.din(din), .clk(clk), .sel(sel),        .dout0(morty0),   .dout1(morty1),   .dout2(morty2),   .dout3(morty3)
        , .dout4(morty4),       .dout5(morty5),   .dout6(morty6),   .dout7(morty7));

adder add01         (.A(morty0), .B(morty1), .C(C01));  //cascading adders
adder add23         (.A(morty2), .B(morty3), .C(C23));
adder add45         (.A(morty4), .B(morty5), .C(C45));
adder add67         (.A(morty6), .B(morty7), .C(C67));
adder add0123       (.A(C01), .B(C23), .C(C0123));
adder add4567       (.A(C45), .B(C67), .C(C4567));
adder add01234567   (.A(C0123), .B(C4567), .C(convolutionwoo));  //i am going to harm myself

endmodule