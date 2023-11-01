// reg_32.v

// 32 bit synchronous register

// Active high enable, active low reset

module reg_32 (in, clk, en, rst, out);

    input [31:0] in;
    input clk, rst, en;
    output reg [31:0] out;
    
    always @(posedge clk) begin
    
        if (!en && !rst)
            out <= 32'b0;
    
        if (en && !rst)
            out <= 32'b0;
            
        if (en && rst)
            out <= in;
    end

endmodule