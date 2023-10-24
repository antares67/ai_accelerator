
`timescale 1ns/100ps

module karatsuba2_tb();
    
    reg [1:0] inx, iny;
    wire[3:0] out;
    
    karatsuba2 dut(inx, iny, out);
    
    initial begin
    
        inx = 0;
        iny = 0;
    
    end
    
    always begin
        
        inx = 0;
        #10;
        
        inx = 1;
        #10;
        
        inx = 2;
        #10;
        
        inx = 3;
        #10;
        
        iny = iny + 1;
    end
    
    initial begin
    
        #160;
        $stop;
    
    end

endmodule

