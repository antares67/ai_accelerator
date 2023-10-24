// multiply4to8_tb.v

module multiply4to8_tb ();

    reg[3:0] A, B;
    wire[7:0] out;
    
    multiply4to8 dut(A, B, out);
    
    initial begin
    
        A = 15;
        B = 15;
        #10;
        $stop;
    
    end
    
endmodule