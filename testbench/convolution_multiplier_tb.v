///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: convolution_multiplier_tb.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS250T_ES> <Package::FCVG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1 ps/1 ps

module convolution_multiplier_tb();
    reg [7:0] factor_in_1, factor_in_2; 
    wire [15:0] prod_out;
    reg clk = 0;
    convolution_multiplier dut(.factor1(factor_in_1), .factor2(factor_in_2), .product(prod_out), .clk(clk));


initial begin
    forever begin
    #1 clk = ~clk;
    end
end
    
    
initial
    begin
    factor_in_1 = 21;
    factor_in_2 = 12; //252
    #2030
    factor_in_1 = 22; //242
    factor_in_2 = 11;
    #2030
    factor_in_1 = 32; //2400
    factor_in_2 = 75;
    #2030
    $stop;
    end
    
    
//<statements>

endmodule

