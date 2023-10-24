
module KS_adder_tb();

    reg [7:0] A, B;
    reg Cin;
    wire Cout;
    wire [7:0] S;
    reg [8:0] Sum_exp, Sum_calc;
   
    KS_adder dut(A, B, Cin, Cout, S);
    
    initial begin
    
        A = 0;
        B = 0;
        Cin = 0;
        Sum_calc = 0;
        Sum_exp = 0;
    
    end
    
    always begin
    
        #5;
        A = $random;
        B = $random;
        Cin = $random;
        #5
        Sum_exp = A + B + Cin;
        Sum_calc = S + Cout*256;
    
    end
    
    initial begin
    
        #1000;
        $stop;
    
    end

endmodule
