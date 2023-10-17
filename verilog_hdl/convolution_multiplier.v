

///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Rowan University
//
// File: convolution_multiplier.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// Convolution multiplier implementing the karatsuba algorithm
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS250T_ES> <Package::FCVG484>
// Author: Thomas Rasa
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>


module convolution_multiplier(input clk, input [7:0] factor1, factor2, output reg [15:0] product);


function [15:0] karatsuba;
input [7:0] x, y;
reg [15:0] result;
reg [3:0] a, b, c, d, n2;
reg [7:0] ac, ad, bc, bd;
reg [15:0] ad_bc;
begin

   // if(x < 4'b1010 || y < 4'b1010) begin
     //       return x*y;
   // end else begin
        
        
        n2 = 4; //n over 2, n is always 8 if recursion is not used
        
        //if(x > y) begin
        //  n2 = ($bits(x))/2;
        //end else begin
        //    n2 = ($bits(y))/2;
        //end
            
        a = x[7:4];
        b = x[3:0];
        c = y[7:4];
        d = y[3:0];
            
        ac = a*c;
        ad = a*d;
        bc = b*c;
        bd = b*d;
        
        ad_bc = ((a + b)*(c + d)) - ac - bd;

        karatsuba = ac * 2**(2 * n2) + (ad_bc * 2**n2) + bd;
    end
//end 

endfunction

    
always @(posedge clk) begin

    product = karatsuba(factor1,factor2);
    
end



endmodule