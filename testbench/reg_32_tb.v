
module reg_32_tb ();
    
    reg [31:0] in;
    reg clk, rst, en;
    wire [31:0] out;
    
    reg_32 dut (in, clk, en, rst, out);
    
    initial begin
    
        in = 0;
        clk = 0;
        en = 1;
        rst = 1;
    
    end
    
    always begin
        #10;
        clk = ~clk;
    
    end
    
    always begin //input randomly changes
        
        in = $random;
        #50;
    
    end
    
    initial begin //enable and reset
        
        #1000;
        en = 0;
        #500;
        rst = 0;
        #100;
        rst = 1;
        #100;
        en = 1;
        #100;
        rst = 0;
        #100;
        rst = 1;
        #100;
        $stop;
        
    end

endmodule
