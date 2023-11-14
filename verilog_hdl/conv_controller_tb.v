
module conv_controller_tb ();

    reg clk, rst, en;
    wire rw;
    wire [1:0] counter0, counter1;
    wire [2:0][31:0] addr;
    wire [31:0] addr_out;
    
    conv_controller dut (clk, rst, en, rw, addr, addr_out, counter0, counter1);
    
    initial begin
    
        clk = 0;
        en = 1;
        rst = 1;
        #20 rst = 0;
        #10000 $stop;
    end
    
    always #10 clk = ~clk;

endmodule