// half_adder.v

module half_adder (in0, in1, C, S);

    input in0, in1;
    output S, C;

    assign S = in0 ^ in1;
    assign C = in0 & in1;


endmodule