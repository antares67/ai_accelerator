
//naiive 4b to 8b multiplier

module multiply4to8 (A, B, out);

    input[3:0] A, B;
    output[7:0] out;
    
    assign out = A*B;

endmodule