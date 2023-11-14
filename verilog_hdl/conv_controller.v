// conv_controller.v

module conv_controller(clk, rst, en, rw, addr, addr_out, counter0, counter1);

    input clk, rst, en;
    output reg [1:0] counter0, counter1;
    output reg [3:0][31:0] addr;
    output rw;
    output [31:0] addr_out;
    
    assign rw = (counter1 == 3)? 1 : 0;
    assign addr_out = (counter1 == 3)? addr[1] + 1 : addr[counter1] + counter0; 
    
    always @(posedge clk) begin
    
        //counters
        
        if (rst) begin
            counter0 <= 0;
            counter1 <= 0;
        end else if (counter0 == 2) begin
            counter0 <= 0;
            counter1 <= counter1 + 1;
        end else begin
            counter0 <= counter0 + 1;
        end
        
        //logic for address indexing 0 1 2 1024 1025 1026 2048 2049 2050 ...
        
        if (rst) begin
            addr[0] <= 0;
            addr[1] <= 1024;
            addr[2] <= 2048;
        end else if (counter0 == 2 && counter1 == 3) begin
            addr[0] <= addr[0] + 1;
            addr[1] <= addr[1] + 1;
            addr[2] <= addr[2] + 1;
        end
    
    end

endmodule