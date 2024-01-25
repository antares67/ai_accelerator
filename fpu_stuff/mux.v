module mux(din, clk, sel, dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7);

input[31:0] din;
input[2:0] sel;
input clk;
output reg [31:0] dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7;

 always@(posedge clk)begin 
    case(sel)  
        3'b000: dout0<=din;
        3'b001: dout1<=din;
        3'b010: dout2<=din;
        3'b011: dout3<=din;
        3'b100: dout4<=din;
        3'b101: dout5<=din;
        3'b110: dout6<=din;
        3'b111: dout7<=din;
        default: begin  dout7<=32'b0; dout6<=32'b0; dout5<=32'b0; dout4<=32'b0; 
                        dout3<=32'b0; dout2<=32'b0; dout1<=32'b0; dout0<=32'b0; end
    endcase
end
endmodule