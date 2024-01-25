`timescale 1ns/1ps

module skibidi;

parameter SYSCLK_PERIOD = 10;

reg SYSCLK;
reg NSYSRESET;
reg [2:0] sel;
reg [31:0] AIN;
reg [31:0] BIN;
reg DI_VALID;
wire DO_VALID;
wire [31:0] convolutionwoo;

//it breaks when i use a normal clock, idk why, this is taken from the fpu's files
initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end
initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
end
initial sel=0; 
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK; 

//youre so skibidi
picklerick gyatt (.clk(SYSCLK),.NRST(NSYSRESET),.AIN(AIN), .BIN(BIN),.sel(sel),.convolutionwoo(convolutionwoo),.DO_VALID(DO_VALID),.DI_VALID(DI_VALID),.OVFL(OVFL),.NaN(NaN),.INF(INF));

//these are copied from the provided testbench to test FPU
initial begin
	DI_VALID <= 1'b0;
    #100; 
    AIN <= 32'h000003f8; BIN <= 32'h00000000; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h00000000; BIN <= 32'h00000000; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000003F8; BIN <= 32'h000003F8; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000003F8; BIN <= 32'h00000BF8; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h00000BF8; BIN <= 32'h00000BF8; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h00000BF8; BIN <= 32'h00000000; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000ccccd; BIN <= 32'h00000000; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000ccccd; BIN <= 32'h00043354; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h00000000; BIN <= 32'h00000000; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h00089680; BIN <= 32'h00091B40; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h0005465F; BIN <= 32'h00016779; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000C1440; BIN <= 32'h0000BDC2; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000C1440; BIN <= 32'h0000BDC2; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000FFFFF; BIN <= 32'h000EE1E3; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h00000000; BIN <= 32'h000EE1E3; DI_VALID <= 1'b1;
    #10;
    AIN <= 32'h000C37EF; BIN <= 32'h00005C17; DI_VALID <= 1'b1;
    #10 ;
    AIN <= 32'h000CCCCD; BIN <= 32'h000CCCCD; DI_VALID <= 1'b1;
    #10 ;
    AIN <= 32'h000CCCCD; BIN <= 32'h000CCCCD; DI_VALID <= 1'b1;
    #10 ;
    AIN <= 32'h000CCCCD; BIN <= 32'h000CCCCD; DI_VALID <= 1'b1;
    #10 ;
    AIN <= 32'h000CCCCD; BIN <= 32'h000CCCCD; DI_VALID <= 1'b1;
    #10 ;
    AIN <= 32'h000F57F9; BIN <= 32'h00000088; DI_VALID <= 1'b1;
    #10 ;
    repeat (1000) begin
        AIN <= $random; BIN <= $random; DI_VALID <= 1'b1; sel <=sel+1;
        #10;
    end
end

endmodule