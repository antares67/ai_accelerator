// 2b karatsuba multiplier

module karatsuba2( inx, iny, out );
    
    input[1:0] inx, iny;
    wire AC, AD, BC, carry;
    output[3:0] out;
    
    // A = inx[1], B = inx[0], C = iny[1], D = iny[0]

    assign out[0] = inx[0]&iny[0];
    assign BC     = inx[0]&iny[1];
    assign AD     = inx[1]&iny[0];
    assign AC     = inx[1]&iny[1];
    
    half_adder add1(AD, BC, carry, out[1]);
    
    half_adder add2(AC, carry, out[3], out[2]);
    
endmodule

